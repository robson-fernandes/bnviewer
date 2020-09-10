#' @title Interactive Bayesian Network Strength Viewer
#'
#' @description Show the strength of the probabilistic relationships expressed by the arcs of
#' a Bayesian network, and use model averaging to build a network containing only
#' the significant arcs.
#'
#' @param bayesianNetwork  A Bayesian Network structure from Averaged Network
#'
#' @param bayesianNetwork.background Bayesian network background
#'
#' @param bayesianNetwork.boot.strength A nonparametric bootstrap to assess arc strength and direction
#'
#' @param bayesianNetwork.arc.strength.threshold.expression Logical expression of the force threshold of the arcs of the Bayesian network
#'
#' @param bayesianNetwork.arc.strength.threshold.expression.color Color applied to logical expression of the force threshold of the arcs of the Bayesian network
#'
#' @param bayesianNetwork.arc.strength.threshold.alternative.color Alternative color to logical expression of the force threshold of the arcs of the Bayesian network
#'
#' @param bayesianNetwork.arc.strength.label Enable Bayesian Network arc strength label
#'
#' @param bayesianNetwork.arc.strength.label.prefix Include Bayesian Network arc strength label prefix
#'
#' @param bayesianNetwork.arc.strength.label.color Set Bayesian Network arc strength label color
#'
#' @param bayesianNetwork.arc.strength.tooltip Enable Bayesian Network arc strength tooltip
#'
#' @param bayesianNetwork.edge.scale.min Set bayesian Network edge scale minimum
#'
#' @param bayesianNetwork.edge.scale.max Set bayesian Network edge scale maximum
#'
#' @param bayesianNetwork.edge.scale.label.min Set bayesian Network edge scale label minimum
#'
#' @param bayesianNetwork.edge.scale.label.max Set bayesian Network edge scale label maximum
#'
#' @param bayesianNetwork.title : String. Bayesian Network title
#'
#' @param bayesianNetwork.subtitle : String. Bayesian Network subtitle
#'
#' @param bayesianNetwork.footer : String. Bayesian Network footer
#'
#' @param bayesianNetwork.enabled.interactive.mode : Boolean. Enabled interactive viewer mode.
#'
#' @param bayesianNetwork.layout : String. A layout of a Bayesian Network
#' \enumerate{
#'   \item layout_on_sphere
#'   \item layout_on_grid
#'   \item layout_in_circle
#'   \item layout_as_star
#'   \item layout_as_tree
#'   \item layout_with_sugiyama
#'   \item layout_with_kk
#'   \item layout_with_dh
#'   \item layout_with_lgl
#'   \item layout_with_mds
#'   \item layout_with_gem
#'   \item layout_nicely
#'   \item layout_components
#'   \item layout_hierarchical_direction_UD
#'   \item layout_hierarchical_direction_DU
#'   \item layout_hierarchical_direction_LR
#'   \item layout_hierarchical_direction_RL
#' }
#'
#' @param bayesianNetwork.width : String. Bayesian Network width
#'
#' @param bayesianNetwork.height : String. Bayesian Network height
#'
#' @param node.shape : String. A node shape of a Bayesian Network
#' \enumerate{
#'   \item dot (default)
#'   \item circle
#'   \item ellipse
#'   \item database
#'   \item diamond
#'   \item square
#'   \item triangle
#'   \item box
#'   \item star
#'   \item text
#' }
#'
#' @param node.label.prefix : String. Adds a prefix to the node label
#'
#' @param node.colors : String | named list. Color for the node. Can be 'rgba(120,32,14,1)', '#97C2FC'
#' (hexa notation on 7 char without transparency) or 'red'.
#' Can be just one color, or a list with several elements:
#'
#' \enumerate{
#'   \item "background" : String. Default to '#97C2FC'. Background color for the node.
#'   \item "border" : String. Default to '#2B7CE9'. Border color for the node.
#'   \item "highlight" : String | named list, Color of the node when selected.
#'   \enumerate{
#'      \item "background" : String. Default to '#97C2FC'. Background color for the node when selected.
#'      \item "border" : String. Default to '#2B7CE9'. Border color for the node when selected.
#'   }
#' }
#'
#' @param node.font Node Font : Array. Example list(color = "black", face="Arial")
#'
#' @param node.size Integer. Node Size.
#'
#' @param edges.smooth : Boolean. When true, the edge is drawn as a dynamic quadratic bezier curve.
#'
#' @param edges.dashes : Array or Boolean. Default to false. When true, the edge will be drawn as a dashed line.
#'
#' @param edges.colors  : Named list or String. Default to named list. Color information of the edge in every situation. Can be 'rgba(120,32,14,1)', '#97C2FC' (hexa notation on 7 char without transparency) or 'red'.
#'
#'  \itemize{
#'  \item{"color"}{ : String. Default to '#848484. The color of the edge when it is not selected or hovered over (assuming hover is enabled in the interaction module).}
#'  \item{"highlight "}{ : String. Default to '#848484'. The color the edge when it is selected.}
#'  \item{"hover"}{ : String. Default to '#848484'. The color the edge when the mouse hovers over it (assuming hover is enabled in the interaction module).}
#'  \item{"inherit"}{ : String or Boolean. Default to 'from'. When color, highlight or hover are defined, inherit is set to false! Supported options are: true, false, 'from','to','both'.}
#'  \item{"opacity"}{ : Number. Default to 1.0. It can be useful to set the opacity of an edge without manually changing all the colors. The allowed range of the opacity option is between 0 and 1.}
#'}
#'
#' @param options.highlightNearest : Boolean. Default to true. Highlight nearest when clicking a node.
#'
#' @param options.nodesIdSelection : Boolean. Default to false. Add an id node selection creating an HTML select element.
#'
#' @param  clusters.legend.title : Array.  Get details in the example.
#'
#' @param clusters.legend.options : Array of Array. Get details in the example.
#'
#' @param clusters : Array of Array. Get details in the example.
#'
#' @references See online documentation \url{http://robsonfernandes.net/bnviewer}
#'
#' @importFrom  methods is
#' @importFrom  graphics legend
#'
#' @export
#'
#' @examples
#'
#' library(bnlearn)
#' library(bnviewer)
#'
#' bayesianNetwork.boot.strength = boot.strength(coronary, R = 20, algorithm = "hc")
#'
#' avg.bayesianNetwork = averaged.network(bayesianNetwork.boot.strength, threshold = 0.2)
#'
#' strength.viewer(
#'   avg.bayesianNetwork,
#'   bayesianNetwork.boot.strength,
#'   bayesianNetwork.background = "white",
#'   bayesianNetwork.arc.strength.threshold.expression = c("@threshold > 0 & @threshold < 0.5",
#'                                                         "@threshold >= 0.5 & @threshold < 0.6",
#'                                                         "@threshold >= 0.6 & @threshold <= 1"),
#'
#'   bayesianNetwork.arc.strength.threshold.expression.color  = c("red", "yellow", "green"),
#'   bayesianNetwork.arc.strength.threshold.alternative.color =  "white",
#'
#'   bayesianNetwork.arc.strength.label = TRUE,
#'   bayesianNetwork.arc.strength.label.prefix = "",
#'   bayesianNetwork.arc.strength.label.color = "black",
#'
#'   bayesianNetwork.arc.strength.tooltip = TRUE,
#'
#'   bayesianNetwork.edge.scale.min = 1,
#'   bayesianNetwork.edge.scale.max = 3,
#'
#'   bayesianNetwork.edge.scale.label.min = 14,
#'   bayesianNetwork.edge.scale.label.max = 14,
#'
#'   bayesianNetwork.width = "100%",
#'   bayesianNetwork.height = "800px",
#'   bayesianNetwork.layout = "layout_with_sugiyama",
#'   node.colors = list(background = "#97c2fc",
#'                      border = "#2b7ce9",
#'                      highlight = list(background = "#e91eba",
#'                                       border = "#2b7ce9")),
#'
#'   node.font = list(color = "black", face="Arial"),
#'   edges.dashes = FALSE,
#'
#'   bayesianNetwork.title="Bayesian Network Strength Analysis - Coronary",
#'   bayesianNetwork.subtitle = "Coronary heart disease data set",
#'   bayesianNetwork.footer = "Fig. 1 - Layout with Sugiyama"
#' )
#'
strength.viewer <- function(bayesianNetwork,
                            bayesianNetwork.boot.strength,
                            bayesianNetwork.background = NULL,
                            bayesianNetwork.arc.strength.threshold.expression = NULL,
                            bayesianNetwork.arc.strength.threshold.expression.color = NULL,
                            bayesianNetwork.arc.strength.threshold.alternative.color = NULL,

                            bayesianNetwork.arc.strength.label = FALSE,
                            bayesianNetwork.arc.strength.label.prefix = "",
                            bayesianNetwork.arc.strength.label.color = NULL,
                            bayesianNetwork.arc.strength.tooltip = FALSE,

                            bayesianNetwork.edge.scale.min = 1,
                            bayesianNetwork.edge.scale.max = 5,

                            bayesianNetwork.edge.scale.label.min = 14,
                            bayesianNetwork.edge.scale.label.max = 14,

                            bayesianNetwork.title = "",
                            bayesianNetwork.subtitle = "",
                            bayesianNetwork.footer = "",
                            bayesianNetwork.enabled.interactive.mode = FALSE,
                            bayesianNetwork.layout = "default",
                            bayesianNetwork.width = "100%",
                            bayesianNetwork.height = "500px",

                            node.shape = NULL,
                            node.label.prefix = "",
                            node.colors = list(),
                            node.font = list(),
                            node.size = 10,

                            edges.smooth = TRUE,
                            edges.dashes = FALSE,
                            edges.colors = list(),

                            options.highlightNearest = TRUE,
                            options.nodesIdSelection = FALSE,

                            clusters.legend.title = "",
                            clusters.legend.options = list(),
                            clusters = list()

){

  #BNLearn Class
  BNLearnClass =  bnlearn::.__C__bn

  #BN.Learn Object
  if ("learning"  %in% names(bayesianNetwork) &
      "nodes"  %in% names(bayesianNetwork) &
      "arcs"  %in% names(bayesianNetwork) |
      is(bayesianNetwork,BNLearnClass))
  {

    nodes = names(bayesianNetwork$nodes)
    from.collection = bayesianNetwork$arcs[,1]
    to.collection = bayesianNetwork$arcs[,2]

    group = c()
    if (length(clusters) > 0){

      for (node in nodes){
        include.cluster = FALSE
        for (cluster in clusters)
        {
          label = cluster$label
          cluster.nodes = cluster$nodes

          if (node %in% cluster.nodes){
            group = c(group,label)
            include.cluster = TRUE
          }
        }

        if (include.cluster == FALSE){
          group = c(group,"")
        }
      }

    }

    strength.collection = c()
    strength.tooltip.collection = c()
    strength.collection.color = c()

    assertthat::assert_that(!missing(bayesianNetwork.boot.strength),
                            msg = "Argument bayesianNetwork.boot.strength is missing.
                            Specify a list object of class bn.
                            See ?bnlearn::bn.strength for more detail")

    assertthat::assert_that(!is.null(bayesianNetwork.boot.strength),
                            msg = "Argument bayesianNetwork.boot.strength is NULL.
                            Specify a list object of class bn.
                            See ?bnlearn::bn.strength for more detail")

    assertthat::assert_that("bn.strength" %in% class(bayesianNetwork.boot.strength),
                            msg = "Argument bayesianNetwork.boot.strength is not a list object of class bn.
                            See ?bnlearn::bn.strength for more detail")

    for (i in seq_along(from.collection)){

      from = from.collection[i]
      to = to.collection[i]

      strength = bayesianNetwork.boot.strength[(bayesianNetwork.boot.strength$from == from & bayesianNetwork.boot.strength$to == to),"strength"]
      strength.collection <- c(strength.collection,strength)


      strength.tooltip.collection = c(strength.tooltip.collection,paste0("<br><b> Causal Relationships : </b>", from, " &rarr; ", to, "<br>", "<br><b> Edge Strength : </b>", strength, "<br><br>", ""))

    }


    if (is.null(node.shape))
    {
      nodes <- data.frame(id = nodes,
                          label = paste(node.label.prefix, nodes))
    }
    else{
      nodes <- data.frame(id = nodes,
                          label = paste(node.label.prefix, nodes),
                          shape = node.shape)
    }

    edges <- data.frame(from = from.collection,
                        to = to.collection,
                        smooth=edges.smooth,
                        dashes=edges.dashes,
                        value=strength.collection)


    if (length(group) > 0)
      nodes$group = group

    if (!is.null(bayesianNetwork.arc.strength.threshold.expression)){

      #Color Interval
      for (j in seq_along(from.collection)){

        from = from.collection[j]
        to = to.collection[j]

        strength = bayesianNetwork.boot.strength[(bayesianNetwork.boot.strength$from == from & bayesianNetwork.boot.strength$to == to),"strength"]


        expression.color.detect = NULL

        for (k in seq_along(bayesianNetwork.arc.strength.threshold.expression)){

          expression = bayesianNetwork.arc.strength.threshold.expression[k]
          expression.color = bayesianNetwork.arc.strength.threshold.expression.color[k]

          expression.strength = gsub("@threshold", strength, expression)

          expression.strength.logic = eval(parse(text = expression.strength))

          if (expression.strength.logic){
            expression.color.detect = expression.color

          }

        }

        if (!is.null(expression.color.detect)){
          strength.collection.color <- c(strength.collection.color, expression.color.detect)
        }
        else{
          strength.collection.color <- c(strength.collection.color, bayesianNetwork.arc.strength.threshold.alternative.color)
        }

      }
      edges$color=strength.collection.color
    }

    if (bayesianNetwork.arc.strength.tooltip){
      edges$title = strength.tooltip.collection
    }

    if (bayesianNetwork.arc.strength.label)
    {
      bayesianNetwork.arc.strength.label.collection = paste(bayesianNetwork.arc.strength.label.prefix,
                                                            strength.collection)
      edges$label = bayesianNetwork.arc.strength.label.collection
    }

    if (!is.null(bayesianNetwork.arc.strength.label.color))
    {
      font = paste("10px", "Arial", bayesianNetwork.arc.strength.label.color)
      edges$font = font
    }

    vis.network = visNetwork::visNetwork(nodes,
                                         edges,
                                         width = bayesianNetwork.width,
                                         height = bayesianNetwork.height,
                                         main = bayesianNetwork.title,
                                         submain = bayesianNetwork.subtitle,
                                         footer = bayesianNetwork.footer,
                                         background = bayesianNetwork.background)

    vis.network = visNetwork::addFontAwesome(vis.network)

    for (cluster in clusters)
    {
      label = cluster$label
      color = cluster$color
      shape = cluster$shape
      icon = cluster$icon
      vis.network = visNetwork::visGroups(vis.network, groupname = label, color = color, shape = shape, icon = icon)
    }
    if (length(clusters.legend.options) > 0)
    {
      vis.network = visNetwork::visLegend(vis.network, addNodes = clusters.legend.options, main = clusters.legend.title, useGroups = FALSE)
    }

    if (length(node.colors) > 0){

      if (length(node.font) > 0){
        vis.network = visNetwork::visNodes(vis.network, color = node.colors, font= node.font)
      }
      else{
        vis.network = visNetwork::visNodes(vis.network, color = node.colors)
      }

    }

    vis.network = visNetwork::visEdges(vis.network, arrows = "to",
                                       color=edges.colors,
                                       scaling=list(min=bayesianNetwork.edge.scale.min,
                                                    max=bayesianNetwork.edge.scale.max,
                                                    label= list(enabled=TRUE,
                                                                min=bayesianNetwork.edge.scale.label.min,
                                                                max=bayesianNetwork.edge.scale.label.max)))
    vis.network = visNetwork::visOptions(vis.network, highlightNearest = options.highlightNearest,
                                         nodesIdSelection = options.nodesIdSelection)

    if (bayesianNetwork.layout != "default"){
      direction = ""
      if (bayesianNetwork.layout == "layout_hierarchical_direction_UD"){
        direction = "UD"
      }
      else if (bayesianNetwork.layout == "layout_hierarchical_direction_DU"){
        direction = "DU"
      }
      else if (bayesianNetwork.layout == "layout_hierarchical_direction_LR"){
        direction = "LR"
      }
      else if (bayesianNetwork.layout == "layout_hierarchical_direction_RL"){
        direction = "RL"
      }

      if (direction != ""){
        vis.network = visNetwork::visHierarchicalLayout(vis.network, direction = direction)
      }
      else{
        vis.network = visNetwork::visIgraphLayout(vis.network, layout = bayesianNetwork.layout)
      }
    }
    else{
      vis.network = visNetwork::visLayout(vis.network, randomSeed = 123)
    }

    if (bayesianNetwork.enabled.interactive.mode == TRUE)
    {

      layout = c(
        "layout_on_grid", "layout_on_sphere", "layout_in_circle", "layout_as_star", "layout_as_tree",
        "layout_with_sugiyama", "layout_with_kk", "layout_with_dh",
        "layout_with_lgl", "layout_with_mds", "layout_with_gem", "layout_nicely",
        "layout_components",
        "layout_hierarchical_direction_DU",
        "layout_hierarchical_direction_UD",

        "layout_hierarchical_direction_LR",
        "layout_hierarchical_direction_RL")

      # ----------------------------------------------
      ## Shiny here
      # ----------------------------------------------
      # Define UI
      ui <- shiny::shinyUI(shiny::fluidPage(

        # App title ----
        shiny::titlePanel(""),

        # Sidebar layout with input and output definitions ----
        shiny::sidebarLayout(

          # Sidebar panel for inputs ----
          shiny::sidebarPanel(
            shiny::htmlOutput("bayesianNetworkInformation"),
            shiny::hr(),
            shiny::htmlOutput("nodes"),
            shiny::htmlOutput("edges"),
            shiny::hr(),
            shiny::htmlOutput("layout"),
            shiny::hr(),
            shiny::selectInput("layout", "",choices=layout),
            shiny::hr(),
            shiny::htmlOutput("export"),
            shiny::hr(),
            shiny::actionButton("store_position",  "Generate Vector File", style='width:100%'),
            shiny::br(),
            shiny::actionButton('downloadNetwork', 'Preview Vector File', style='width:100%'),
            width = 3),

          # Main panel for displaying outputs ----
          shiny::mainPanel(

            # Output: Tabset w/ plot, summary, and table ----
            shiny::tabsetPanel(type = "tabs",
                               shiny::tabPanel("Bayesian Network",visNetwork::visNetworkOutput("network", height = bayesianNetwork.height))
            )
          )

        )
      )

      )


      # Define server
      server <- shiny::shinyServer(function(input, output, session) {


        output$layout <- shiny::renderUI({
          shiny::HTML("<b>Layout</b>")
        })


        output$export <- shiny::renderUI({
          shiny::HTML("<b>Export</b>")
        })

        output$bayesianNetworkInformation <- shiny::renderUI({
          shiny::HTML("<b>Bayesian Network Information</b>")
        })

        output$nodes <- shiny::renderUI({
          shiny::HTML(paste("Nodes:", nrow(nodes)))
        })


        output$edges <- shiny::renderUI({
          shiny::HTML(paste("Edges:", nrow(edges)))
        })

        output$network <- visNetwork::renderVisNetwork({

          bayesianNetwork.layout = input$layout

          if (bayesianNetwork.layout != "default"){

            direction = ""
            if (bayesianNetwork.layout == "layout_hierarchical_direction_UD"){
              direction = "UD"
            }
            else if (bayesianNetwork.layout == "layout_hierarchical_direction_DU"){
              direction = "DU"
            }
            else if (bayesianNetwork.layout == "layout_hierarchical_direction_LR"){
              direction = "LR"
            }
            else if (bayesianNetwork.layout == "layout_hierarchical_direction_RL"){
              direction = "RL"
            }

            if (direction != ""){
              vis.network = visNetwork::visHierarchicalLayout(vis.network, direction = direction)
            }
            else{
              vis.network = visNetwork::visIgraphLayout(vis.network, layout = bayesianNetwork.layout)
            }
          }
          else{
            vis.network = visNetwork::visLayout(vis.network, randomSeed = 123)
          }

          vis.network
        })

        # format positions
        nodes_positions <- shiny::reactive({
          positions <- input$network_positions
          if(!is.null(positions)){
            nodes_positions <- do.call("rbind", lapply(positions, function(x){ data.frame(x = x$x, y = x$y)}))
            nodes_positions$id <- names(positions)
            nodes_positions
          } else {
            NULL
          }
        })

        # get position info
        shiny::observeEvent(input$store_position, {
          visNetwork::visGetPositions(visNetwork::visNetworkProxy("network"))

          shiny::showModal(shiny::modalDialog(
            title = "Hey :)",
            "Vector file generated successfully.",
            easyClose = TRUE,
            footer = NULL
          ))

        })

        shiny::observeEvent(input$downloadNetwork, {

          nodes_positions <- nodes_positions()

          if(!is.null(nodes_positions)){
            nodes_save <- merge(nodes, nodes_positions, by = "id", all = T)
            a = nodes_save$x
            b = nodes_save$y

            nodes_save$x = a
            nodes_save$y = b * -1
            nodes_save$color = node.colors$background

            if (length(clusters) > 0){
              trim <- function( x ) {
                gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)
              }

              for (c in clusters){
                nodes_save[trim(nodes_save$label) %in% c$nodes,]$color =  c$icon$color
              }
            }
          } else  {
            nodes_save <- nodes
          }

          graph <- igraph::graph_from_data_frame(vertices = nodes_save,
                                                 d= edges,
                                                 directed = TRUE)

          if (edges.smooth == TRUE)
          {
            curved = seq(-0.5, 0.5, length = ecount(graph))
          }
          else{
            curved = NULL
          }

          plot.igraph(graph,
                      vertex.size = node.size,
                      vertex.label.dist=1.5,
                      vertex.label.color = "black",
                      vertex.label.cex = 0.6,
                      vertex.label.degree=pi/2,

                      edge.width = 1.2,
                      edge.arrow.width = 0.5,
                      edge.arrow.size = 0.5,

                      edge.curved=curved

          )

          if (length(clusters) > 0){
            group.collection = c()
            color.collection = c()

            for (cluster in clusters){
              group.collection = c(group.collection, cluster$label)
              color.collection = c(color.collection, cluster$icon$color)
            }

            df_legend <- data.frame(group = group.collection,color = color.collection)
            graphics::legend(x=-1.9, y=0.5,
                   legend = df_legend$group,
                   pch = 19,
                   col = df_legend$color,
                   bty = "n",
                   title = clusters.legend.title$text,
                   pt.cex=3,
                   cex=.8,
                   ncol=1,
                   x.intersp =2, y.intersp = 2)
          }

          shiny::showModal(shiny::modalDialog(
            title = "Hey :)",
            "Vector file saved successfully. See the object in the 'Plots' tab of RStudio",
            easyClose = TRUE,
            footer = NULL
          ))
        })


      })

      #Create Shiny app ----
      app <- shiny::shinyApp(ui, server)
      shiny::runApp(app)
      # ----------------------------------------------
    }
    else{
      vis.network
    }

  }

}
