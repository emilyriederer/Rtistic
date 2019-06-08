# Rtistic <img src="man/figures/logo.png" align="right" height=140/>

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

Tactically, this may work the best if individuals break off into small groups to work on separate themes. Ideas of prompts could be each team creates their own theme for:

- A monochromatic theme for each color of the rainbow
- A character on a TV show
- A season of the year

## Contents

### The Workhorse

`R/palette-infrastructure.R` contains all of the fuctions that users will ultimately call to apply the different palettes. This should be left as-is except for renaming all the functions from `*_rtistic` to whatever is desirable. Specifically, it defines the following scales:

- `scale_(color/colour/fill)_discrete_rtistic(palette = "test", extend = FALSE)`
- `scale_(color/colour/fill)_opinionated_rtistic(palette = "test")`
- `scale_(color/colour/fill)_continuous_rtistic(palette = "test")`
- `scale_(color/colour/fill)_diverging_rtistic(palette = "test", midpoint = 5)`

Additionally, to help keep track of all of the community-contributed themes, it provides the `get_rtistic_palettes()` function which prints out a characted vector of the names of available palettes (based on scanning the package namespace for objects ending in "`_pal`")

### Scratchpad Files for Experimentation

The following files are available in the `scratchpad/` directory to help with the design process by quickly iterating on style choices:

- `rmd-theme-demo.Rmd`: An RMarkdown document with an in-line CSS chunk. Ultimately, CSS will be moved to a separate file for your final theme package, but having it embedded in the document allows for fast and transparent iteration to see the effects of different options
- `gg-theme-demo.Rmd`: An RMarkdown document with dummy data and `ggplot2` with a lot of theme options. The current ggplot is pretty ugly, but this is an attempt to provide a near one-stop-shop overview into `ggplot2` theme options that participants can manipulate

### Helpers for Working with Images

Including a logo or image in a self-contained RMarkdown requires translating that image into a text representation (called a URI). This folder helps users to abstract that process with the following files:

- `my-footer-template.html`: Defines a combination of HTML code and a special `{LOGO}` placeholder
- `my-logo.png`: An example logo. Additional logos can be kept here for convenience and package reproducibility
- `generate-footer-logo.R`: A script that defines a function to convert footer template and logo files to a final footer file

### Boilerplate Code to Edit

Boilerplate package code exists in the `R/` and `inst/` directories:

- `my-gg-palette.R`: Defines colors of choice and uses them to create discrete (fixed number, interpolated, and opinionated) and continuous (monotonic and diverging) color palettes
- `my-gg-theme.R`: Defines theme function for custom `ggplot2`s
- `my-html-format.R`: Defines render function for custom RMarkdown themes. This depends upon:
  + `inst/rmarkdown/resources/footer.html`: Custom HTML footer for inclusion in RMarkdown
  + `inst/rmarkdown/resources/logo.png`: Custom logo for inclusion in RMarkdown footer
  + `inst/rmarkdown/resources/styles.css`: Custom CSS to style RMarkdown

Boilerplate code also exists in the `vignettes/` directory:

- `my-gg-theme-vignette.R`: contains an array of basic plots to demonstrate the new themes created

These are the files that participants should ultimately save under new names, edit, and PR back to the package. Other files should not be edited.

## High-Level Process

**Admin Instructions**:

*Initial Set Up - Template Approach*

