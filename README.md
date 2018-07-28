<p align="center">
 <b><h1 align="center" >BNViewer</h1></b>
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

**bnviewer** is available for developers, install from GitHub.

``` r
install.packages("devtools")
devtools::install_github("robson-fernandes/bnviewer")
```

Documentation
----------

See more documentation here <a href="man/DOC.md">BNViewer Documentation</a>


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
