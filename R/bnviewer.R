library(shiny)
require(visNetwork)

#' @title Interactive Bayesian Network Viewer
#'
#' @param bayesianNetwork A Bayesian Network structure. (Example : hill-climbing (HC)).
#'
#' @param bayesianNetwork.background Bayesian network background
#'
#' @param bayesianNetwork.title : String. Bayesian Network title
#'
#' @param bayesianNetwork.subtitle : String. Bayesian Network subtitle
#'
#' @param bayesianNetwork.footer : String. Bayesian Network footer
#'
#' @param bayesianNetwork.enabled.interactive.mode : Boolean. Enabled interactive viewer mode.
#'
#' @param bayesianNetwork.layout : String. A layout of a Bayesian Network.
#' The hierarchical layout the available options are: UD, DU, LR, RL.
#' To simplify: up-down, down-up, left-right, right-left.
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
#' @param edges.smooth : Boolean. When true, the edge is drawn as a dynamic quadratic bezier curve.
#'
#' @param edges.dashes : Array or Boolean. Default to false. When true, the edge will be drawn as a dashed line.
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
#'
#' @export
#'
#' @references See the code fontAwesome for icons in groups and nodes \url{https://fontawesome.com/v4.7.0/cheatsheet/}
#'
#' @examples
#'
#' library(bnlearn)
#' library(bnviewer)
#'
#' data("alarm")
#' bayesianNetwork = hc(alarm)
#'
#' viewer(bayesianNetwork,
#'        bayesianNetwork.background = "-webkit-radial-gradient(center, ellipse cover,
#'                                                              rgba(255,255,255,1) 0%,
#'                                                              rgba(246,246,246,1) 47%,
#'                                                              rgba(237,237,237,1) 100%)",
#'        bayesianNetwork.width = "100%",
#'        bayesianNetwork.height = "100vh",
#'        bayesianNetwork.layout = "layout_components",
#'        bayesianNetwork.title="<br>Discrete Bayesian Network - Alarm",
#'        bayesianNetwork.subtitle = "Monitoring of emergency care patients",
#'
#'        node.colors = list(background = "white",
#'                           border = "black",
#'                           highlight = list(background = "#e91eba",
#'                                            border = "black")),
#'        node.font = list(color = "black", face="Arial"),
#'
#'        clusters.legend.title = list(text = "<b>Legend</b> <br> Variable Categories",
#'                                     style = "font-size:18px;
#'                                              font-family:Arial;
#'                                              color:black;
#'                                              text-align:center;"),
#'        clusters.legend.options = list(
#'          list(label = "Pressure",
#'               shape = "icon",
#'               icon = list(code = "f1ce",
#'                           size = 50,
#'                           color = "#e91e63")),
#'          list(label = "Volume",
#'               shape = "icon",
#'               icon = list(code = "f140",
#'                           size = 50,
#'                           color = "#03a9f4")),
#'          list(label = "Ventilation",
#'               shape = "icon",
#'               icon = list(code = "f192",
#'                           size = 50,
#'                           color = "#4caf50")),
#'          list(label = "Saturation",
#'               shape = "icon",
#'               icon = list(code = "f10c",
#'                           size = 50,
#'                           color = "#ffc107"))
#'        ),
#'
#'        clusters = list(
#'          list(label = "Pressure",
#'               shape = "icon",
#'               icon = list(code = "f1ce", color = "#e91e63"),
#'               nodes = list("CVP","BP","HRBP","PAP","PRSS")),
#'          list(label = "Volume",
#'               shape = "icon",
#'               icon = list(code = "f140", color = "#03a9f4"),
#'               nodes = list("MINV","MVS","LVV","STKV")),
#'          list(label = "Ventilation",
#'               shape = "icon",
#'               icon = list(code = "f192", color = "#4caf50"),
#'               nodes = list("VALV","VLNG","VTUB","VMCH")),
#'          list(label = "Saturation",
#'               shape = "icon",
#'               icon = list(code = "f10c", color = "#ffc107"),
#'               nodes = list("HRSA","SAO2","PVS"))
#'        )
#' )
#'
viewer <- function(bayesianNetwork,
                   bayesianNetwork.background = NULL,
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

                   edges.smooth = TRUE,
                   edges.dashes = FALSE,

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

    if (length(group) > 0)
      nodes$group = group

    edges <- data.frame(from = from.collection,
                        to = to.collection,
                        smooth=edges.smooth,
                        dashes=edges.dashes)

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

    vis.network = visNetwork::visEdges(vis.network, arrows = "to")
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
                          vertex.size = 10,
                          vertex.label.dist=1.2,
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
                  legend(x=-1.9, y=0.5,
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
