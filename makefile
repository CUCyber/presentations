THEME='blood'
TEMPLATE='./template.html'

OUTDIR='./public'

ROOT='/presentations/'

GENERATE='./generate.py'

all: reveal.js
	for file in `find . \( -path './reveal.js' -o -path './public' \) -prune -o -type f -name '*.md' -a -not \( -name 'LICENSE.md' -o -name 'README.md' \) -print`; do \
		rm -rf $(OUTDIR)$(ROOT)/$${file%.md}; \
		$(GENERATE) -r $(ROOT) -o $(THEME) -t $(TEMPLATE) -a $${file%.md}.res $${file} $(OUTDIR)$(ROOT)$${file%.md}; \
	done

	rsync -av --delete reveal.js/{css,js,lib,plugin} $(OUTDIR)$(ROOT)

clean:
	rm -rf $(OUTDIR)

reveal.js:
	git submodule update --init --recursive

.PHONY: all clean
