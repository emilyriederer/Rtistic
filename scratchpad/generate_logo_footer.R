# convert logo to uri ----
logo   = "inst/rmarkdown/resources/logo.png"
logo_encoded = knitr::image_uri(logo)
logo_html = paste('<img class = "logo" src = ', logo_encoded, '/>')

# define boilerplate footer ----
footer_html =
'
<p style="text-align: center;">A work by <a href="https://github.com/holtzy/">$author$</a></p>
<p style="text-align: center;">Produced on $date$</p>
<p style="text-align: center;"><span style="color: #808080;"><em>YOUREMAIL@gmail.com</em></span></p>

  <!-- Add icon library -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Add font awesome icons -->
    <p style="text-align: center;">
      <a href="https://twitter.com/r_graph_gallery?lang=en" class="fa fa-twitter"></a>
        <a href="https://www.linkedin.com/in/yan-holtz-2477534a/" class="fa fa-linkedin"></a>
          <a href="https://github.com/holtzy/" class="fa fa-github"></a>
            </p>
'

# combine img html with footer ----
footer_final_html = paste(
  '&nbsp;<hr/>',
  #logo_html,
  paste(logo_html, '<p style = "text-align:center;">in partnerships with</p>', logo_html, sep = " "),
  footer_html,
  '&nbsp;',
  sep = "\n"
)

# write to file ----
footer_final_path = "inst/rmarkdown/resources/footer_final.html"
xfun::write_utf8(footer_final_html, footer_final_path)
