#' @title Bayesian Network to iGraph Model
#'
#' @description Converts Bayesian network structure based on package "bnlearn"
#' and "bnviewer" to model based on package "igraph".
#'
#' @param bayesian.network  Bayesian Network structure.
#'
#' @references See online documentation \url{http://robsonfernandes.net/bnviewer}
#'
#' @import igraph
#'
#' @export
#'
#'
#'

bn.to.igraph <- function(bayesian.network){

  g <- igraph.from.graphNEL(bnlearn::as.graphNEL(bayesian.network))
  return(g)
}
