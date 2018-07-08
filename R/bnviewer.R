#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


if(!require("visNetwork")){
  install.packages("visNetwork")
  require("visNetwork", quietly = TRUE)
}


#' Interactive Bayesian Network Plots
#'
#' @param bayesianNetwork A structure of a Bayesian Network
#' (Example : hill-climbing (HC)).
#'
#' @param bayesianNetwork.title Bayesian Network title
#'
#' @param bayesianNetwork.subtitle Bayesian Network subtitle
#'
#' @param bayesianNetwork.footer Bayesian Network footer
#'
#' @param bayesianNetwork.layout A layout of a Bayesian Network
#' \enumerate{
#'   \item layout_on_sphere
#'   \item layout_on_grid
#'   \item layout_in_circle
#'   \item layout_as_star
#'   \item layout_as_tree
#'   \item layout_with_sugiyama
#'   \item layout_with_kk
#'   \item layout_with_dh
#'   \item layout_with_lgl
#'   \item layout_with_mds
#'   \item layout_with_gem
#'   \item layout_nicely
#'   \item layout_components
#' }
#'
#' @param bayesianNetwork.width Bayesian Network width
#'
#' @param bayesianNetwork.height Bayesian Network height
#'
#' @param node.shape A node shape of a Bayesian Network
#' \enumerate{
#'   \item dot (default)
#'   \item circle
#'   \item ellipse
#'   \item database
#'   \item diamond
#'   \item square
#'   \item triangle
#'   \item box
#'   \item star
#'   \item text
#' }
#'
#' @param node.label.prefix Adds a prefix to the node label
#'
plot <- function(bayesianNetwork,
                 bayesianNetwork.title = "",
                 bayesianNetwork.subtitle = "",
                 bayesianNetwork.footer = "",
                 bayesianNetwork.layout = "default",
                 bayesianNetwork.width = "100%",
                 bayesianNetwork.height = "500px",

                 node.shape = c("dot"),
                 node.label.prefix = "",
                 node.colors = list(),

                 edges.smooth = TRUE,
                 edges.dashes = TRUE,

                 options.highlightNearest = TRUE,
                 options.nodesIdSelection = FALSE

                 ){

  #BN.Learn Object
  if ("learning"  %in% names(bayesianNetwork) &
      "nodes"  %in% names(bayesianNetwork) &
      "arcs"  %in% names(bayesianNetwork))
  {

    nodes = names(bayesianNetwork$nodes)
    from.collection = bayesianNetwork$arcs[,1]
    to.collection = bayesianNetwork$arcs[,2]

    nodes <- data.frame(id = nodes,
                        label = paste(node.label.prefix, nodes),
                        shape = node.shape)

    edges <- data.frame(from = from.collection,
                        to = to.collection,
                        smooth=edges.smooth,
                        dashes=edges.dashes)

    #background = '#000000'
    vis.network = visNetwork::visNetwork(nodes,
               edges,
               width = bayesianNetwork.width,
               height = bayesianNetwork.height,
               main = bayesianNetwork.title,
               submain = bayesianNetwork.subtitle,
               footer = bayesianNetwork.footer)

    if (length(node.colors) > 0){
      vis.network = visNetwork::visNodes(vis.network, color = node.colors)
    }

    vis.network = visNetwork::visEdges(vis.network, arrows = "to")
    vis.network = visNetwork::visOptions(vis.network, highlightNearest = options.highlightNearest,
                 nodesIdSelection = options.nodesIdSelection)

    if (bayesianNetwork.layout != "default"){
      visNetwork::visIgraphLayout(vis.network, layout = bayesianNetwork.layout)
    }
    else{
      visNetwork::visLayout(vis.network, randomSeed = 123)
    }

  }

}

export <- function(bayesianNetwork, type = "png", name = "network")
{
  visNetwork::visExport(bayesianNetwork, type = type, name = name)
}

#' Save Bayesian Network into HTML file.
#'
#' @param bayesianNetwork A structure of a Bayesian Network
#' (Example : hill-climbing (HC)).
#' @param file Name of file. (Example : bayesianNetwork.html).
#'
save <- function(bayesianNetwork, file = "bayesianNetwork.html")
{
  visNetwork::visSave(bayesianNetwork, file = file)
}
