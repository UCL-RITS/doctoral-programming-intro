---
title: An introduction to programming for research using Python
---

# {{ page.title }}

In this course, we will introduce programming for researchers who handle data.

This is **not** an advanced course. The fundamental ideas of programming will be introduced for the first time.

However, **it is a course for graduate students** -- the content will be covered sufficiently fast that we can reach a point where you will be able to apply this knowledge to your research at the end of the course, and we will not try to hide away the niggling details that you will encounter in real programming.

## Topics covered

This course is broken into two sub-courses:

* [Part I](01-beginner/)
  - The different ways to use Python
  - Basic Python syntax
  - Types and data structures
  - Control flow with conditionals and loops
  - Structuring code with functions and libraries
  - Working with files
  - Basic data visualisation

* [Part II](02-novice/)
  - Getting data from the internet
  - Tabular and structured data files
  - Classes and object-oriented programming
  - Array-based programming with NumPy
  - Creating more complex visualisations with Matplotlib
  - Installing Python packages
  - Writing your own Python packages

## Alternatives

If you are already comfortable, with variables, loops, and functions, this course is not for you! You should join us instead for [MPHY0021: Research Software Engineering with Python](http://github-pages.ucl.ac.uk/rsd-engineeringcourse/).

# What you need for the course

We will use [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/), a web-based user interface for running Python notebooks and scripts, to view and run the notebooks in this course.

## Desktop@UCL or UCL cluster rooms

* Log in with your UCL user ID and password.
* Using the start menu, type "jupyter".
* Choose "Jupyter Lab".
* A browser should open showing the Jupyter Lab interface.

## On your own machine

If you can, we recommend using your own laptop to follow these notes, as the tools will then be ready for use in your research.

We recommend installing the [Anaconda distribution of Python](https://docs.anaconda.com/anaconda/) which includes Jupyter Lab and several other packages from the scientific Python ecosystem which we will make use of in this course. To install Anaconda [download the installer for your operating system](https://www.anaconda.com/download) (select the Anaconda Individual Edition Python 3.9 version) and [follow the installation instructions for your operating system in the Anaconda documentation](https://docs.anaconda.com/anaconda/install/).

Alternatively if you are already familiar with the Python packaging tool `pip` you can follow the [official Jupyter installation instructions](https://jupyter.org/install.html). As well as Jupyter Lab we will also make use of the Python pacakges [NumPy](https://numpy.org/install/), [Matplotlib](https://matplotlib.org/stable/users/installing/index.html), [GeoPy](https://geopy.readthedocs.io/en/stable/#installation), [Requests](https://docs.python-requests.org/en/latest/user/install/#install) and [PyYAML](https://pyyaml.org/wiki/PyYAMLDocumentation), so these will also need to be installed if you want to be able to run all of the code in the notebooks. Except for GeoPy all of these packages are included by default in Anaconda. We will cover how to install Python packages (and write your own!) in the second part of the course.

## Downloading the materials

You will want to download the [Jupyter notebooks for this course](notebooks.zip), and unzip them into an appropriate folder, so you can find them when you launch the notebook.  Alternatively, you can download each session from the download button on the top right corner.

# Following this course

## Self-supported learning

You can follow this course at your own pace at any time. If you need help, please contact rits-teaching@ucl.ac.uk and we will try to help you, though if you need a lot of help, you'll be better off coming to an organised instance.

## Supervised learning

We regularly run face-to-face (either in person or online) instances of this course. These course takes, in part, a "flipped classroom" approach to teaching:

In the olden days, before the internet, lectures were a "broadcast" medium: a way of getting information from the lecturer's notebook into students' notebooks. Work inside the classroom was used for sharing theory, and homework outside the classroom was used for exercises. In a world with an internet, this makes less sense.

We have provided online notes to cover the materials you need to know, and you can study these in your own time. Class time can then be used as a forum, to discuss confusing aspects of the materials, work on exercises with help from experienced teachers.

To learn more about the flipped classroom, see the [keynote by Lorena Barba at SciPy 2014](https://youtu.be/TWxwKDT88GU?t=669).

## Supplementary materials

In the past, lecture notes have been treated as a standalone textbook, assuming students need to be able to learn (and pass exams) without access to any other materials. In a world with an internet, this is clearly wrong. This course recognises that you *will* be searching for supplementary learning materials, and encourages that. The problem is that the internet is full of materials of varying quality, and attempting to absorb it all can leave learners even more confused.

Thus, good lecture notes should act as a scaffold or backbone to external materials: offering links to the best of the web, and ordering and structuring these. We've therefore often added links to other notes on the web.

# Guidance to teachers

If you find these notes on the internet, and want to teach them yourself, feel free to do so.

We don't provide slides; the assumption is you will use the Jupyter notebooks directly on the projector. We find students *believe us more* when they see code executed on-the-fly.

If you find mistakes, or have suggestions to improve the material, please send us a pull request on [GitHub](https://github.com/UCL-RITS/doctoral-programming-intro).

# License

These lecture notes are licensed with a [Creative Commons Attribution](https://creativecommons.org/licenses/by/4.0/) license.

## Data used

The [first exemplar notebook](01-beginners/000Exemplar.html) uses HadCRUT.5.0.1.0 data, obtained from the [Met Office's Hardcrut page](http://www.metoffice.gov.uk/hadobs/hadcrut5) on November 2021 and are © British Crown Copyright, Met Office 2020, provided under an [Open Government License](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
