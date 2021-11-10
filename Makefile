NOTEBOOKS=$(filter-out %.v2.ipynb %.nbconvert.ipynb,$(wildcard 0?-*/*.ipynb))

HTMLS=$(NOTEBOOKS:.ipynb=.html)

EXECUTED=$(NOTEBOOKS:.ipynb=.nbconvert.ipynb)

NBV2=$(NOTEBOOKS:.ipynb=.v2.ipynb)

default: _site

%.html: %.nbconvert.ipynb Makefile jekyll.tpl
	jupyter nbconvert --to html  --template jekyll.tpl --stdout $< > $@

combined.ipynb: $(EXECUTED)
	python nbmerge.py $^ $@

%.nbconvert.ipynb: %.ipynb
	jupyter nbconvert --to notebook --allow-errors --ExecutePreprocessor.timeout=120 --execute --stdout $< > $@

%.v2.ipynb: %.nbconvert.ipynb
	jupyter nbconvert --to notebook --nbformat 2 --stdout $< > $@

notes.pdf: combined.ipynb Makefile
	jupyter nbconvert --to pdf --template latex.tplx $<
	mv combined.pdf notes.pdf

notebooks.zip: ${NBV2}
	zip -r notebooks $^

.PHONY: ready

ready: $(HTMLS) notebooks.zip

_site: ready
	jekyll build

preview: ready
	jekyll serve

clean:
	rm -rf *?-*/*.html
	rm -f index.html
	rm -rf _site
	rm -rf 0?-*/*.nbconvert.ipynb
	rm -rf 0?-*/*.v2.ipynb
	rm -f notes.pdf
	rm -rf combined*
	rm -rf images js css _includes _layouts favicon*
	rm -f 0?-*/boids_1.mp4
	rm -f 0?-*/draw_eight.py
	rm -f 0?-*/eight
	rm -f 0?-*/eight.py
	rm -rf 0?-*/greengraph/
	rm -f 0?-*/maze.json
	rm -f 0?-*/maze.yaml
	rm -rf 0?-*/mazetool/
	rm -f 0?-*/polynomials.svg
	rm -f 0?-*/mydata.txt
	rm -f 0?-*/myfile.json
	rm -f 0?-*/myfile.yaml
	rm -f 0?-*/mywrittenfile
	rm -f 0?-*.zip
	rm -f 0?-*/*.pyc
	rm -rf 0?-*/maze
	rm -rf 0?-*/data
