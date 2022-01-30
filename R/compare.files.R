#' Compare Files
#'
#' Compare \code{*.R} files in \pkg{TAF} and \pkg{icesTAF}.
#'
#' @param tools.prod location of \code{TAF} and \code{icesTAF} repositories.
#'
#' @return List of filenames that are different between the repositories.
#'
#' @examples
#' \dontrun{
#' tools.prod <- "~/git/ices/tools-prod"
#' compares.files(tools.prod)
#' }
#'
#' @export

compare.files <- function(tools.prod="~/git/ices/tools-prod")
{
  TAF <- dir(file.path(tools.prod, "TAF/R"))
  icesTAF <- dir(file.path(tools.prod, "icesTAF/R"))

  diff.TAF <- setdiff(TAF, icesTAF)
  diff.icesTAF <- setdiff(icesTAF, TAF)

  list(TAF=diff.TAF, icesTAF=diff.icesTAF)
}
