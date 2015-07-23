PANDOC=pandoc

ROOT=""

PANDOCARGS=-t revealjs -s -V theme=night --css=http://lab.hakim.se/reveal-js/css/theme/night.css \
					 --css=$(ROOT)/css/ucl_reveal.css --css=$(ROOT)/site-styles/reveal.css \
           --default-image-extension=png --highlight-style=zenburn --mathjax -V revealjs-url=http://lab.hakim.se/reveal-js

default: _site

%/slides.html: %/*.md
	cat $^ | $(PANDOC) $(PANDOCARGS) -o $@

%.png: %.py Makefile
	python $< $@

%.png: %.nto Makefile
	neato $< -T png -o $@

%.png: %.dot Makefile
	dot $< -T png -o $@

%.png: %.uml Makefile
	plantuml -p < $< > $@

%.html: %.ipynb Makefile jekyll.tpl
	ipython nbconvert --to html  --ExecutePreprocessor.timeout=120 --template jekyll.tpl --execute --stdout $< > $@

combined.ipynb: notebooks/*.ipynb
	python nbmerge.py $^ $@

notes.pdf: combined.ipynb Makefile
	ipython nbconvert --to pdf --ExecutePreprocessor.timeout=120 --template report --execute $<
	mv combined.pdf notes.pdf

master.zip: Makefile
	rm -f master.zip
	wget https://github.com/UCL-RITS/indigo-jekyll/archive/master.zip

indigo-jekyll-master: Makefile master.zip
	rm -rf indigo-jekyll-master
	unzip master.zip
	touch indigo-jekyll-master

indigo: indigo-jekyll-master Makefile
	cp -r indigo-jekyll-master/indigo/images .
	cp -r indigo-jekyll-master/indigo/js .
	cp -r indigo-jekyll-master/indigo/css .
	cp -r indigo-jekyll-master/indigo/_includes .
	cp -r indigo-jekyll-master/indigo/_layouts .
	cp -r indigo-jekyll-master/indigo/favicon* .
	touch indigo

.PHONY: ready

ready: indigo notebooks/00pythons.html notebooks/010exemplar.html notebooks/023types.html \
			 notebooks/015variables.html notebooks/016using_functions.html \
			 notebooks/025containers.html notebooks/028dictionaries.html \
			 notebooks/032conditionality.html notebooks/035looping.html \
			 notebooks/029structures.html \
			 notebooks/037comprehensions.html \
			 notebooks/04functions.html \
			 notebooks/050import.html \
			 notebooks/060files.html \
			 notebooks/061internet.html \
			 notebooks/062csv.html \
			 notebooks/064JsonYamlXML.html \
			 notebooks/066QuakesSolution.html \
			 notebooks/072plotting.html \
			 notebooks/082NumPy.html \
			 notebooks/084Boids.html \
			 notebooks/091Libraries.html \
			 notebooks/101Classes.html \
			 notebooks/110Capstone.html

_site: ready
	jekyll build	

preview: ready
	jekyll serve

clean:
	rm -rf notebooks/*.html
	rm -f index.html
	rm -rf _site
	rm -rf images js css _includes _layouts favicon* master.zip indigo-jekyll-master

