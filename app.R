library(shiny)
devtools::load_all()

ui <- fluidPage(
  column(
    width = 2,
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
