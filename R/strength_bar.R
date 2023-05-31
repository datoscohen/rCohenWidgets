# Exportar funciones ------------------------------------------------------

#' @export strengthBarInput
NULL


#' React Password Strength Bar
#'
#' Esta función proporciona un widget de entrada de contraseña para Shiny, que incluye una
#' barra de fortaleza de contraseña. La barra de fortaleza muestra la seguridad del texto
#' ingresado basándose en cinco posibles estados, siendo el estado mayor el más seguro.
#' El widget de entrada crea una lista en Shiny que contiene el texto ingresado y la
#' puntuación de seguridad, que varía de 0 a 4.
#'
#' @param inputId
#' @param default Character. Valor que va a tomar el input por defecto
#' @param scoreWords List. El nombre para cada estado de la barra, tienen que ser cinco.
#' @param minLength Numeric. La cantidad minima de caracteres para que no aparezca la leyenda definida en \code{shortScoreWord}
#' @param shortScoreWord Character. Texto que se muestra cuando no se alcanzan la cantidad minima de caracteres
#'
#' @return Un widget de entrada de shiny.
#'
#' @examples
#' \dontrun{
#' library(shiny)
#'
#' ui <- fluidPage(
#'   titlePanel("Ejemplo de Barra de Fortaleza de Contraseña"),
#'   sidebarLayout(
#'     sidebarPanel(
#'       strengthBarInput("contrasena", default = list(password = ""))
#'     ),
#'     mainPanel(
#'       verbatimTextOutput("output")
#'     )
#'   )
#' )
#'
#' server <- function(input, output) {
#'   output$output <- renderPrint({
#'     input$contrasena
#'   })
#' }
#'
#' shinyApp(ui = ui, server = server)
#' }
strengthBarInput <- function(inputId,
                             default = list(password = ""),
                             scoreWords = list("Insegura", "Mala", "Regular", "Buena", "Excelente"),
                             minLength = 4,
                             shortScoreWord = "Muy Corta") {
  reactR::createReactShinyInput(
    inputId       = inputId,
    class         = "strengthBar",
    dependencies  = htmltools::htmlDependency(
      name = "strengthBar-input",
      version = "1.0.0",
      src = "www/rCohenWidgets/strengthBar",
      package = "rCohenWidgets",
      script = "strengthBar.js"
    ),
    default       = default,
    configuration = list(
      scoreWords     = scoreWords,
      shortScoreWord = shortScoreWord,
      minLength      = minLength
    ),
    container     = htmltools::tags$span
  )
}
