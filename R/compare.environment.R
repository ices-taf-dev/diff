#' Compare Environment
#'
#' Compare objects in the environments \code{package:TAF} and
#' \code{package:icesTAF} in an R session.
#'
#' @return List of objects that are different between the environments.
#'
#' @examples
#' compare.environment()
#'
#' @export

compare.environment <- function()
{
  icesTAF <- ls(getNamespace("icesTAF"))
  TAF <- ls(getNamespace("TAF"))

  diff.TAF <- setdiff(TAF, icesTAF)
  diff.icesTAF <- setdiff(icesTAF, TAF)

  list(TAF=diff.TAF, icesTAF=diff.icesTAF)
}
