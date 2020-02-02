#' Test HTML template
#'
#' Loads additional style and template file
#'
#' @references https://raw.githubusercontent.com/dr-harper/example-rmd-templates/master/R/my_html_format.R
#'
#' @param toc should a table of contents be displayed?
#' @param theme Base RMarkdown theme on which to build. Defaults to "cosmo".
#'      (Note that \code{html_document} default is "lumen").
#' @param ... additional arguments provided to \code{html_document}
#' @export
#'
html_test <- function(
  toc = TRUE,
  theme = "cosmo",
  ...) {

  ## TODO: FAVICON
  ## 1. Save favicon.png in inst/rmarkdown/resources
  ## 2. Uncomment the lines of code below
  ## 3. Pass `in_header = favicon_file` as an argument to rmarkdown::includes() below
  ## 4. Delete these instructions (##)
  # create temp file for favicon ----
  # favicon_locn <- pkg_resource('rmarkdown/resources/favicon.png')
  # favicon_html <- paste0('<link rel="shortcut icon" href="',favicon_locn,'">')
  # favicon_file <- tempfile()
  # writeLines(favicon_html, favicon_file)

  # create file paths to package assets
  css    <- pkg_resource("rmarkdown/resources/html-styles-test.css")
  footer <- pkg_resource("rmarkdown/resources/footer-test.html")

  # call the base html_document function
  rmarkdown::html_document(
    css = css,
    includes = rmarkdown::includes(
      after_body = footer
      ),
    ...
  )

}
