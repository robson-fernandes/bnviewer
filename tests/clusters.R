library(bnlearn)
library(bnviewer)

data("alarm")
bayesianNetwork.structure.alarm = hc(alarm)

viewer(bayesianNetwork.structure.alarm,
       # bayesianNetwork.enabled.interactive.mode = TRUE,
       bayesianNetwork.width = "100%",
       bayesianNetwork.height = "100vh",
       bayesianNetwork.layout = "layout_in_circle",
       edges.smooth = FALSE,
       node.colors = list(background = "white",
                          border = "black",
                          highlight = list(background = "#e91eba",
                                           border = "black")),

       node.font = list(color = "black", face="Arial"),

       clusters.legend.title = list(text = "Legend"),

       clusters.legend.options = list(

               list(label = "Pressure",
                    shape = "icon",
                    icon = list(code = "f111", size = 50, color = "#e91e63")),
               list(label = "Volume",
                    shape = "icon",
                    icon = list(code = "f111", size = 50, color = "#03a9f4")),
               list(label = "Ventilation",
                    shape = "icon",
                    icon = list(code = "f111", size = 50, color = "#4caf50")),
               list(label = "Saturation",
                    shape = "icon",
                    icon = list(code = "f111", size = 50, color = "#ffc107"))
       ),

       clusters = list(
               list(label = "Pressure",
                    shape = "icon",
                    icon = list(code = "f111", color = "#e91e63"),
                    nodes = list("CVP","BP","HRBP","PAP","PRSS")),
               list(label = "Volume",
                    shape = "icon",
                    icon = list(code = "f111", color = "#03a9f4"),
                    nodes = list("MINV","MVS","LVV","STKV")),
               list(label = "Ventilation",
                    shape = "icon",
                    icon = list(code = "f111", color = "#4caf50"),
                    nodes = list("VALV","VLNG","VTUB","VMCH")),
               list(label = "Saturation",
                    shape = "icon",
                    icon = list(code = "f111", color = "#ffc107"),
                    nodes = list("HRSA","SAO2","PVS"))
       )
)
