#' Compare Namespace
#'
#' Compare NAMESPACE in \pkg{TAF} and \pkg{icesTAF}.
#'
#' @param tools.prod location of \code{TAF} and \code{icesTAF} repositories.
#'
#' @return
#' List of namespace entries that are different between the repositories.
#'
#' @export

compare.namespace <- function(tools.prod="~/git/ices/tools-prod")
{
  TAF <- readLines(file.path(tools.prod, "TAF/NAMESPACE"))
  icesTAF <- readLines(file.path(tools.prod, "icesTAF/NAMESPACE"))

  diff.TAF <- setdiff(TAF, icesTAF)
  diff.icesTAF <- setdiff(icesTAF, TAF)

  list(TAF=diff.TAF, icesTAF=diff.icesTAF)
}
