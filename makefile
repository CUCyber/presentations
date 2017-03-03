SHELL=/bin/bash

OUTDIR=public
ROOT=/presentations/

THEME=blood
TEMPLATE=./template.html

GENERATE=./generate.py
SERVE=./serve.py

WEBSITE=../website

SOURCES!=find * \( -path 'reveal.js' -o -path "$(OUTDIR)" \) -prune -o -type f -name '*.md' -a -not \( -name 'LICENSE.md' -o -name 'README.md' \) -print

all: $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal

serve: all
	$(SERVE) $(OUTDIR)

update: $(WEBSITE)$(ROOT)

clean:
	rm -rf "$(OUTDIR)"

$(OUTDIR)$(ROOT): $(SOURCES)
	for file in $?; do \
		rm -rf "$(OUTDIR)$(ROOT)$${file%.md}"; \
		"$(GENERATE)" -i "$${file%.md}" -r "$(ROOT)" -o "$(THEME)" -t "$(TEMPLATE)" -a "$${file%.md}.res" "$${file}" "$(OUTDIR)$(ROOT)$${file%.md}"; \
	done

	touch "$(OUTDIR)$(ROOT)"

reveal.js/lib:
	git submodule update --init --recursive

	sed -i -e 's/^\(\s*url:.*\) + window\.location\.search/\1/g' reveal.js/plugin/notes/notes.js

	wget -O reveal.js/lib/js/socket.io.js https://cdn.socket.io/socket.io-1.7.3.js

$(OUTDIR)$(ROOT)reveal: reveal.js/lib
	mkdir -p "$(OUTDIR)$(ROOT)"reveal

	rsync -av --delete reveal.js/{css,js,lib,plugin} "$(OUTDIR)$(ROOT)"reveal

	touch "$(OUTDIR)$(ROOT)"reveal

$(WEBSITE)$(ROOT): $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal
	rsync -av --delete "$(OUTDIR)$(ROOT)" "$(WEBSITE)$(ROOT)"

	git -C "$(WEBSITE)" add ".$(ROOT)"
	git -C "$(WEBSITE)" commit -m "update presentations"
	git -C "$(WEBSITE)" push

.PHONY: all serve update clean
