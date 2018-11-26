library(bnlearn)
library(bnviewer)


bayesianNetwork.boot.strength = boot.strength(alarm, R = 20, algorithm = "hc")

avg.bayesianNetwork = averaged.network(bayesianNetwork.boot.strength, threshold = 0.2)

strength.viewer(
  avg.bayesianNetwork,
  bayesianNetwork.boot.strength,
  bayesianNetwork.background = "black",
  bayesianNetwork.arc.strength.threshold.expression = c("@threshold > 0 & @threshold < 0.5",
                                                        "@threshold >= 0.5 & @threshold < 0.6",
                                                        "@threshold >= 0.6 & @threshold <= 1"),
  bayesianNetwork.arc.strength.threshold.expression.color  = c("red", "yellow", "blue"),
  bayesianNetwork.arc.strength.threshold.alternative.color =  "white",

  bayesianNetwork.arc.strength.label = TRUE,
  bayesianNetwork.arc.strength.label.prefix = "",
  bayesianNetwork.arc.strength.label.color = "white",

  bayesianNetwork.arc.strength.tooltip = TRUE,

  bayesianNetwork.edge.scale.min = 1,
  bayesianNetwork.edge.scale.max = 3,

  bayesianNetwork.edge.scale.label.min = 14,
  bayesianNetwork.edge.scale.label.max = 14,

  bayesianNetwork.width = "100%",
  bayesianNetwork.height = "800px",
  bayesianNetwork.layout = "layout_with_sugiyama",
  node.colors = list(background = "black",
                     border = "#2b7ce9",
                     highlight = list(background = "#e91eba",
                                      border = "#2b7ce9")),

  node.font = list(color = "white", face="Arial"),
  edges.dashes = TRUE
)
