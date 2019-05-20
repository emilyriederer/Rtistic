#' Custom HTML template
#'
#' Loads additional style and template file
#'
#' From: https://raw.githubusercontent.com/dr-harper/example-rmd-templates/master/R/my_html_format.R
#'
#' @param toc should a table of contents be displayed?
#' @param ... additional arguments provided to \@code{html_document}
#' @export
#'
my_html_format = function(toc = TRUE, ...) {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "Rtistic")
  }

  css    = pkg_resource("rmarkdown/resources/styles.css")
  footer = pkg_resource("rmarkdown/resources/footer_final.html")

  # create file with encoded logo to insert
  # logo   = pkg_resource("rmarkdown/resources/logo.png")
  # logo_encoded = knitr::image_uri(logo)
  # logo_html = paste('&nbsp;<hr /><img class = "logo" src = ', logo_encoded, "/>")
  # logo_file = tempfile(fileext = ".html")
  # xfun::write_utf8(logo_html, logo_file)

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
      #in_header = logo_file,
      #after_body = c(logo_file,footer)),
    ...
  )

  #on.exit(unlink(logo_file), add = TRUE)

}
