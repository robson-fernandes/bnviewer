library(bnlearn)
library(bnviewer)


model.right.arrow = " Age -> (GoodStudent,RiskAversion,SocioEcon, MedCost);
                          RiskAversion -> (DrivHist,DrivQuality);
                          RiskAversion -> (MakeModel, SeniorTrain);
                          MakeModel -> (Airbag, RuggedAuto, CarValue);
                          SocioEcon -> (RiskAversion, OtherCar);
                          SeniorTrain -> (DrivingSkill);
                          DrivingSkill -> (DrivHist, DrivQuality);
                          Accident -> (MedCost, ILiCost, OtherCarCost)
                        "

structure = model.to.structure(model.right.arrow)

viewer(structure,
       bayesianNetwork.width = "100%",
       bayesianNetwork.height = "100vh",
       # bayesianNetwork.enabled.interactive.mode = TRUE,
       edges.smooth = FALSE,
       bayesianNetwork.layout = "layout_with_gem",
       node.colors = list(background = "#f4bafd",
                         border = "#2b7ce9",
                         highlight = list(background = "#97c2fc",
                                          border = "#2b7ce9")),

       clusters.legend.title = list(text = "Legend"),

       clusters.legend.options = list(

         list(label = "Driving",
              shape = "icon",
              icon = list(code = "f111", size = 50, color = "#e91e63")),

         list(label = "Cost",
              shape = "icon",
              icon = list(code = "f111", size = 50, color = "#03a9f4"))
       ),

       clusters = list(
         list(label = "Driving",
              shape = "icon",
              icon = list(code = "f111", color = "#e91e63"),
              nodes = list("DrivingSkill","DrivHist","DrivQuality")),
         list(label = "Cost",
              shape = "icon",
              icon = list(code = "f111", color = "#03a9f4"),
              nodes = list("MedCost","ILiCost","OtherCarCost"))
       )

      )
