library(shiny)
devtools::load_all()

ui <- fluidPage(
  fontawesome::fa_html_dependency(),
  column(
    width = 6,
    strengthBarInput("textInput"),
    textOutput("textOutput")
  )
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", input$textInput)
  })
}

shinyApp(ui, server)
