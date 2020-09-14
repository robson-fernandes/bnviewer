library(bnlearn)
library(bnviewer)

bayesianNetwork = hc(gaussian.test)

viewer(bayesianNetwork,
       bayesianNetwork.data = gaussian.test,
       bayesianNetwork.correlation.show = TRUE,
       bayesianNetwork.correlation.method = "pearson",
       bayesianNetwork.width = "100%",
       bayesianNetwork.height = "80vh",
       bayesianNetwork.layout = "layout_in_circle",
       bayesianNetwork.title="Continuous Bayesian Network - Gaussian",
       bayesianNetwork.subtitle = "<br>Gaussian Test data set",
       edges.smooth = FALSE,
       edges.font.size = 16,
       edges.shadow = TRUE,
       edges.width = 1.5,
       node.colors = list(background = "black",
                          border = "blue",
                          highlight = "blue")

)
