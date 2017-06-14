library(shiny)
# source('chooser.R')
library(FuzzyCleaner)
# library(FuzzyCleaner)
# library(FuzzyCleaner)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("FuzzyCleaner"),
  
  sidebarLayout(
    sidebarPanel(
      # h4(""),
      HTML("FuzzyCleaner uses <a href='https://stat.ethz.ch/R-manual/R-devel/library/base/html/agrep.html'>fuzzy matching</a> 
      in R to help users clean and standardize their CSV data. 
      To fuzzy-search a column, upload a CSV dataset, select a column, and enter a search term
      and maximum <a href='https://en.wikipedia.org/wiki/Levenshtein_distance'>Levenshtein distance</a>
      to search with. 
      Move the cells to be renamed to the right, enter their new value below, and 
      click update. FuzzyCleaner then updates the dataframe by replacing the selected cells with 
      the new desired value."),
      h4(),
      br(),
      fileInput(
        'df_file',
        'Choose CSV Response Set File',
        accept = c('text/csv', 'text/comma-separated-values', '.csv')
      ),
      uiOutput('select_column'),
      br(),
      textInput("fuzzy_search", "Fuzzy Search", ""),
      sliderInput("fuzzy_threshold", "Fuzzy Threshold", min=0, max=10, value=2, step=1),
      br(),
      HTML("<b>Update Selected Cells to:</b>"),
      fluidRow(column(7, textInput("rename", "", "")),
               column(1, div(class="form-group shiny-input-container",
                             tags$label(""),
                             actionButton("Go", "Update")))),
      br(),
      downloadButton('downloadData', 'Download Output CSV')
    ),
    mainPanel(uiOutput('custom_selector'))
  )
))