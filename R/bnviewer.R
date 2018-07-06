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

require(visNetwork, quietly = TRUE)

plot <- function(bn.learn,
                 visNetwork.width = "100%",
                 visNetwork.height = "500px",
                 visOptions.highlightNearest = TRUE,
                 visOptions.nodesIdSelection = FALSE,
                 edges.smooth = TRUE,
                 edges.dashes = TRUE
                 ){

  #BN.Learn Object
  if ("learning"  %in% names(bn.learn) &
      "nodes"  %in% names(bn.learn) &
      "arcs"  %in% names(bn.learn))
  {

    nodes = names(bn.learn$nodes)
    from.collection = bn.learn$arcs[,1]
    to.collection = bn.learn$arcs[,2]

    nodes <- data.frame(id = nodes,
                        label = paste("Node", nodes))

    edges <- data.frame(from = from.collection,
                        to = to.collection,
                        smooth=edges.smooth,
                        dashes=edges.dashes)

    #background = '#000000'
    visNetwork(nodes,
               edges,
               width = visNetwork.width,
               height = visNetwork.height) %>%
      visEdges(arrows = "to") %>%
      visOptions(highlightNearest = visOptions.highlightNearest,
                 nodesIdSelection = visOptions.nodesIdSelection) %>%
      visLayout(randomSeed = 123)

  }

}
