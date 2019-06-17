#' Test HTML template
#'
#' Loads additional style and template file
#'
#' @references https://raw.githubusercontent.com/dr-harper/example-rmd-templates/master/R/my_html_format.R
#'
#' @param ... additional arguments provided to \code{moon_reader}
#' @export
#'
slides_test <- function(...) {

  # confirm deps ----
  if (!requireNamespace("xaringan", quietly = TRUE)) {
    stop("Package xaringan must be installed to use custom slide styles")
  }

  # create file paths to package assets ----
  css    <- pkg_resource("rmarkdown/resources/slide-styles-test.css")

  # call the base html_document function ----
  xaringan::moon_reader(
    seal = FALSE,
    css = css,
    ...
  )

}
