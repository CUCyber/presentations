# Hypervisor Detection

By: Nick Bulischeck, Foster McLane, Mackenzie Binns

CU Cyber


## You Can Find These Presentations Online

Visit [cucyber.net](https://cucyber.net/) to find these presentations and more online!



# Clone Me

```sh
$ git clone https://github.com/nbulischeck/pcode.git
```



# Tools

* Inline Assembly (x86, Intel Syntax)
* C Programming


## Inline Assembly

* What is it?
* Benefits
	- Read and write C variables from assembler
	- Perform jumps from assembler code to C labels
	- Look cool `8)`

* `.intel_syntax` - Papa Bless
* inline.c


### Example Assembly

```c
asm("movl $1,%eax;"
    "xorl %ebx,%ebx;"
    "int  $0x80");
```


### Example C

```c
void exit(int status);
```


## Extended Inline Assembly Format

```c
asm [volatile] (AssemblerTemplate 
                : OutputOperands 
                [ : InputOperands
                [ : Clobbers ] ])
```


### Example Assembly

```c
asm("int $0x80;"
    :
    :"a"(4), "b"(1), "c"(str), "d"(len));
```


### Example C

```c
ssize_t write(int fd, const void *buf, size_t count);
```


## Inline Assembly

What does this do?

* `%0`, `%1`, etc. are operands
* `%%` is a register

```c
asm("movl %0, %%eax;"
    : "=a"(fd));
```


### System Call

* `%eax` - Syscall Number (unistd\_32{64}.h)
	- `%ebx, %ecx, %edx, %esi, %edi, %ebp`
* return value in `%eax`


## C


### Predefined Processor Macros

* What are they?
* Wrap processor specific code

#### preproc

```c
#include <stdio.h>

int main(){
#if defined (__x86_64__) || defined(_M_X64)
    printf("64 BIT!\n");
#elif defined (__i386) || defined(_M_IX86)
    printf("32 BIT!\n");
#endif
	return 0;
}
```


### Miscellaneous Macros

```c
#define ELEMENTSOF(x)                                          \
__extension__ (__builtin_choose_expr(                          \
       !__builtin_types_compatible_p(typeof(x), typeof(&*(x))),\
       sizeof(x)/sizeof((x)[0]),                               \
       (void)0))
```

```c
ELEMENTSOF(cpuid_vendor_table)
```



# Hypervisor Detection


## CPUID

* `CPUID` opcode is a processor supplementary instruction
* x86 Architecture
* Allows software to discover details of the processor
* `%eax` and sometimes `%ecx` specify what to return


### CPUID

* How does this help us?
* `%eax` = 0 - get vendor
* `%eax` = 1 - processor info and feature bits
* `HV` present bit - bit 31 of `%ecx` of `CPUID` leaf `0x1`


### CPUID

| Vendor ID          | String            |
| -----------------  | ----------------- |
| KVM                | "KVMKVMVKM"       |
| Microsoft Hyper-V  | "Microsoft Hv"    |
| Windows Virtual PC | "Microsoft Hv"    |
| Parallels          | " lrpepyh vr"     |
| VMWare             | "VMwareVMware"    |
| Xen HVM            | "XenVMMXenVMM"    |


### CPUID

* `%eax` = 1
* CPU's:
	- stepping
	- model
	- family information in `%eax`
* feature flags in `%edx` and `%ecx`
* additional feature info in `%ebx`


### CPUID

#### cpuidVirt.c

```c
#if defined(__i386__) || defined(__x86_64__)

static const struct {
	const char *cpuid;
	int id;
} cpuid_vendor_table[] = {
	{ "XenVMMXenVMM", VIRTUALIZATION_XEN       },
	{ "KVMKVMKVM",    VIRTUALIZATION_KVM       },
	{ "VMwareVMware", VIRTUALIZATION_VMWARE    },
	{ "Microsoft Hv", VIRTUALIZATION_MICROSOFT },
};
```


### CPUID

More processor macros!

#### cpuidVirt.c

```c
#if defined (__i386__)
#define REG_a "eax"
#define REG_b "ebx"
#elif defined (__amd64__)
#define REG_a "rax"
#define REG_b "rbx" 
#endif
```


### CPUID

```c
eax = 1;
__asm__ __volatile__ (
	"  push %%"REG_b"         \n\t"
	"  cpuid                  \n\t"
	"  pop %%"REG_b"          \n\t"
	: "=a" (eax), "=c" (ecx)
	: "0" (eax)
);

hypervisor = !!(ecx & 0x80000000U);
```

* `hypervisor` is true if 31st bit of `%ecx` is set after setting `%eax` to 1
* it is always `0` on a real CPU, but also with some hypervisors.
* double unary not normalizes value to either `0` or `1`


### CPUID

```c
void cpuid(int a, unsigned int *eax, unsigned int *ebx, unsigned int *ecx, unsigned int *edx) {
	__asm__("cpuid" :
			"=a"(*eax), 
			"=b"(*ebx), 
			"=c"(*ecx), 
			"=d"(*edx)
			:"0"(a)
	);
}
```


### CPUID

`%ebx`, `%ecx`, `%edx` contain hypervisor vendor id

```c
eax = 0x40000000U; // Hypervisor CPUID Information Leaf
__asm__ __volatile__ (
"  push %%"REG_b"         \n\t"
"  cpuid                  \n\t"
"  mov %%ebx, %1          \n\t"
"  pop %%"REG_b"          \n\t"
: "=a" (eax), "=r" (sig.sig32[0]), 
 "=c" (sig.sig32[1]), "=d" (sig.sig32[2])
: "0" (eax)
);
```

Match and we're done!


### CPUID

* `ebx` = `VMwa`
* `ecx` =`reVM`
* `edx` = `ware`


## DMI Strings

* Desktop Management Interface strings
* Also known as System Management BIOS (SMBIOS)
* Data Structures and accesss methods that read BIOS information


### DMI Strings

#### Common Linux Files

```c
static const char *const dmi_vendors[] = {
	"/sys/class/dmi/id/product_name",
	"/sys/class/dmi/id/sys_vendor",
	"/sys/class/dmi/id/board_vendor",
	"/sys/class/dmi/id/bios_vendor"
};
```


### DMI Strings

```c
static const struct {
	const char *vendor;
	int id;
} dmi_vendor_table[] = {
	{ "KVM",           VIRTUALIZATION_KVM       },
	{ "QEMU",          VIRTUALIZATION_QEMU      },
	{ "VMware",        VIRTUALIZATION_VMWARE    },
	{ "VMW",           VIRTUALIZATION_VMWARE    },
	{ "innotek GmbH",  VIRTUALIZATION_ORACLE    },
	{ "VirtualBox",    VIRTUALIZATION_ORACLE    },
	{ "Xen",           VIRTUALIZATION_XEN       },
	{ "Bochs",         VIRTUALIZATION_BOCHS     },
	{ "Parallels",     VIRTUALIZATION_PARALLELS },
};
```


### DMI Strings

* Why would you want to use this?
* Hypervisors like VirtualBox don't set bit 31


## VMWare Specific

* Uses "/sys/class/dmi/id/sys\_vendor"
* VMware, VMW, and VMw
* VMware says to also check hardware port


### VMWare Specific

* `vmwareHVPORT.c`
* I/O port that programs can query to detect if software is running in a VMware hypervisor
* VMware hypervisor is detected by performing an `IN` operation to port `0x5658`


### VMWare Specific

```c
#define VMWARE_HYPERVISOR_MAGIC 	0x564D5868
#define VMWARE_HYPERVISOR_PORT  	0x5658
#define VMWARE_PORT_CMD_GETVERSION      10
#define UINT_MAX 			0xFFFFFFFF

#define VMWARE_PORT(eax, ebx, ecx, edx, a, b, c, d){
__asm__("inl %%dx"
		:"=a"(*eax), "=b"(*ebx), "=c"(*ecx), "=d"(*edx)
		:"0"(a), "1"(b), "2"(c), "3"(d) );
}
```


### VMWare Specific

```c
VMWARE_PORT(&eax, &ebx, &ecx, &edx, 
			VMWARE_HYPERVISOR_MAGIC, UINT_MAX, 
			VMWARE_PORT_CMD_GETVERSION, 
			VMWARE_HYPERVISOR_PORT);

if (ebx == VMWARE_HYPERVISOR_MAGIC) {
	return 1;
} else { return 0; }
```


### VMWare Specific

* Why do you need both DMI strings and VMWare port?
* CPUID doesn't work for guest code running at CPL3 when VT/AMD-V is not enabled/available.
* The HVPB and HV information leaf are only defined for products based on VMware hardware version 7.



# Further reading

* VD.txt
* systemd



# Questions?
