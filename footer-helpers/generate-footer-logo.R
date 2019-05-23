#' Generate HTML footer from template and image
#'
#' Adds image URI code to a footer template
#'
#' To use, run this file interactively to define the function, and then execute
#' code as shown in the example below in your console. Note that this is NOT
#' a function in the package. Don't be fooled by the roxygen2 documentation! =)
#'
#' @param logo_path Path the logo. Should be an image file in the \code{footer-helpers} directory
#' @param temp_path Path to footer template. Should be an HTML file in the \code{footer-helpers} directory
#' @param foot_path Path to desired footer destination. Should be an HTML file in the \code{inst/rmarkdown/resources} directory
#' @importFrom knitr image_uri
#' @importFrom xfun write_utf8
#' @importFrom glue glue
#'
#' @example {
#' generate_footer_logo(
#'   logo_path = "footer-helpers/my-logo.png",
#'   temp_path = "footer-helpers/my-footer-template.html",
#'   foot_path = "inst/rmarkdown/resources/my-footer.html"
#'   )
#' }

generate_footer_logo <- function(logo_path, temp_path, foot_path) {

  # convert image to text representation ----
  logo_uri  = knitr::image_uri(logo_path)
  logo_html = paste('<img class = "logo" src = ', logo_uri, '/>')

  # insert logo html into footer template ----
  footer_template_html = paste(readLines(temp_path), collapse = "\n")
  footer_html = glue::glue(footer_template_html, LOGO = logo_html)

  # write to file ----
  xfun::write_utf8(footer_html, foot_path)

}
