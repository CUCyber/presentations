SHELL=/bin/bash

OUTDIR=public
ROOT=/presentations/

THEME=blood
TEMPLATE=template.html

GENERATE=generate.py
SERVE=serve.py

WEBSITE=../website

SOURCES!=find * \( -path 'reveal.js' -o -path "$(OUTDIR)" \) -prune -o -type f -name '*.md' -a -not \( -name 'LICENSE.md' -o -name 'README.md' \) -print

all: $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal

website: $(WEBSITE)$(ROOT)

serve: $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal
	"./$(SERVE)" "$(OUTDIR)"

update: $(WEBSITE)$(ROOT)
	git -C "$(WEBSITE)" add ".$(ROOT)"
	git -C "$(WEBSITE)" commit -m "update presentations"
	git -C "$(WEBSITE)" push

clean:
	rm -rf "$(OUTDIR)"

$(OUTDIR)$(ROOT): $(SOURCES)
	mkdir -p $(OUTDIR)$(ROOT)
	for file in $?; do \
		rm -rf "$(OUTDIR)$(ROOT)$${file%.md}"; \
		"./$(GENERATE)" -i "$${file%.md}" -r "$(ROOT)" -o "$(THEME)" -t "$(TEMPLATE)" -a "$${file%.md}.res" "$${file}" "$(OUTDIR)$(ROOT)$${file%.md}"; \
	done
	touch "$(OUTDIR)$(ROOT)"

reveal.js/package.json:
	git submodule update --init --recursive

$(OUTDIR)$(ROOT)reveal/lib/js/socket.io.js:
	mkdir -p "$(OUTDIR)$(ROOT)"reveal/lib/js
	wget -O $(OUTDIR)$(ROOT)reveal/lib/js/socket.io.js https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.1/socket.io.js

$(OUTDIR)$(ROOT)reveal: reveal.js/package.json $(OUTDIR)$(ROOT)reveal/lib/js/socket.io.js
	mkdir -p "$(OUTDIR)$(ROOT)"reveal
	rsync -av --delete reveal.js/{css,js,lib,plugin} "$(OUTDIR)$(ROOT)"reveal
	touch "$(OUTDIR)$(ROOT)"reveal

$(WEBSITE)$(ROOT): $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal
	rsync -av --delete "$(OUTDIR)$(ROOT)" "$(WEBSITE)$(ROOT)"
	touch "$(WEBSITE)$(ROOT)"

.PHONY: all website serve update clean
