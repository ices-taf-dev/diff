#' Compare R File
#'
#' Compare the source code of a given R file line by line, between the \pkg{TAF}
#' and \pkg{icesTAF} repositories.
#'
#' @param file name of a \file{*.R} file, without the full path.
#' @param tools.prod location of \code{TAF} and \code{icesTAF} repositories.
#' @param ignore.internal whether to ignore lines containing the string
#'        \code{"TAF-internal"}.
#' @param ignore.noreturn whether to ignore lines containing the string
#'        \code{"No return value"}.
#' @param ignore.overview whether to ignore lines containing the string
#'        \code{"gives an overview of the package"}.
#' @param simplify whether to omit empty string vectors in the output.
#'
#' @return
#' List containing lines of code that are different between the R file in the
#' two repositories.
#'
#' @examples
#' \dontrun{
#' tools.prod <- "~/git/ices/tools-prod"
#' diff_file("draft.data.R", tools.prod)
#' }
#'
#' @export

diff_file <- function(file, tools.prod="~/git/ices/tools-prod",
                      ignore.internal=TRUE, ignore.noreturn=TRUE,
                      ignore.overview=TRUE, simplify=TRUE)
{
  TAF <- readLines(file.path(tools.prod, "TAF/R", file))
  icesTAF <- readLines(file.path(tools.prod, "icesTAF/R", file))
  if(ignore.internal)
  {
    omit <- "TAF-internal"
    TAF <- grep(omit, TAF, invert=TRUE, value=TRUE)
    icesTAF <- grep(omit, icesTAF, invert=TRUE, value=TRUE)
  }
  if(ignore.noreturn)
  {
    omit <- "No return value"
    TAF <- grep(omit, TAF, invert=TRUE, value=TRUE)
    icesTAF <- grep(omit, icesTAF, invert=TRUE, value=TRUE)
  }
  if(ignore.overview)
  {
    omit <- "gives an overview of the package"
    TAF <- grep(omit, TAF, invert=TRUE, value=TRUE)
    icesTAF <- grep(omit, icesTAF, invert=TRUE, value=TRUE)
  }

  diff.TAF <- setdiff(TAF, icesTAF)
  diff.icesTAF <- setdiff(icesTAF, TAF)

  out <- list(TAF=diff.TAF, icesTAF=diff.icesTAF)

  if(simplify)
  {
    if(length(out$TAF) == 0)
      out$TAF <- NULL
    if(length(out$icesTAF) == 0)
      out$icesTAF <- NULL
    if(length(out) == 0)
      out <- NULL
  }

  out
}
