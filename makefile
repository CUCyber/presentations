OUTDIR='./public'
ROOT='/presentations/'

THEME='blood'
TEMPLATE='./template.html'

GENERATE='./generate.py'

WEBSITE='../website'

all: reveal
	for file in `find . \( -path './reveal.js' -o -path $(OUTDIR) \) -prune -o -type f -name '*.md' -a -not \( -name 'LICENSE.md' -o -name 'README.md' \) -print`; do \
		rm -rf $(OUTDIR)$(ROOT)/$${file%.md}; \
		$(GENERATE) -i $$(echo $${file%.md} | cut -c3-) -r $(ROOT) -o $(THEME) -t $(TEMPLATE) -a $${file%.md}.res $${file} $(OUTDIR)$(ROOT)$${file%.md}; \
	done

	mkdir -p $(OUTDIR)$(ROOT)/reveal

	rsync -av --delete reveal.js/{css,js,lib,plugin} $(OUTDIR)$(ROOT)/reveal

serve: all
	cd $(OUTDIR); python3 -m http.server

update: all
	rsync -av --delete $(OUTDIR)$(ROOT) $(WEBSITE)$(ROOT)
	git -C $(WEBSITE) add .$(ROOT)
	git -C $(WEBSITE) commit -m "update presentations"
	git -C $(WEBSITE) push

clean:
	rm -rf $(OUTDIR)

reveal: reveal.js/lib

reveal.js/lib:
	git submodule update --init --recursive

	sed -i -e 's/^\(\s*url:.*\)window\.location\.search/\1window.location.hash/g' reveal.js/plugin/notes/notes.js

	wget -O reveal.js/lib/js/socket.io.js https://cdn.socket.io/socket.io-1.4.8.js

.PHONY: all serve update clean reveal
