# Doctoral programming intro

Notebooks containing lesson materials for 
[*An Introduction to research programming with Python*](http://rits.github-pages.ucl.ac.uk/doctoral-programming-intro/) 
course run at University College London (UCL) by the Research Software Development Group (RSDG).

## Using `nbstripout` to remove notebook outputs

To give more meaningful diffs and avoid system specific information such as paths in exception tracebacks
being committed to the repository all notebooks should have their outputs stripped before committing.

The Python package [`nbstripout`](https://github.com/kynan/nbstripout) is a convenient tool for automating
this process. It can be installed into the current Python environment by running

```bash
pip install nbstripout
```

To manually strip the outputs from all notebook in the `notebooks` directory the following can  then be run


```
nbstripout notebooks/*.ipynb
```

To avoid having to perform this step manually before adding files to the staging area, a Git filter
can instead be set up by running

```
nbstripout --install
```

This will apply `nbstripout` automatically to files added to the staging area (while leaving the files
in the working copy untouched).
