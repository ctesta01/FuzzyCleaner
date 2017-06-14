# FuzzyCleaner

This is a web-application built in R's [Shiny framework](https://shiny.rstudio.com/) to help Tufts University's Office of Institutional Research and Evaluation tidy open ended question response data. Often these responses must be cleaned and standardized in order to be counted properly. Fuzzy matching with R's [`agrep`](https://stat.ethz.ch/R-manual/R-devel/library/base/html/agrep.html) for approximate string matching is a popular tool for finding nearly equal strings. FuzzyCleaner provides an web-interface for data-cleaning powered by `agrep`, a [custom Javascript input method](https://github.com/rstudio/shiny-examples/tree/master/036-custom-input-control), and some sample data of misspelled words from [drgtwo's fuzzyjoin repository](https://github.com/dgrtwo/fuzzyjoin/). The FuzzyCleaner package is free and open source, available for anybody to use. 

![FuzzyCleaner in Action](https://i.imgur.com/sJPJAMJ.gif)
