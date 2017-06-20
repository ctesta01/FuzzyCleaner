requireNamespace('shiny')

chooserInput <- function(inputId, leftLabel, rightLabel, leftChoices, rightChoices,
                         size = 5, multiple = FALSE) {
  
  leftChoices <- lapply(leftChoices, tags$option)
  rightChoices <- lapply(rightChoices, tags$option)
  
  if (multiple)
    multiple <- "multiple"
  else
    multiple <- NULL
  
  tagList(
    singleton(tags$head(
      tags$script(src="chooser-binding.js"),
      tags$style(type="text/css",
                 HTML(".chooser-container { display: inline-block; } 
                      .chooser-left-container { width: 45%; }
                      .chooser-right-container { width: 45%; }
                      .chooser-center-container {
                          position: relative;
                          transform: translateY(-350%);
                      }
                      select option:nth-of-type(2n) { background: rgb(240,240,240); }
                      select { border: 1px lightgray solid }") 
      )
    )),
    div(id=inputId, class="chooser",
        div(class="chooser-container chooser-left-container",
            h4(leftLabel, style='text-align: center'),
            tags$select(class="left", style='width: 100%', size=size, multiple=multiple, leftChoices)
        ),
        div(class="chooser-container chooser-center-container",
            icon("arrow-circle-o-right", "right-arrow fa-3x"),
            tags$br(),
            icon("arrow-circle-o-left", "left-arrow fa-3x")
        ),
        div(class="chooser-container chooser-right-container",
            h4(rightLabel, style='text-align: center'),
            tags$select(class="right", style='width: 100%', size=size, multiple=multiple, rightChoices)
        )
    )
  )
}

shiny::registerInputHandler("shinyjsexamples.chooser", function(data, ...) {
  if (is.null(data))
    NULL
  else
    list(left=as.character(data$left), right=as.character(data$right))
}, force = TRUE)
