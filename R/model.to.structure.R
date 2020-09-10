#' @title Model to Bayesian Network Structure
#'
#' @description Creates a Bayesian Network structure based on a high level semantic model.
#'
#' @param model  Model string
#'
#' @references See online documentation \url{http://robsonfernandes.net/bnviewer}
#'
#' @importFrom  methods is
#'
#' @export
#'
#' @examples
#'
#' library(bnlearn)
#' library(bnviewer)
#'
#'
#' model.left.arrow.op1 = "  A <- (B,C,D);
#'                           B <- (E,F);
#'                           F <- (G);
#'                        "
#'
#' model.left.arrow.op2 = "  A <= (B,C,D);
#'                           B <= (E,F);
#'                           F <= (G);
#'                        "
#'
#'
#' model.right.arrow.op1 = " A -> (B,C,D);
#'                           B -> (E,F);
#'                           F -> (G);
#'                         "
#'
#' model.right.arrow.op2 = " A => (B,C,D);
#'                           B => (E,F);
#'                           F => (G);
#'                         "
#'
#' structure = model.to.structure(model.left.arrow.op1)
#'
#' viewer(structure,
#'        bayesianNetwork.width = "100%",
#'        bayesianNetwork.height = "80vh",
#'        bayesianNetwork.layout = "layout_on_grid",
#'        node.colors = list(background = "#f4bafd",
#'                          border = "#2b7ce9",
#'                          highlight = list(background = "#97c2fc",
#'                                           border = "#2b7ce9"))
#'       )
#'
#' data.set = bnlearn::gaussian.test
#'
#' bayesianNetwork.fit = bn.fit(structure, data = data.set)
#'
#' print(bayesianNetwork.fit$A)
#'
model.to.structure = function(model){

  model.trim <- function (x) {
    x = gsub("\r?\n|\r", "", x)
    x = gsub("^\\s+|\\s+$\n", "", x)
    x = gsub(" ", "", x)
    return(x)
  }

  model = model.trim(model)
  model.relations <- strsplit(model, ";")[[1]]

  # Selected Right Arrow in Model
  arrows = c("\U2192", "=>", "->")
  arrow.right.selected = ""
  for (a in arrows){
    if (length(grep(a, model, value = TRUE) > 0)) {
      arrow.right.selected = a
    }
  }

  # Selected Left Arrow in Model
  arrows.inverted = c("\U2190", "<=", "<-")
  arrow.left.selected = ""
  for (a in arrows.inverted){
    if (length(grep(a, model, value = TRUE) > 0)) {
      arrow.left.selected = a
    }
  }

  model.relations.new = c()
  for (relation in model.relations){
    relation = model.trim(relation)
    if (relation != "")
      model.relations.new = c(model.relations.new, relation)
  }
  nodes = c()

  if (arrow.left.selected != ""){
    arrow.selected = arrow.left.selected
  }
  else{
    arrow.selected = arrow.right.selected
  }

  for (node in model.relations.new){

    node.split = strsplit(node, arrow.selected)[[1]]
    #Node From
    from = model.trim(node.split[1])
    #Node To
    to = model.trim(node.split[2])
    to = gsub("\\(", "", to)
    to = gsub(")", "", to)

    to.split = strsplit(to, ",")[[1]]
    for (to.value in to.split){
      nodes = c(nodes,from,to.value)
    }
  }

  arc.set = matrix(nodes, ncol = 2, byrow = TRUE, dimnames = list(NULL, c("from", "to")))

  if (arrow.left.selected != ""){
    arc.set = arc.set[, rev(seq_len(ncol(arc.set)))]
  }

  e =  bnlearn::empty.graph(nodes = unique(nodes))
  bnlearn::arcs(e) = arc.set

  return(e)

}
