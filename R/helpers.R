#' Construction of dorothea regulons for viper analysis
#'
#' This function converts DoRothEA's regulons that are stored in a table to the
#' format required by the \code{\link[viper]{viper}} function.
#'
#' @param df A regulon table from dorothea package.
#'
#' @return Regulons in the \code{viper} format.
#'
#' @keywords internal
.df2regulon <- function(df) {
  regulon_list = split(df, df$tf)

  viper_regulons = lapply(regulon_list, function(regulon) {
    tfmode = stats::setNames(regulon$mor, regulon$target)
    list(tfmode = tfmode, likelihood = rep(1, length(tfmode)))
    })

  return(viper_regulons)
}
