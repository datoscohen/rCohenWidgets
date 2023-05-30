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

  observeEvent(input$textInput, {
    print(input$textInput)
  })
}

shinyApp(ui, server)
