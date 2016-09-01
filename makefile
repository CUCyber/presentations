THEME='blood'
TEMPLATE='./template.html'

OUTDIR='./public'

GENERATE='./generate.py'

all: reveal.js
	for file in `find . -path './reveal.js' -prune -o -type f -name '*.md' -a -not -name 'LICENSE.md' -a -not -name 'README.md' -print`; do \
		$(GENERATE) -o $(THEME) -t $(TEMPLATE) $${file} $(OUTDIR)/$${file%.md}; \
	done

	cp -r reveal.js/{css,js,lib,plugin} $(OUTDIR)

clean:
	rm -rf $(OUTDIR)

reveal.js:
	git submodule update --init --recursive

.PHONY: all clean
