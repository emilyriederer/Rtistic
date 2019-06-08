#' Test HTML template
#'
#' Loads additional style and template file
#'
#' @references https://raw.githubusercontent.com/dr-harper/example-rmd-templates/master/R/my_html_format.R
#'
#' @param toc should a table of contents be displayed?
#' @param ... additional arguments provided to \code{html_document}
#' @export
#'
html_test <- function(toc = TRUE, ...) {

  # create file paths to package assets
  css    <- pkg_resource("rmarkdown/resources/html-styles-test.css")
  footer <- pkg_resource("rmarkdown/resources/footer-test.html")

  # call the base html_document function
  rmarkdown::html_document(
    toc = toc,
    toc_float = TRUE,
    fig_width = 6.5,
    fig_height = 4,
    theme = "lumen",
    code_folding = "show",
    css = css,
    number_sections = TRUE,
    includes = rmarkdown::includes(
      after_body = footer),
    ...
  )

}
