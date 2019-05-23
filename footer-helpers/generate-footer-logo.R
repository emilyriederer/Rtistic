# Note: This script requires both knitr and glue!

# define I/O asset paths ----
logo_path = "footer-helpers/my-logo.png"
temp_path = "footer-helpers/my-footer-template.html"
foot_path = "inst/rmarkdown/resources/my-footer.html"

# convert image to text representation ----
logo_uri  = knitr::image_uri(logo_path)
logo_html = paste('<img class = "logo" src = ', logo_uri, '/>')

# insert logo html into footer template ----
footer_template_html = paste(readLines(temp_path), collapse = "\n")
footer_html = glue::glue(footer_template_html, LOGO = logo_html)

# write to file ----
xfun::write_utf8(footer_html, foot_path)
