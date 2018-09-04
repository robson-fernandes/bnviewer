[![CRAN Status Badge](https://www.r-pkg.org/badges/version/bnviewer)](https://CRAN.R-project.org/package=bnviewer) 
[![CRAN Downloads Badge](https://cranlogs.r-pkg.org/badges/grand-total/bnviewer)](https://CRAN.R-project.org/package=bnviewer)
[![CRAN Downloads Badge](https://cranlogs.r-pkg.org/badges/bnviewer)](https://CRAN.R-project.org/package=bnviewer)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://github.com/robson-fernandes/bnviewer/blob/master/LICENSE)

<p align="center">
 <b style='font-size:40px;'>BNViewer</b>
</p>

<p align="center">
 <b style='font-size:40px;'>An R package for interactive visualization of Bayesian Networks</b>
</p>

<img src="man/figures/alarm_sugiyama_hc.gif">


**bnviewer** is an R package for interactive visualization of Bayesian Networks based on <a href="http://www.bnlearn.com/" target="_blank">bnlearn</a>, through <a href="https://datastorm-open.github.io/visNetwork/" target="_blank">visNetwork</a>. The bnviewer package reads various structure learning algorithms provided by the <a href="http://www.bnlearn.com/" target="_blank">bnlearn</a> package, such as:

 <p><em>Constraint-based structure learning algorithms</em>:</p>
 <ul>
   <li>PC (the <em>stable</em> version);</li>
   <li>Grow-Shrink (GS);</li>
   <li>Incremental Association Markov Blanket (IAMB);</li>
   <li>Fast Incremental Association (Fast-IAMB);</li>
   <li>Interleaved Incremental Association (Inter-IAMB);</li>
   <li>Max-Min Parents &amp; Children (MMPC);</li>
   <li>Semi-Interleaved Hiton-PC (SI-HITON-PC);</li>
 </ul>
 <p><em>Score-based structure learning algorithms</em>:</p>
 <ul>
   <li>Hill Climbing (HC);</li>
   <li>Tabu Search (Tabu);</li>
 </ul>
 <p><em>Hybrid structure learning algorithms</em>:</p>
 <ul>
   <li>Max-Min Hill Climbing (MMHC);</li>
   <li>General 2-Phase Restricted Maximization (RSMAX2);</li>
 </ul>
 <p><em>Local discovery algorithms</em>:</p>
 <ul>
   <li>Chow-Liu;</li>
   <li>ARACNE;</li>
 </ul>
      
Installation
------------


You can install the stable version of **bnviewer** from CRAN:

```r
install.packages("bnviewer")
```

**bnviewer** is available for developers, install from GitHub.

``` r
install.packages("devtools")
devtools::install_github("robson-fernandes/bnviewer")
```

How to use
----------
Import the bnlearn and bnviewer packages

``` r
library(bnlearn)
library(bnviewer)
```
Import the desired dataset and apply a structure learning algorithm. Example (Hill-Climbing (HC)).
``` r
data("alarm")
bn.learn.hc = hc(alarm)
```

Call the viewer function of the bnviewer package with the desired parameters.
``` r
viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_with_sugiyama",
     bayesianNetwork.title="Discrete Bayesian Network - Alarm",
     bayesianNetwork.subtitle = "Monitoring of emergency care patients",
     bayesianNetwork.footer = "Fig. 1 - Layout with Sugiyama"
)
```
![](man/figures/alarm_sugiyama_hc.gif)

Example of Bayesian network visualization with custom nodes and grid layout.

``` r
viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_on_grid",
     bayesianNetwork.title="Discrete Bayesian Network - Alarm",
     bayesianNetwork.subtitle = "Monitoring of emergency care patients",
     bayesianNetwork.footer = "Fig. 1 - Layout on grid",

     node.colors = list(background = "#f4bafd",
                        border = "#2b7ce9",
                        highlight = list(background = "#97c2fc",
                                        border = "#2b7ce9"))

)
```
![](man/figures/alarm_grid_hc.gif)

Example of Bayesian network visualization with custom nodes and circle layout.

``` r
viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_in_circle",
     bayesianNetwork.title="Discrete Bayesian Network - Alarm",
     bayesianNetwork.subtitle = "Monitoring of emergency care patients",
     bayesianNetwork.footer = "Fig. 1 - Layout in circle",

     node.colors = list(background = "red",
                        border = "black",
                        highlight = list(background = "black",
                                         border = "red"))

)
```
![](man/figures/alarm_circle_hc.gif)

<p><h1> More Documentation </h1><p>

<hr>

<div>

<table width="100%" summary="page for viewer {bnviewer}"><tbody><tr><td>viewer {bnviewer}</td><td style="text-align: right;">R Documentation</td></tr></tbody></table>

<h2>Interactive Bayesian Network Viewer</h2>

<h3>Description</h3>

<p>Interactive Bayesian Network Viewer
</p>


<h3>Usage</h3>

<pre>viewer(bayesianNetwork, bayesianNetwork.title = "",
  bayesianNetwork.subtitle = "", bayesianNetwork.footer = "",
  bayesianNetwork.layout = "default", bayesianNetwork.width = "100%",
  bayesianNetwork.height = "500px", node.shape = c("dot"),
  node.label.prefix = "", node.colors = list(), edges.smooth = TRUE,
  edges.dashes = FALSE, options.highlightNearest = TRUE,
  options.nodesIdSelection = FALSE)
</pre>


<h3>Arguments</h3>

<table summary="R argblock">
<tbody><tr valign="top"><td><code>bayesianNetwork</code></td>
<td>
<p>A Bayesian Network structure. (Example : hill-climbing (HC)).</p>
</td></tr>
<tr valign="top"><td><code>bayesianNetwork.title</code></td>
<td>
<p>: String. Bayesian Network title</p>
</td></tr>
<tr valign="top"><td><code>bayesianNetwork.subtitle</code></td>
<td>
<p>: String. Bayesian Network subtitle</p>
</td></tr>
<tr valign="top"><td><code>bayesianNetwork.footer</code></td>
<td>
<p>: String. Bayesian Network footer</p>
</td></tr>
<tr valign="top"><td><code>bayesianNetwork.layout</code></td>
<td>
<p>: String. A layout of a Bayesian Network
</p>

<ol>
<li><p> layout_on_sphere
</p>
</li>
<li><p> layout_on_grid
</p>
</li>
<li><p> layout_in_circle
</p>
</li>
<li><p> layout_as_star
</p>
</li>
<li><p> layout_as_tree
</p>
</li>
<li><p> layout_with_sugiyama
</p>
</li>
<li><p> layout_with_kk
</p>
</li>
<li><p> layout_with_dh
</p>
</li>
<li><p> layout_with_lgl
</p>
</li>
<li><p> layout_with_mds
</p>
</li>
<li><p> layout_with_gem
</p>
</li>
<li><p> layout_nicely
</p>
</li>
<li><p> layout_components
</p>
</li></ol>
</td></tr>
<tr valign="top"><td><code>bayesianNetwork.width</code></td>
<td>
<p>: String. Bayesian Network width</p>
</td></tr>
<tr valign="top"><td><code>bayesianNetwork.height</code></td>
<td>
<p>: String. Bayesian Network height</p>
</td></tr>
<tr valign="top"><td><code>node.shape</code></td>
<td>
<p>: String. A node shape of a Bayesian Network
</p>

<ol>
<li><p> dot (default)
</p>
</li>
<li><p> circle
</p>
</li>
<li><p> ellipse
</p>
</li>
<li><p> database
</p>
</li>
<li><p> diamond
</p>
</li>
<li><p> square
</p>
</li>
<li><p> triangle
</p>
</li>
<li><p> box
</p>
</li>
<li><p> star
</p>
</li>
<li><p> text
</p>
</li></ol>
</td></tr>
<tr valign="top"><td><code>node.label.prefix</code></td>
<td>
<p>: String. Adds a prefix to the node label</p>
</td></tr>
<tr valign="top"><td><code>node.colors</code></td>
<td>
<p>: String | named list. Color for the node. Can be 'rgba(120,32,14,1)', '#97C2FC'
(hexa notation on 7 char without transparency) or 'red'.
Can be just one color, or a list with several elements:
</p>

<ol>
<li><p> "background" : String. Default to '#97C2FC'. Background color for the node.
</p>
</li>
<li><p> "border" : String. Default to '#2B7CE9'. Border color for the node.
</p>
</li>
<li><p> "highlight" : String | named list, Color of the node when selected.
</p>

<ol>
<li><p> "background" : String. Default to '#97C2FC'. Background color for the node when selected.
</p>
</li>
<li><p> "border" : String. Default to '#2B7CE9'. Border color for the node when selected.
</p>
</li></ol>

</li></ol>
</td></tr>
<tr valign="top"><td><code>edges.smooth</code></td>
<td>
<p>: Boolean. When true, the edge is drawn as a dynamic quadratic bezier curve.</p>
</td></tr>
<tr valign="top"><td><code>edges.dashes</code></td>
<td>
<p>: Array or Boolean. Default to false. When true, the edge will be drawn as a dashed line.</p>
</td></tr>
<tr valign="top"><td><code>options.highlightNearest</code></td>
<td>
<p>: Boolean. Default to true. Highlight nearest when clicking a node.</p>
</td></tr>
<tr valign="top"><td><code>options.nodesIdSelection</code></td>
<td>
<p>: Boolean. Default to false. Add an id node selection creating an HTML select element.</p>
</td></tr>
</tbody></table>


<h3>Examples</h3>

<pre>
library(bnlearn)
library(bnviewer)

data(coronary)
bn.learn.hc = hc(coronary)

viewer(bn.learn.hc,
     bayesianNetwork.width = "100%",
     bayesianNetwork.height = "80vh",
     bayesianNetwork.layout = "layout_as_star",
     bayesianNetwork.title="Discrete Bayesian Network - Coronary",
     bayesianNetwork.subtitle = "Coronary heart disease data set",
     bayesianNetwork.footer = "Fig. 1 - Layout as star",
     edges.smooth = TRUE,
     node.colors = list(background = "#f4bafd",
                        border = "#2b7ce9",
                        highlight = list(background = "#97c2fc",
                                         border = "#2b7ce9"))
)

</pre>

</div>

<p>
<hr>
</p>

<div>

<h3>References</h3>

<p>See online documentation <a href="https://github.com/robson-fernandes/bnviewer/">https://github.com/robson-fernandes/bnviewer/</a>
</p>
