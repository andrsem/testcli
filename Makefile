html:
	asciidoctor \
		-b html5 \
		-a stylesheet=git-style.css \
		-a linkcss \
		-a sectanchors \
		-a sectids \
		-a toc=left \
		-a toclevels=3 \
		docs/cli.adoc
	echo "Html man pages generated"
