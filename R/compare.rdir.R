#' Compare R Directory
#'
#' Compare files in the R directory of \pkg{TAF} and \pkg{icesTAF} repositories.
#'
#' @param tools.prod location of \code{TAF} and \code{icesTAF} repositories.
#'
#' @return List of filenames that are different between the repositories.
#'
#' @examples
#' \dontrun{
#' tools.prod <- "~/git/ices/tools-prod"
#' compare.rdir(tools.prod)
#' }
#'
#' @export

compare.rdir <- function(tools.prod="~/git/ices/tools-prod")
{
  TAF <- dir(file.path(tools.prod, "TAF/R"))
  icesTAF <- dir(file.path(tools.prod, "icesTAF/R"))

  diff.TAF <- setdiff(TAF, icesTAF)
  diff.icesTAF <- setdiff(icesTAF, TAF)

  list(TAF=diff.TAF, icesTAF=diff.icesTAF)
}
