Materials : Materials.md
	pandoc -s -S --toc Materials.md -o Materials.html
	open Materials.html

fixme:
	grep FIXME *.md
