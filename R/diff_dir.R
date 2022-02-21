#' Compare Directory
#'
#' Compare filenames in the R directory of \pkg{TAF} and \pkg{icesTAF}
#' repositories.
#'
#' @param tools.prod location of \code{TAF} and \code{icesTAF} repositories.
#'
#' @return List of filenames that are different between the repositories.
#'
#' @examples
#' \dontrun{
#' tools.prod <- "~/git/ices/tools-prod"
#' diff_dir(tools.prod)
#' }
#'
#' @export

diff_dir <- function(tools.prod="~/git/ices/tools-prod")
{
  TAF <- dir(file.path(tools.prod, "TAF/R"))
  icesTAF <- dir(file.path(tools.prod, "icesTAF/R"))

  diff.TAF <- setdiff(TAF, icesTAF)
  diff.icesTAF <- setdiff(icesTAF, TAF)

  list(TAF=diff.TAF, icesTAF=diff.icesTAF)
}
