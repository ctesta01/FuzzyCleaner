app <- function() {
  shiny::runApp(
    system.file('shiny', package = 'FuzzyCleaner'),
    launch.browser = TRUE)
}