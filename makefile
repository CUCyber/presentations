SHELL=/bin/bash

OUTDIR=public
ROOT=/presentations/

THEME=blood
TEMPLATE=template.html
MULTIPLEX=https://reveal.cucyber.net

GENERATE=generate.py
SERVE=serve.py

WEBSITE=../website
SITE=

SOURCES!=find * \( -path '*.res' -o -path 'vendor' -o -path '$(OUTDIR)' \) -prune -o -type f -name '*.md' -a -not \( -name 'LICENSE.md' -o -name 'README.md' \) -print

all: $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal

website: $(WEBSITE)$(SITE)$(ROOT)

serve: $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal
	'./$(SERVE)' '$(OUTDIR)'

update: $(WEBSITE)$(SITE)$(ROOT)
	git -C '$(WEBSITE)' add '.$(SITE)$(ROOT)'
	git -C '$(WEBSITE)' commit -m 'update presentations'
	git -C '$(WEBSITE)' push

clean:
	rm -rf '$(OUTDIR)'

$(OUTDIR)$(ROOT): $(SOURCES)
	mkdir -p '$(OUTDIR)$(ROOT)'
	for file in $?; do \
		rm -rf '$(OUTDIR)$(ROOT)'"$${file%.md}"; \
		'./$(GENERATE)' -i "$${file%.md}" -r '$(ROOT)' -o '$(THEME)' -t '$(TEMPLATE)' -a "$${file%.md}.res" -m '$(MULTIPLEX)' "$${file}" '$(OUTDIR)$(ROOT)'"$${file%.md}"; \
	done
	touch '$(OUTDIR)$(ROOT)'

vendor/socket.io-client/package.json:
	git submodule update --init vendor/socket.io-client

vendor/multiplex/package.json: | vendor/socket.io-client/package.json
	git submodule update --init vendor/multiplex

vendor/reveal.js/package.json: | vendor/multiplex/package.json
	git submodule update --init vendor/reveal.js

$(OUTDIR)$(ROOT)reveal: vendor/socket.io-client/package.json vendor/multiplex/package.json vendor/reveal.js/package.json
	mkdir -p '$(OUTDIR)$(ROOT)'reveal
	rsync -av --delete --include '**/' --include '*.html' --include '*.woff' --include '*.eot' --include '*.ttf' --include '*.css' --exclude 'index.js' --exclude 'plugin.js' --exclude '*.esm.js' --include '*.js' --exclude '*' vendor/reveal.js/dist/ '$(OUTDIR)$(ROOT)'reveal/
	
	mkdir -p '$(OUTDIR)$(ROOT)'reveal/plugin
	rsync -av --delete --include '**/' --include '*.html' --include '*.woff' --include '*.eot' --include '*.ttf' --include '*.css' --exclude 'index.js' --exclude 'plugin.js' --exclude '*.esm.js' --include '*.js' --exclude '*' vendor/reveal.js/plugin/ '$(OUTDIR)$(ROOT)'reveal/plugin/
	
	mkdir -p '$(OUTDIR)$(ROOT)'reveal/ext/multiplex
	rsync -av --delete --include '**/' --include '*.html' --include '*.woff' --include '*.eot' --include '*.ttf' --include '*.css' --exclude 'index.js' --exclude 'plugin.js' --exclude '*.esm.js' --include '*.js' --exclude '*' vendor/multiplex/ '$(OUTDIR)$(ROOT)'reveal/ext/multiplex/
	
	mkdir -p '$(OUTDIR)$(ROOT)'reveal/lib/socket
	cp vendor/socket.io-client/dist/socket.io.slim.js '$(OUTDIR)$(ROOT)'reveal/lib/socket/socket.io.js
	
	find '$(OUTDIR)$(ROOT)'reveal -name '*.js' -exec sed -i -e '/^\/\/# sourceMappingURL=/d' '{}' ';'

$(WEBSITE)$(SITE)$(ROOT): $(OUTDIR)$(ROOT) $(OUTDIR)$(ROOT)reveal
	rsync -av --delete '$(OUTDIR)$(ROOT)' '$(WEBSITE)$(SITE)$(ROOT)'
	touch '$(WEBSITE)$(SITE)$(ROOT)'

.PHONY: all website serve update clean
