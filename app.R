library(shiny)
devtools::load_all()

ui <- fluidPage(
  fontawesome::fa_html_dependency(),
  column(
    width = 6,
    strengthBarInput("textInput"),
    textOutput("textOutput"),
    actionButton("calcular", "Calcular")
  )
)

server <- function(input, output, session) {

  valor <- reactiveValues(password = "", score = 0)

  observeEvent(input$calcular, {
    valor$password <- input$textInput$password
    valor$score <- input$textInput$score
  })

  output$textOutput <- renderText({
    glue::glue(
      "Password: {valor$password} | Score: {valor$score}"
    )
  })
}

shinyApp(ui, server)
