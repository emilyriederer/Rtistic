#' Test ggplot theme
#'
#' [ggplot2] plot theme based on...
#'
#' @param base_theme A base theme upon which additional theme-specific options are applied
#'
#' @references https://github.com/gadenbuie/ggpomological/blob/master/R/theme_pomological.R
#' @seealso [ggplot2::theme]
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' data <- data.frame(x = 1:10, y = 1:10)
#' ggplot(data, aes(x, y)) + geom_point() + theme_test()
#' }
#'
#'
#' @export

theme_test <- function(base_theme = ggplot::theme_minimal()) {

  base_theme +
  ggplot2::theme(
    title = ggplot2::element_text(hjust = 0.5, vjust = 0.5),
    plot.background = ggplot2::element_rect(fill = "lightblue")
  )

}
