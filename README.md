# FuzzyCleaner

This is a web-application built in R's [Shiny framework](https://shiny.rstudio.com/) to help the Office of Institutional Research and Evaluation tidy open ended question response data. Often the office asks survey respondents to answer a question with an individual or department's name. These responses must be cleaned and matched in order to be counted properly. Fuzzy matching with [`agrep`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/agrep.html), for approximate string matching, is a popular tool for finding nearly equal strings. Shiny's selectize-input and `agrep` will be front-and-center in this single-page data-cleaning app. 

![FuzzyCleaner in Action](https://i.imgur.com/sJPJAMJ.gif)
