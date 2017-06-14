# FuzzyCleaner

This is a web-application built in R's [Shiny framework](https://shiny.rstudio.com/) to help the Office of Institutional Research and Evaluation tidy open ended question response data. Often the office asks survey respondents to answer a question with an individual or department's name. These responses must be cleaned and matched in order to be counted properly. Fuzzy matching with [`agrep`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/agrep.html), for approximate string matching, is a popular tool for finding nearly equal strings. This project not only relies on `agrep`, but also builds on a [custom Javascript input method](https://github.com/rstudio/shiny-examples/tree/master/036-custom-input-control) from the Shiny examples gallery and the sample misspellings data from [drgtwo's fuzzyjoin repository](https://github.com/dgrtwo/fuzzyjoin/).

![FuzzyCleaner in Action](https://i.imgur.com/sJPJAMJ.gif)
