library(shiny)
devtools::load_all()

ui <- fluidPage(
  fontawesome::fa_html_dependency(),
  column(
    width = 6,
    strengthBarInput("textInput"),
    textOutput("textOutput"),
    actionButton("aceptar", "Aceptar")
  )
)

server <- function(input, output, session) {

  result <- eventReactive(input$aceptar, {

    if (is.null(input$textInput) || input$textInput[[2]] != 4) {
      showNotification("Error: Password no es suficientemente segura.")
      NULL
    } else {
      input$textInput[[1]]
    }

  })

  output$textOutput <- renderText({
    result()
  })

  observeEvent(input$textInput, {
    print(input$textInput)
  })
}

shinyApp(ui, server)
