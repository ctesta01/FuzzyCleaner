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
      h4("Upload and Select Data"),
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
                             actionButton("Go", "Update"))))
    ),
    mainPanel(uiOutput('custom_selector'))
  )
))