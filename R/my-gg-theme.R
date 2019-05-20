#' Pomological Theme
#'
#' [ggplot2] plot theme based on the USDA Pomological Watercolors paintings.
#'
#' @references https://usdawatercolors.nal.usda.gov/pom
#' @seealso [ggplot2::theme]
#' @param base_family Base text family. See **Fonts** in [theme_pomological()]
#'   for some examples from Google Fonts options, including `"Mr De Haviland"`,
#'   `"Homemade Apple"`, `"Marck Script"`, and `"Mr. Bedfort"`. For the
#'   authentic pomological look, use `"Homemade Apple"` or `"Mr De Haviland"`.
#'   Set to `NULL` or use [theme_pomological_plain()] for no change to fonts.
#' @param base_size Base text size
#' @param text.color Color of all text (except axis text, see `axis.text.color`)
#' @param plot.background.color Color of plot background, passed to `plot.background`
#' @param panel.border.color Color of plot panel border
#' @param with.panel.grid If `FALSE` gridlines in plot are removed
#' @param panel.grid.color,panel.grid.linetype Color and linetype of panel grid, passed to `panel.grid`
#' @param axis.text.color,axis.text.size Color and size of axis text
#' @param base_theme Starting theme of plot, default is
#'   [ggplot2::theme_minimal()]. Any elements set by `theme_pomological()` will
#'   overwrite the `base_theme` unless the specific parameter is explicitly set
#'   to `NULL`.
#'
#' @examples
#' library(ggplot2)
#' basic_iris_plot <- ggplot(iris) +
#'   aes(x = Sepal.Length, y = Sepal.Width, color = Species) +
#'   geom_point(size = 2) +
#'   # with pomological color scale
#'   scale_color_pomological()
#'
#' @export

theme_test <- function(base_theme = ggplot2::theme_minimal) {

  base_theme

}