- Generate your own repo from this template by going to [this link](https://github.com/emilyriederer/Rtistic/generate)
- Clone the repo to your computer (`git clone {put HTTPS URL here}`)
- Replace all mentions of the package name (`Rtistic`) to your desired package name
  + If you're using RStudio, you can find all mentions of the name with `Ctrl+Shift+F`
  + Be sure to use the `available` package to make sure your name does not conflict with an existing package
- Help teams keep their work clean and modular and review PRs carefully as they come in
- As a finals step, consider making a basic `pkgdown` site with all of the themes. Vignettes created by individual teams will beome articles to display all of the different new themes as a "gallery". (For help *also* customizing this, you'll find a template style sheet in `pkgdown/extra.css`)

*Initial Set Up - Forking Approach*

- Fork this repo to your account
- Clone the repo to your computer (`git clone {put HTTPS URL here}`)
- Replace all mentions of the package name (`Rtistic`) to your desired package name
  + If you're using RStudio, you can find all mentions of the name with `Ctrl+Shift+F`
  + Be sure to use the `available` package to make sure your name does not conflict with an existing package
- Create a new repo for your hackathon package and repoint your local repo to it (`git remote set-url origin {put HTTPS URL here}`)

*Ongoing Process*

- Help teams keep their work clean and modular and review PRs carefully as they come in
- As a finals step, consider making a basic `pkgdown` site with all of the themes. Vignettes created by individual teams will beome articles to display all of the different new themes as a "gallery". (For help *also* customizing this, you'll find a template style sheet in `pkgdown/extra.css`)

**Participant / Team Instructions**:

- Fork the repo (on GitHub) created by the admin
- Clone the repo to your computer (`git clone {put HTTPS URL here}`)
- Create a new branch to work in (`git checkout -b my-new-theme` will create a branch called `my-new-theme`)
- Play in the `scratchpad/` directory to determine CSS and `ggplot2` options that you like
- Review the files in the `R/` and `inst/` folders and migrate your options accordingly
- Commit regularly as you make changes with informative messages (`git commit -m "{describe what you changed}"`)
- When you're ready to submit, push back to your github branch (`git push origin my-new-theme` - or whatever your branch is called)
- On GitHub, create a pull request with yor changes back to the main repo

## Detailed Instructions for Participants

### ggplot Palette Instructions

#### Defining the palette

- Make a copy of the `R/my-gg-palette.R` file in the same folder. Rename it as `{theme}-palette.R` where `{theme}` represents something descriptive about your theme.
- Change the definitions of the variables `test_pal`, `test_pal_cont`, and `test_pal_div` and rename the `test` prefix to something appropriate (probably the `{theme}` stub)
- Update the documentation to describe your pallete
- Save your file and run it locallly

#### Documenting the palette

- Make a copy of the `vignettes/my-gg-theme-vignette` in the same folder. Rename it as `{theme}-vignette.Rmd`
- Change references to the test palette throughout and point them to your newly-defined palette
- Run the vignette chunks interactively to view your palettes. Iterate between this file and the R script defining the palettes until you are happy with the results.
- Be sure to change any boilerplat text and update the vignette's title in the YAML header
- Since vignettes serve as long-form documentation, add some descriptive text about what this palette is meant to represent

### ggplot Theme Instructions

#### Defining the theme

- Check out existing themes linked in the Resources section below for inspiration (and reuse!)
- Open up the `scratchpad/gg-theme-demo.Rmd` file and play around with the supplied theme to understand the options
- Iterate until you like the settings you have made. `ggplot2` has very nice defaults, so don't feel obligated to make major -- or any -- changes if you don't want to.
- Make a copy of the `R/my-gg-theme.R` file in the same folder. Rename it as `{theme}-theme.R`
- Change the name of the function being defined to `theme_{theme}`
- Move the code you created in the RMarkdown into the function definition 
- Update the documentation to describe your theme
- Save your file and run it locally

#### Documenting the theme

- If you have not already done so, make a copy of the `vignettes/my-gg-theme-vignette` in the same folder. Rename it as `{theme}-vignette.Rmd`
- Find where the `gg_points` and `gg_distrb` plot objects are defined at the top of the script. Add onto this code with `+ theme_{theme}()` to apply your theme to the plots
- Be sure to change any boilerplat text and update the vignette's title in the YAML header
- Since vignettes serve as long-form documentation, add some descriptive text about what motivated this theme

### RMarkdown Theme Instructions

#### Defining CSS for your theme

- Check out existing themes linked in the Resources section below for inspiration (and reuse!)
- Open up the `scratchpad/rmd-theme-demo.Rmd` file and play around with the supplied CSS to understand the options
- Iterate until you like the settings you have made. Like `ggplot2`, RMarkdown has very nice defaults, so don't feel obligated to make major -- or any -- changes if you don't want to.
- Make a copy of the `inst/rmarkdown/resources/my-styles.css` file in the same folder. Rename it as `{theme}-styles.css`. Move your CSS code from the scratchpad into this file

#### Defining a footer for your theme

*If your footer has a logo:*

- Make a copy of the `footer-helpers/my-footer-template.html` file in the same folder. Rename is as `{theme}-footer-template.html`. Edit this to represent what your footer should look like. 
- Use `{LOGO}` (**including** the curly braces) as a placeholder for where the logo should go in the HTML template.
- Add a logo to the `footer-helpers` folder 
- Run the code in the `generate_footer_logo.R` file to locally definie the `generate_footer_logo()` function
- Read this functions documentation. Then run it by passing in the paths to your template and logo. Send the final output to `inst/rmarkdown/resources/{theme}-footer.html`

*If your footer does not have a logo*

- - Make a copy of the `inst/rmarkdown/resources/my-footer.html` file in the same folder. Rename is as `{theme}-footer.html`. Edit this to represent what your footer should look like. 

#### Defining the theme

- Make a copy of the `R/my-html-format.R` file in the same folder. Rename it as `{theme}-html-format.R`
- Change the name of the function being defined to `{theme}_html_format`
- Edit the lines of code that provide the filepath for `css` and `footer` to the files you have defined
- Pull up the documentation for `rmarkdown::html_document()`, learn about the other parameters you can pass in, and decide if there are any other changes that you want to make
- Update the documentation to describe your theme

## Resources

### Core Learning Pre-Work

Understanding core R, `ggplot2`, and CSS concepts before the hackathon will make it easier to suceed.

- [Visualize Your Data primer on RStudio Cloud](https://rstudio.cloud/learn/primers/3): Starts with the basics of `ggplot2` and works its way up to a final section including plot customization. This will be useful for those wanting to create a new plot theme. The course does not have to be taken end-to-end, so those familiar with `ggplot2` can skip directly to the "Customization" section.
- [Basic CSS course from FreeCodeCamp](https://learn.freecodecamp.org/): Learn the basics of CSS will help participants understand what can be easily changed in an RMarkdown theme and how to do it.
- [Instructions for pull requests on GitHub](https://guides.github.com/activities/hello-world/): If you plan to use GitHub for team collaboration, this succinct overview explains how teams can submit their work through pull requests

### Brainstorming

Looking at existing themes can spark creativity. More tactically, one can also borrow from these themes in their own designs.

- [ggplot2 theme gallery](https://datascienceplus.com/ggplot2-themes-examples/): A preview of some common `ggplot2` themes. It also bears mention to participants that there are countless more themes in other projects and packages.
- [ggplot2 Replace Functionality](https://ggplot2.tidyverse.org/reference/theme_get.html): If you want to leave an existing theme almost completely in-tact, learn about the replace function to modiy select components of a pre-existing theme.
- [RMarkdown theme gallery](http://www.datadreaming.org/post/r-markdown-theme-gallery/): As above, this blog demos a number of RMarkdown themes. Obviously, the collection is not comprehensive, but it gives a nice overview for context.

### Developer Utilities

- [Selector Gadget tool](https://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html): This browser widget can help participants explore the structure of an RMarkdown HTML output and find the HTML tags they want to style.
- [Chrome Developer Tools](https://developers.google.com/web/tools/chrome-devtools/inspect-styles/): Similarly, most browsers have robust tools for inspecting a website's source code. These instructions explain how to use Chrome's version.

## Credits

Boilerplate RMarkdown code is largely inspired by [Michael Harper's repo](https://github.com/dr-harper/example-rmd-templates) as referenced in the book [RMarkdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/).

Boilerplate code for `ggplot2` themes and palettes is inspired by Simon Jackson's [blog on corporate color palettes](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2), Florian Teschner's [code-through on creating a unicorn theme](https://www.r-bloggers.com/how-to-create-a-ggplot-theme-unicorn-edition/), and Garrick Aden-Buie's [`ggpomological` package](https://www.garrickadenbuie.com/project/ggpomological/)


