NOTEBOOKS=$(filter-out %.v2.ipynb %.nbconvert.ipynb,$(wildcard notebooks/*.ipynb))

HTMLS=$(NOTEBOOKS:.ipynb=.html)

EXECUTED=$(NOTEBOOKS:.ipynb=.nbconvert.ipynb)

NBV2=$(NOTEBOOKS:.ipynb=.v2.ipynb)

default: _site

%.html: %.nbconvert.ipynb Makefile jekyll.tpl
	ipython nbconvert --to html  --template jekyll.tpl --stdout $< > $@

combined.ipynb: $(EXECUTED)
	python nbmerge.py $^ $@

%.nbconvert.ipynb: %.ipynb
	ipython nbconvert --to notebook --allow-errors --ExecutePreprocessor.timeout=120 --execute --stdout $< > $@

%.v2.ipynb: %.nbconvert.ipynb
	ipython nbconvert --to notebook --nbformat 2 --stdout $< > $@

notes.pdf: combined.ipynb Makefile
	ipython nbconvert --to pdf --template latex.tplx $<
	mv combined.pdf notes.pdf

notebooks.zip: ${NBV2}
	zip -r notebooks $^

master.zip: Makefile
	rm -f master.zip
	wget https://github.com/UCL-RITS/indigo-jekyll/archive/master.zip

indigo-jekyll-master: master.zip
	rm -rf indigo-jekyll-master
	unzip master.zip
	touch indigo-jekyll-master

indigo: indigo-jekyll-master
	cp -r indigo-jekyll-master/indigo/images .
	cp -r indigo-jekyll-master/indigo/js .
	cp -r indigo-jekyll-master/indigo/css .
	cp -r indigo-jekyll-master/indigo/_includes .
	cp -r indigo-jekyll-master/indigo/_layouts .
	cp -r indigo-jekyll-master/indigo/favicon* .
	touch indigo

.PHONY: ready

ready: indigo $(HTMLS) notes.pdf notebooks.zip

_site: ready
	jekyll build

preview: ready
	jekyll serve

clean:
	rm -rf notebooks/*.html
	rm -f index.html
	rm -rf _site
	rm -rf notebooks/*.nbconvert.ipynb
	rm -rf notebooks/*.v2.ipynb
	rm -f notes.pdf
	rm -rf combined*
	rm -rf images js css _includes _layouts favicon* master.zip indigo-jekyll-master
	rm -f indigo
	rm -f notebooks/boids_1.mp4
	rm -f notebooks/draw_eight.py
	rm -f notebooks/eight
	rm -f notebooks/eight.py
	rm -rf notebooks/greengraph/
	rm -f notebooks/maze.json
	rm -f notebooks/maze.yaml
	rm -rf notebooks/mazetool/
	rm -f notebooks/my_graph.png
	rm -f notebooks/mydata.txt
	rm -f notebooks/myfile.json
	rm -f notebooks/myfile.yaml
	rm -f notebooks/mywrittenfile
	rm -f notebooks.zip
	rm -f notebooks/*.pyc
	rm -rf notebooks/maze
	rm -rf notebooks/data
