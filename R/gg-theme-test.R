#' Test ggplot theme
#'
#' [ggplot2] plot theme based on...
#'
#' @references https://github.com/gadenbuie/ggpomological/blob/master/R/theme_pomological.R
#' @seealso [ggplot2::theme]
#' @param base_theme Starting theme of plot, default is
#'   [ggplot2::theme_minimal()]. Any elements set by `theme_test()` will
#'   overwrite the `base_theme` unless the specific parameter is explicitly set
#'   to `NULL`.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' data <- data.frame(x = 1:10, y = 1:10)
#' ggplot(data, aes(x, y)) + geom_point() + theme_test()
#' }
#'
#' @importFrom ggplot2 %+replace%
#'
#' @export

theme_test <- function(base_theme = ggplot2::theme_minimal()) {

  base_theme %+replace%
  ggplot2::theme(
    title = ggplot2::element_text(hjust = 0.5, vjust = 0.5),
    plot.background = ggplot2::element_rect(fill = "lightblue")
  )

}
