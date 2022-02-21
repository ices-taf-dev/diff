#' Compare Namespace
#'
#' Compare entries in the \code{NAMESPACE} file of \pkg{TAF} and \pkg{icesTAF}
#' repositories.
#'
#' @param tools.prod location of \code{TAF} and \code{icesTAF} repositories.
#'
#' @return
#' List of \code{NAMESPACE} entries that are different between the repositories.
#'
#' @examples
#' \dontrun{
#' tools.prod <- "~/git/ices/tools-prod"
#' diff_namespace(tools.prod)
#' }
#'
#' @export

diff_namespace <- function(tools.prod="~/git/ices/tools-prod")
{
  TAF <- readLines(file.path(tools.prod, "TAF/NAMESPACE"))
  icesTAF <- readLines(file.path(tools.prod, "icesTAF/NAMESPACE"))

  diff.TAF <- setdiff(TAF, icesTAF)
  diff.icesTAF <- setdiff(icesTAF, TAF)

  list(TAF=diff.TAF, icesTAF=diff.icesTAF)
}
