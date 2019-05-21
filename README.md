# Rtistic

**THIS REPO IS A WORK IN PROGRESS - DO NOT CURRENTLY ATTEMPT TO USE!**

## Intro

The goal of `Rtistic` is to provide an easy 'hackathon-in-a-box' activity groups of R users. Users can collaborate to create a collection of custom themes for `ggplot2` and RMarkddown.

The focus of Rtistic is to provide the basic outline for an R package that can be forked and used for the 'infrastructure' of a styling and theming package developed in a group setting. A lot of the boilerplate RMarkdown and `ggplot2` code is already written, so participants can focus on the fun and creative process of picking colors, fonts, spacing, etc. 

While `Rtistic` is intended to be fun and light-hearted. It also has real benefits for team building and training, including:

- Learning more about `ggplot2` and RMarkdown customization options
- Writing `roxygen2`-style documentation
- Looking under the hood at the structure of an R package
- Working collaboratively through GitHub (with branches, PRs, etc.)

Of course, depending on how much time you want to spend on this activity and where you want to focus (e.g. learning `ggplot2` options versus learning basic CSS for RMarkdown), any number of the parts can be scaled back. For example:

- Only build either `ggplot2` or RMarkdown themes instead of both
- Have participant share just a single `R` file instead of working with a package structure (e.g. )
- Allow participants to email / upload their output somewhere else and not worry about making a PR


## Contents

### Scratchpad Files for Experimentation

The following files are available in the `scratchpad/` directory to help with the design process:

- `css-demo.Rmd`: An RMarkdown document with an in-line CSS chunk. Ultimately, CSS will be moved to a separate file for your final theme package, but having it embedded in the document allows for fast and transparent iteration to see the effects of different options
- `gg-theme-demo.Rmd`: An RMarkdown document with dummy data and `ggplot2` with a lot of theme options. The current ggplot is pretty ugly, but this is an attempt to provide a near one-stop-shop overview into `ggplot2` theme options that participants can manipulate


### Boilerplate Code To be Edited

Boilerplate package code exists in the `R/` and `inst/` directories:

- `my-gg-palette.R`:
- `my-gg-theme.R`:
- `my-html-format.R`: Defines render function for customer RMarkdown theme. This depends upon:
  + `inst/rmarkdown/resources/footer.html`: Custom HTML footer for inclusion in RMarkdown
  + `inst/rmarkdown/resources/logo.png`: Custom logo for inclusion in RMarkdown footer
  + `inst/rmarkdown/resources/styles.css`: Custom CSS to style RMarkdown

Boilerplate code also exists in the `vignettes/` directory:

- `gg-theme-vignette.R`: contains an array of basic plots on which new themes can be demoed

These are the files that participants should ultimately save under new names, edit, and PR back to the package.

## Process

Admin Instructions:

- Fork this repo to your account
- Clone the repo to your computer (`git clone {{put HTTPS URL here}}`)
- Replace all mentions of the package name (`Rtistic`) to your desired package name
  + If you're using RStudio, you can find all mentions of the name with `Ctrl+Shift+F`
  + Be sure to use the `available` package to make sure your name does not conflict with an existing package
- Create a new repo for your hackathon package and repoint your local repo to it (`git remote set-url origin {{put HTTPS URL here}}`)
- Help teams keep their work clean and modular and review PRs carefully as they come in

Participant / Team Instructions:

- Fork the repo (on GitHub) created by the admin
- Clone the repo to your computer (`git clone {{put HTTPS URL here}}`)
- Create a new branch to work in (`git checkout -b my-new-theme` will create a branch called `my-new-theme`)
- Play in the `scratchpad/` directory to determine CSS and `ggplot2` options that you like
- Review the files in the `R/` and `inst/` folders and migrate your options accordingly
- Commit regularly as you make changes with informative messages (`git commit -m "{{what you changed}}"`)
- When you're ready to submit, push back to your github branch (`git push origin {{your branch name}}`)
- On GitHub, create a pull request with yor changes back to the main repo

## Resources

For more resources and advanced topics on styling `ggplot2` plot and RMarkdown documents, here are some resources that you can recommend to participants before your hackathon:

- [Visualize Your Data primer on RStudio Cloud](https://rstudio.cloud/learn/primers/3): Starts with the basics of `ggplot2` and works its way up to a final section including plot customization. This will be useful for those wanting to create a new plot theme. The course does not have to be taken end-to-end, so those familiar with `ggplot2` can skip directly to the "Customization" section.
- [Basic CSS course from FreeCodeCamp](https://learn.freecodecamp.org/): Learn the basics of CSS will help participants understand what can be easily changed in an RMarkdown theme and how to do it.
- [The Selector Gadget tool](https://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html) can help participants explore the structure of an RMarkdown HTML output and find the HTML tags they want to style.

## Credits

Boilerplate RMarkdown code is largely inspired by [Michael Harper's repo](https://github.com/dr-harper/example-rmd-templates) as referenced in the book [RMarkdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/).

Boilerplate code for `ggplot2` themes and palettes is inspired by Simon Jackson's [blog on corporate color palettes](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2), Florian Teschner's [code-through on creating a unicorn theme](https://www.r-bloggers.com/how-to-create-a-ggplot-theme-unicorn-edition/), and Garrick Aden-Buie's [`ggpomological` package](https://www.garrickadenbuie.com/project/ggpomological/)


