library(bnlearn)
library(bnviewer)

bn.learn.hc = hc(alarm)

viewer(bn.learn.hc,
       bayesianNetwork.width = "100%",
       bayesianNetwork.height = "80vh",
       bayesianNetwork.layout = "layout_on_grid",
       bayesianNetwork.title="Discrete Bayesian Network - Coronary",
       bayesianNetwork.subtitle = "Coronary heart disease data set",
       bayesianNetwork.footer = "Fig. 1 - Layout on grid",
       edges.smooth = TRUE,
       edges.shadow = TRUE,
       edges.width = 1.5,
       node.colors = list(background = "#f4bafd",
                          border = "#2b7ce9",
                          highlight = "#97c2fc")

)
