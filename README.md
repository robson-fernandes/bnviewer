# bnviewer - Interactive Visualization of Bayesian Networks

<p><a href="https://CRAN.R-project.org/package=bnviewer" rel="nofollow"><img src="https://www.r-pkg.org/badges/version/bnviewer"></a>
<a href="https://CRAN.R-project.org/package=bnviewer" rel="nofollow"><img src="https://cranlogs.r-pkg.org/badges/grand-total/bnviewer"></a>
<a href="https://CRAN.R-project.org/package=bnviewer" rel="nofollow"><img src="https://cranlogs.r-pkg.org/badges/bnviewer"></a>
<a href="https://github.com/robson-fernandes/bnviewer/blob/master/LICENSE"><img src="https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000"></a>
</p>

Bayesian networks provide an intuitive framework for probabilistic reasoning 
and its graphical nature can be interpreted quite clearly. Graph based methods 
of machine learning are becoming more popular because they offer a richer model 
of knowledge that can be understood by a human in a graphical format. The 'bnviewer' 
is an R Package that allows the interactive visualization of Bayesian Networks. 
The aim of this package is to improve the Bayesian Networks visualization over 
the basic and static views offered by existing packages.

This package originated from my Master's project in Mathematics, Statistics and Applied Computing to Industry at the Institute of Mathematical and Computer Sciences of the University of São Paulo - ICMC-USP, under the supervision of Prof. Dr. Alneu Andrade Lopes and co-supervision of Dr. Brett Drury.

Support for the structure learning algorithms below:

#### Constraint-based structure learning algorithms:
- PC (the stable version);
- Grow-Shrink (GS);
- Incremental Association Markov Blanket (IAMB);
- Fast Incremental Association (Fast-IAMB);
- Interleaved Incremental Association (Inter-IAMB);
- Max-Min Parents & Children (MMPC);
- Semi-Interleaved Hiton-PC (SI-HITON-PC);

#### Score-based structure learning algorithms:
- Hill Climbing (HC);
- Tabu Search (Tabu);

#### Hybrid structure learning algorithms:
- Max-Min Hill Climbing (MMHC);
- General 2-Phase Restricted Maximization (RSMAX2);

#### Local discovery algorithms:
- Chow-Liu;
- ARACNE;


You can install the stable version of bnviewer from CRAN:
				  
```r
install.packages("bnviewer")
```				  

			  
bnviewer is available for developers, install from GitHub.
				
```r
install.packages("devtools")
devtools::install_github("robson-fernandes/bnviewer")
```	
### How to Use

Import the bnlearn and bnviewer packages
```r
library(bnlearn)
library(bnviewer)
```	

Import the desired dataset and apply a structure learning algorithm. Example (Hill-Climbing (HC)).
```r
data("alarm")
bn.learn.hc = hc(alarm)
```	

### How to use - Viewer function

Call the viewer function of the bnviewer package with the desired parameters.

```r
viewer(bn.learn.hc,
	bayesianNetwork.width = "100%",
	bayesianNetwork.height = "80vh",
	bayesianNetwork.layout = "layout_with_sugiyama",
	bayesianNetwork.title="Discrete Bayesian Network - Alarm",
	bayesianNetwork.subtitle = "Monitoring of emergency care patients",
	bayesianNetwork.footer = "Fig. 1 - Layout with Sugiyama"
)
```	

<img src="https://miro.medium.com/max/875/0*tbmDZ36wt_8_gFVe">

Example of Bayesian network visualization with custom nodes and grid layout.
```r
viewer(bn.learn.hc,
	bayesianNetwork.width = "100%",
	bayesianNetwork.height = "80vh",
	bayesianNetwork.layout = "layout_on_grid",
	bayesianNetwork.title="Discrete Bayesian Network - Alarm",
	bayesianNetwork.subtitle = "Monitoring of emergency care patients",
	bayesianNetwork.footer = "Fig. 2 - Layout on grid",

	node.colors = list(background = "#f4bafd",
						border = "#2b7ce9",
						highlight = list(background = "#97c2fc",
										border = "#2b7ce9"))
	
)
```

<img src="https://miro.medium.com/max/875/0*9qPr-9cUHoYnMYxs">

Example of Bayesian network visualization with custom nodes and circle layout.
```r
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

<img src="https://miro.medium.com/max/875/0*9pqisjJbu8ASt2wy">
