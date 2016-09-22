OUTDIR='./public'
ROOT='/presentations/'

THEME='blood'
TEMPLATE='./template.html'

GENERATE='./generate.py'

WEBSITE='../website'

all: reveal.js/js
	for file in `find . \( -path './reveal.js' -o -path $(OUTDIR) \) -prune -o -type f -name '*.md' -a -not \( -name 'LICENSE.md' -o -name 'README.md' \) -print`; do \
		rm -rf $(OUTDIR)$(ROOT)/$${file%.md}; \
		$(GENERATE) -r $(ROOT) -o $(THEME) -t $(TEMPLATE) -a $${file%.md}.res $${file} $(OUTDIR)$(ROOT)$${file%.md}; \
	done

	rsync -av --delete reveal.js/{css,js,lib,plugin} $(OUTDIR)$(ROOT)

serve: all
	cd $(OUTDIR); python3 -m http.server

update: all
	rsync -av --delete $(OUTDIR)$(ROOT) $(WEBSITE)$(ROOT)
	git -C $(WEBSITE) add .$(ROOT)
	git -C $(WEBSITE) commit -m "update presentations"
	git -C $(WEBSITE) push

clean:
	rm -rf $(OUTDIR)

reveal.js/js:
	git submodule update --init --recursive

.PHONY: all serve update clean
