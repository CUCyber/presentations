CU Cyber Presentations
======================

In this repository are the markdown sources to presentations given by CU Cyber.

## Dependencies

* git
* rsync
* python3

## Building

To build all of the presentations into a hostable directory, edit the 'makefile' as desired and run 'make'. All of the necessary files that should be put on a web server will be created in the 'public' directory.

## Testing

To build all of the presentations and host them on a temporary local server, edit the 'makefile' as desired and run 'make serve'. Open your web browser to 'http://localhost:8000/'.

## Updating

To build all of the presenations and upload them to the website automatically, edit the 'makefile' as desired and for the website git repository location and run 'make update'. You must have push access to the repository at the specified directory.

## Cleaning

To clean out any generated files, run 'make clean'.
