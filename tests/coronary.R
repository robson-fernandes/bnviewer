library(bnlearn)
library(bnviewer)

data(coronary)
bn.learn.hc = hc(alarm)


viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_on_grid",
     bayesianNetwork.title="Discrete Bayesian Network - Coronary",
     bayesianNetwork.subtitle = "Coronary heart disease data set",
     bayesianNetwork.footer = "Fig. 1 - Layout on grid",
     edges.smooth = TRUE,
     node.colors = list(background = "#f4bafd",
                        border = "#2b7ce9",
                        highlight = "#97c2fc")

    )

viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_as_star",
     bayesianNetwork.title="Discrete Bayesian Network - Coronary",
     bayesianNetwork.subtitle = "Coronary heart disease data set",
     bayesianNetwork.footer = "Fig. 1 - Layout as star",
     edges.smooth = TRUE,
     node.colors = list(background = "#f4bafd",
                        border = "#2b7ce9",
                        highlight = list(background = "#97c2fc",
                                         border = "#2b7ce9"))

)


viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_in_circle",
     bayesianNetwork.title="Discrete Bayesian Network - Coronary",
     bayesianNetwork.subtitle = "Coronary heart disease data set",
     bayesianNetwork.footer = "Fig. 1 - Layout with circle",
     edges.dashes = FALSE,

     node.colors = list(background = "red",
                        border = "black",
                        highlight = list(background = "black",
                                         border = "red"))

)
