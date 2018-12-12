#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


#' Interactive Bayesian Network Viewer
#'
#' @param bayesianNetwork A Bayesian Network structure. (Example : hill-climbing (HC)).
#'
#' @param bayesianNetwork.title : String. Bayesian Network title
#'
#' @param bayesianNetwork.subtitle : String. Bayesian Network subtitle
#'
#' @param bayesianNetwork.footer : String. Bayesian Network footer
#'
#' @param bayesianNetwork.layout : String. A layout of a Bayesian Network
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
#' @param bayesianNetwork.width : String. Bayesian Network width
#'
#' @param bayesianNetwork.height : String. Bayesian Network height
#'
#' @param node.shape : String. A node shape of a Bayesian Network
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
#' @param node.label.prefix : String. Adds a prefix to the node label
#'
#' @param node.colors : String | named list. Color for the node. Can be 'rgba(120,32,14,1)', '#97C2FC'
#' (hexa notation on 7 char without transparency) or 'red'.
#' Can be just one color, or a list with several elements:
#'
#' \enumerate{
#'   \item "background" : String. Default to '#97C2FC'. Background color for the node.
#'   \item "border" : String. Default to '#2B7CE9'. Border color for the node.
#'   \item "highlight" : String | named list, Color of the node when selected.
#'   \enumerate{
#'      \item "background" : String. Default to '#97C2FC'. Background color for the node when selected.
#'      \item "border" : String. Default to '#2B7CE9'. Border color for the node when selected.
#'   }
#' }
#'
#' @param edges.smooth : Boolean. When true, the edge is drawn as a dynamic quadratic bezier curve.
#'
#' @param edges.dashes : Array or Boolean. Default to false. When true, the edge will be drawn as a dashed line.
#'
#' @param options.highlightNearest : Boolean. Default to true. Highlight nearest when clicking a node.
#'
#' @param options.nodesIdSelection : Boolean. Default to false. Add an id node selection creating an HTML select element.
#'
#' @references See online documentation \url{http://robsonfernandes.net/bnviewer}
#'
#' @importFrom  methods is
#'
#' @export
#'
#' @examples
#'
#' library(bnlearn)
#' library(bnviewer)
#'
#' data(coronary)
#' bn.learn.hc = hc(coronary)
#'
#' viewer(bn.learn.hc,
#'      bayesianNetwork.width = "100%",
#'      bayesianNetwork.height = "80vh",
#'      bayesianNetwork.layout = "layout_as_star",
#'      bayesianNetwork.title="Discrete Bayesian Network - Coronary",
#'      bayesianNetwork.subtitle = "Coronary heart disease data set",
#'      bayesianNetwork.footer = "Fig. 1 - Layout as star",
#'      edges.smooth = TRUE,
#'      node.colors = list(background = "#f4bafd",
#'                         border = "#2b7ce9",
#'                         highlight = list(background = "#97c2fc",
#'                                          border = "#2b7ce9"))
#' )
#'
#'
viewer <- function(bayesianNetwork,
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
                   edges.dashes = FALSE,

                   options.highlightNearest = TRUE,
                   options.nodesIdSelection = FALSE

){

  #BNLearn Class
  BNLearnClass =  bnlearn::.__C__bn

  #BN.Learn Object
  if ("learning"  %in% names(bayesianNetwork) &
      "nodes"  %in% names(bayesianNetwork) &
      "arcs"  %in% names(bayesianNetwork) |
      is(bayesianNetwork,BNLearnClass))
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
