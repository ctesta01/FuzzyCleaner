library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  values <- reactiveValues(df = misspellings, coldata = NULL, colnames = colnames(misspellings))
  
  uploaded_dataframe <- reactive({
    if (is.null(input[['df_file']]))
      return(NULL)
    df <-
      read.csv(input[['df_file']][['datapath']],
               check.names = FALSE,
               stringsAsFactors = FALSE)
    values[['df']] <- df
    values[['colnames']] <- colnames(df)
    return(df)
  })
  
  observeEvent(input[['Go']], {
    if (length(input[['mychooser']][['right']]) > 0) {
      coldata <- values[['coldata']]
      matches <- which(coldata %in% input[['mychooser']][['right']])
      coldata <- replace(coldata, matches, input[['rename']])
      values[['df']][[input[['selected_column']]]] <- coldata  
      values[['coldata']] <- coldata
    }
  })
  
  colname_choices <- reactive({
    if (is.null(values[['colnames']])) {
      values[['colnames']] <- colnames(uploaded_dataframe())
    }
    if (!is.null(input[['df_file']])) {
      return(colnames(uploaded_dataframe()))
    }
    return(values[['colnames']])
  })
  
  output[['select_column']] <- renderUI({
    selectInput('selected_column',
                'Select Column',
                c(Choose = '', colname_choices()),
                selectize = TRUE)
  })
  
  column_data <- reactive({
    input[['Go']]
    if (is.null(input[['selected_column']])) return(NULL)
    values[['coldata']] <- values[['df']][[input[['selected_column']]]]
    if (trimws(input[['fuzzy_search']]) == "") {
      return(values[['coldata']])
    } else {
      matches <- agrep(input[['fuzzy_search']], values[['coldata']], max=input[['fuzzy_threshold']])
      return(values[['coldata']][matches])
    }
  })
  
  left_label <- reactive({
    if (length(column_data()) > 0) {
      leftlabel <- paste0("Original Data - ", length(column_data()), " Matches")
    } else leftlabel <- "Original Data"
  })
  
  output[['custom_selector']] <- renderUI({
    input[['Go']]
    input[['selected_column']]
    input[['fuzzy_threshold']]
    input[['df_file']]
    chooserInput("mychooser", left_label(), "Data for Renaming",
                 column_data(), c(), size = 40, multiple = TRUE
    )
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { 
      if (!is.null(input[['df_data']])) {
        paste(basename(input[['df_data']][['datapath']]), '.csv', sep='')
      } else 
        return('output.csv')
      },
    content = function(file) {
      write.csv(values[['df']], file, row.names = FALSE)
    }
  )
  
  
})