#' Custom Color and Fill Scales
#'
#' Custom coloring and filling functions based on unique color palettes
#'
#' Specific functions include:
#' \itemize{
#' \item{scale_(color/colour/fill)_discrete_rtistic}{Discrete palette with either fixed or dynamically extended number of shades}
#' \item{scale_(color/colour/fill)_continuous_div_rtistic}{Continuous diverging color palette}
#' \item{scale_(color/colour/fill)_continuous}{COntinuous color palette}
#' }
#'
#' @references https://en.wikipedia.org/wiki/Traffic_light
#' @name scale_custom
#'
#' @param palette Name of color palette
#' @param extend Whether to extend discrete color palette to make sufficient colors for levels needed
#' @param ... Additional arguments to be passed to internal scale function
NULL

#' @rdname scale_custom
#' @export
scale_color_discrete_rtistic <- function(palette = "test", extend = FALSE, ...){

  pal <- utils::getFromNamespace(paste0(palette, "_pal"), "Rtistic")
  ggplot2::discrete_scale("colour", "test", manual_pal_flex(pal, extend), na.value = "grey50", ...)

}

#' @rdname scale_custom
#' @export
scale_colour_discrete_rtistic <- scale_color_discrete_rtistic

#' @rdname scale_custom
#' @export
scale_fill_discrete_rtistic <- function(palette = "test", extend = FALSE, ...){

  pal <- utils::getFromNamespace(paste0(palette, "_pal"), "Rtistic")
  ggplot2::discrete_scale("fill", "test", manual_pal_flex(pal, extend), na.value = "grey50", ...)

}

#' @rdname scale_custom
#' @export
scale_colour_continuous_div_rtistic <- function(palette = "test", ...) {

  pal <- utils::getFromNamespace(paste0(palette, "_pal_div"), "Rtistic")
  ggplot2::scale_colour_gradient2(low = pal[3], mid = pal[2], high = pal[1],...)

}

#' @rdname scale_custom
#' @export
scale_color_continuous_div_rtistic <- scale_colour_continuous_div_rtistic

#' @rdname scale_custom
#' @export
scale_fill_continuous_div_rtistic <- function(palette = "test", ...) {

  pal <- utils::getFromNamespace(paste0(palette, "_pal_div"), "Rtistic")
  ggplot2::scale_fill_gradient2(low = pal[3], mid = pal[2], high = pal[1],...)

}

#' @rdname scale_custom
#' @export
scale_colour_continuous_rtistic <- function(palette = "test", ...) {

  pal <- utils::getFromNamespace(paste0(palette, "_pal_cont"), "Rtistic")
  ggplot2::scale_colour_gradient(low = pal[1], high = pal[2],...)

}

#' @rdname scale_custom
#' @export
scale_color_continuous_rtistic <- scale_colour_continuous_rtistic

#' @rdname scale_custom
#' @export
scale_fill_continuous_rtistic <- function(palette = "test", ...) {

  pal <- utils::getFromNamespace(paste0(palette, "_pal_cont"), "Rtistic")
  ggplot2::scale_fill_gradient(low = pal[1], high = pal[2],...)

}

#' @keywords internal
manual_pal_flex <- function(values, extend = FALSE){

    force(values)
    function(n) {
      n_values <- length(values)
      if (n > n_values & !extend) {
        warning("This manual palette can handle a maximum of ",
                n_values, " values. You have supplied ", n, ".",
                call. = FALSE)
      }
      else if (n > n_values) {
        values <- grDevices::colorRampPalette(values)(n)
      }
      values[seq_len(n)]
    }

  }
