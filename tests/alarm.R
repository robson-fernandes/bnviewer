library(bnviewer)
library(bnlearn)
library(caret)

dataset = bnlearn::insurance

dataset.balanced <- dataset[ dataset$Accident != "None", , drop=FALSE];
dataset.balanced$Accident <- factor(dataset.balanced$Accident);


## cut 80% from dataset
split.train = round(0.80*nrow(dataset.balanced))

training <- dataset.balanced[1:split.train,]
test <- dataset.balanced[-(1:split.train),]

bayesianNetwork.cv = bn.cv(data = training,
                           bn = "hc",
                           loss = "pred",
                           method = "k-fold",
                           loss.args = list(target = "Accident"),
                           k = 10)

#bayesianNetwork.cv = bn.cv(data = training,
#                           bn = "tree.bayes",
#                           loss = "pred",
#                           method = "k-fold",
#                           algorithm.args = list(training = "Accident"),
#                           k = 10)

bayesianNetwork.strength = custom.strength(bayesianNetwork.cv)

avg.bayesianNetwork = bnlearn::cextend(averaged.network(bayesianNetwork.strength, threshold = 0.2))

strength.viewer(
  avg.bayesianNetwork,
  bayesianNetwork.strength,
  bayesianNetwork.background = "white",
  bayesianNetwork.enabled.interactive.mode = TRUE,
  bayesianNetwork.arc.strength.threshold.expression = c("@threshold > 0 & @threshold < 0.5",
                                                        "@threshold >= 0.5 & @threshold <= 0.8",
                                                        "@threshold > 0.8 & @threshold <= 1"),

  bayesianNetwork.arc.strength.threshold.expression.color  = c("red", "yellow", "blue"),
  bayesianNetwork.arc.strength.threshold.alternative.color =  "black",

  bayesianNetwork.arc.strength.label = TRUE,
  bayesianNetwork.arc.strength.label.prefix = "",
  bayesianNetwork.arc.strength.label.color = "black",

  bayesianNetwork.arc.strength.tooltip = TRUE,

  bayesianNetwork.edge.scale.min = 1,
  bayesianNetwork.edge.scale.max = 3,

  bayesianNetwork.edge.scale.label.min = 14,
  bayesianNetwork.edge.scale.label.max = 14,

  bayesianNetwork.width = "100%",
  bayesianNetwork.height = "800px",
  bayesianNetwork.layout = "layout_on_grid",
  node.colors = list(background = "#03a9f4",
                     border = "#2b7ce9",
                     highlight = list(background = "#e91eba",
                                      border = "#2b7ce9")),

  node.font = list(color = "black", face="Arial"),
  node.size = 15,
  edges.dashes = FALSE,
  edges.smooth = FALSE,

  clusters.legend.title = list(text = "Legend"),

  clusters.legend.options = list(

    list(label = "Accident",
         shape = "icon",
         icon = list(code = "f111", size = 50, color = "#e91e63")),

    list(label = "Others",
         shape = "icon",
         icon = list(code = "f111", size = 50, color = "#03a9f4"))
  ),

  clusters = list(
    list(label = "Accident",
         shape = "icon",
         icon = list(code = "f111", color = "#e91e63"),
         nodes = list("Accident")),
    list(label = "Others",
         shape = "icon",
         icon = list(code = "f111", color = "#03a9f4"),
         nodes = list("Age"))
  )
)




bayesian.fit <- bn.fit(avg.bayesianNetwork, data = training, method="mle")

test.features <- subset(test, select = -c(Accident))
bayesian.predict <- predict(bayesian.fit,"Accident",test.features)

obs <- test[,"Accident"]
pred <- bayesian.predict


confusionMatrix(obs, pred)
