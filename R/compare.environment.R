#' Compare Environment
#'
#' Compare environments in \pkg{TAF} and \pkg{icesTAF}.
#'
#' @return
#' List of environment entries that are different between the packages.
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
