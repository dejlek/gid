
docs:
	rm -rf api doc_packages
	mkdir doc_packages
	find ../packages/ -maxdepth 1 -type d \
		\! -name packages \! -name gtk3 \! -name gdk3 \! -name gtksource4 \! -name vte2 \
		| xargs -i cp -r {} doc_packages/
	dub run adrdox -- doc_packages -o api --genSearchIndex
	cp style.css api

gen-adrdox: gen-adrdox.d
	ldc2 -of=gen-adrdox gen-adrdox.d
