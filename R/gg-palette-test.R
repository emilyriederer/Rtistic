#' Test palette
#'
#' This is a test palette inspired by stop-light colors
#'
#' @references https://en.wikipedia.org/wiki/Traffic_light
#' @name test_pal
NULL

#' @name test_pal
#' @export
# Define disrete palette
test_pal <- c(
  "#00A850", # green
  "#FEEF01", # yellow
  "#F58222", # orange
  "#E13C29"  # red
)

#' @name test_pal
#' @export
# Define opinionated discrete palette (good, neutral, bad)
test_pal_op <- c(test_pal[1], "grey50", test_pal[4])

#' @name test_pal
#' @export
# Define two colors for endpoints of continuous palette
test_pal_cont <- c(test_pal[1], test_pal[2])

#' @name test_pal
#' @export
# Define three colors for endpoints of diverging continuous pallete (high, middle, low)
test_pal_div  <- c(test_pal[1], test_pal[2], test_pal[4])
