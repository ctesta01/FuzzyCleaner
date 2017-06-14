library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  uploaded_dataframe <- reactive({
    if (is.null(input[['df_file']]))
      return(NULL)
    df <-
      read.csv(input[['df_file']][['datapath']],
               check.names = FALSE,
               stringsAsFactors = FALSE)
  })
  
  output[['select_column']] <- renderUI({
    selectInput('selected_column',
                'Select Column',
                c(Choose = '', colnames(uploaded_dataframe())),
                selectize = TRUE)
  })
})