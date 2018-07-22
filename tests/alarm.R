library(bnlearn)
library(bnviewer)

data("alarm")
bn.learn.hc = hc(alarm)


bn.viewer.hc.layout_with_sugiyama = viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_with_sugiyama",
     bayesianNetwork.title="Discrete Bayesian Network - Alarm",
     bayesianNetwork.subtitle = "Monitoring of emergency care patients",
     bayesianNetwork.footer = "Fig. 1 - Layout with Sugiyama",
     edges.dashes = FALSE
)

# Layout With Sugiyama
bn.viewer.hc.layout_with_sugiyama

bn.viewer.hc.layout_on_grid = viewer(bn.learn.hc,
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

# Layout on Grid
bn.viewer.hc.layout_on_grid

bn.viewer.hc.layout_in_circle = viewer(bn.learn.hc,
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

# Layout in Circle
bn.viewer.hc.layout_in_circle


#Save
save(bn.viewer.hc.layout_with_sugiyama, "bayesianNetwork_layout_with_sugiyama.html")
save(bn.viewer.hc.layout_on_grid, "bayesianNetwork_layout_on_grid.html")
save(bn.viewer.hc.layout_in_circle, "bayesianNetwork_layout_in_circle.html")
