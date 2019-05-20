#' Custom Color and Fill Scales
#'
#' Custom coloring and filling functions based on unique palettes
#'
#' @references https://en.wikipedia.org/wiki/Traffic_light
#' @name scale_custom
NULL

pal <- c(
  "#00A850", # green
  "#FEEF01", # yellow
  "#F58222", # orange
  "#E13C29"  # red
)

#' @rdname scale_custom
#' @export
scale_colour_discrete_test <- function(...) {

  ggplot2::discrete_scale("colour", "test", scales::manual_pal(pal), na.value = "grey50", ...)

}

#' @rdname scale_custom
#' @export
scale_color_discrete_test <- scale_colour_discrete_test

#' @rdname scale_custom
#' @export
scale_fill_discrete_test <- function(...) {

  ggplot2::discrete_scale('fill', 'test', scales::manual_pal(pal), na.value = "grey50", ...)

}


#' @rdname scale_custom
#' @export
scale_color_discrint_test <- function(vec, ...) {

  n <- length(unique(vec))
  pal_int <- grDevices::colorRampPalette(pal)( n )
  ggplot2::discrete_scale('colour', 'test', scales::manual_pal(pal_int), ...)

}

#' @rdname scale_custom
#' @export
scale_colour_discrint_test <- scale_color_discrint_test

#' @rdname scale_custom
#' @export
scale_fill_discrint_test <- function(vec, ...) {

  n <- length(unique(vec))
  pal_int <- grDevices::colorRampPalette(pal)( n )
  ggplot2::discrete_scale('fill', 'test', scales::manual_pal(pal_int), ...)

}

#' @rdname scale_custom
#' @export
scale_colour_contdiv_test <- function(...) {

  ggplot2::scale_colour_gradient2(low = pal[4], mid = pal[2], high = pal[1],...)

}

#' @rdname scale_custom
#' @export
scale_color_contdiv_test <- scale_colour_contdiv_test

#' @rdname scale_custom
#' @export
scale_fill_contdiv_test <- function(...) {

  ggplot2::scale_fill_gradient2(low = pal[1], mid = pal[2], high = pal[1],...)

}

#' @rdname scale_custom
#' @export
scale_colour_cont_test <- function(...) {

  ggplot2::scale_colour_gradient(low = pal[1], high = pal[2],...)

}

#' @rdname scale_custom
#' @export
scale_color_cont_test <- scale_colour_cont_test

#' @rdname scale_custom
#' @export
scale_fill_cont_test <- function(...) {

  ggplot2::scale_fill_gradient(low = pal[1], high = pal[2],...)

}
