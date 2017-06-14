library(shiny)

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
      uiOutput('select_column')
    ),
    mainPanel("Main Panel")
  )
))