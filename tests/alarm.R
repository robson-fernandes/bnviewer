library(bnlearn)
library(bnviewer)

data("alarm")
bn.learn.hc = hc(alarm)


viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_with_sugiyama",
     bayesianNetwork.title="Discrete Bayesian Network - Alarm",
     bayesianNetwork.subtitle = "Monitoring of emergency care patients",
     bayesianNetwork.footer = "Fig. 1 - Layout with Sugiyama",
     edges.dashes = FALSE
)

viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_on_grid",
     bayesianNetwork.title="Discrete Bayesian Network - Alarm",
     bayesianNetwork.subtitle = "Monitoring of emergency care patients",
     bayesianNetwork.footer = "Fig. 2 - Layout on grid",
     edges.dashes = FALSE,

     node.colors = list(background = "#f4bafd",
                        border = "#2b7ce9",
                        highlight = list(background = "#97c2fc",
                                        border = "#2b7ce9"))

)

viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_in_circle",
     bayesianNetwork.title="Discrete Bayesian Network - Alarm",
     bayesianNetwork.subtitle = "Monitoring of emergency care patients",
     bayesianNetwork.footer = "Fig. 3 - Layout in circle",
     edges.dashes = FALSE,

     node.colors = list(background = "red",
                        border = "black",
                        highlight = list(background = "black",
                                         border = "red"))

)
