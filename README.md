# NovelAI UKB
Welcome to the Unofficial Knowledge Base for Novel AI.

We have ported our operations here from Miraheze due to their shutdown in August 2023.

To consult the UKB, open the [Github Pages](https://tapwavezodiac.github.io/novelaiUKB/) for this repository.

# Building
First, make sure you have both `make` and `pandoc` installed.
To build the docs, run `make`. The docs will then be rendered in the [build/](build/) directory. :warning: The result might look different between local and GitHub Pages, try to see the result on GitHub Pages if the local version seems satifying.

To edit a page and see changes rendered as you write, a Markdown viewer is recommended.

# Contributing
To contibute to the repository, you can submit a Pull Request. The relevant parts are:
* [docs/](docs/): where the content is located, with one HTML page per Markdown file
* [filters/](filters/): where the lua filters for the Pandoc generation are located
* [css/](css/): where the CSS stylesheets are located
* [template](template.html5): the template used for the Pandoc generation
