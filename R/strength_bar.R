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
#' @param inputId Character. Id del input.
#' @param default List. Valor que va a tomar el input por defecto, puede ser `NULL` también.
#' @param scoreWords Character. El nombre para cada estado de la barra, tienen que ser cinco.
#' @param minLength Numeric. La cantidad mínima de caracteres para que no aparezca la leyenda definida en \code{shortScoreWord}.
#' @param shortScoreWord Character. Texto que se muestra cuando no se alcanzan la cantidad mínima de caracteres.
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
                             scoreWords = c("Insegura", "Mala", "Regular", "Buena", "Excelente"),
                             minLength = 4,
                             shortScoreWord = "Muy Corta") {

  checkmate::assert_character(
    x           = scoreWords,
    any.missing = FALSE,
    len         = 5L
  )

  checkmate::assert_numeric(
    x           = 2 ,
    any.missing = FALSE,
    len         = 1L
  )

  checkmate::assert_character(
    x           = shortScoreWord,
    any.missing = FALSE,
    len         = 1L
  )

  reactR::createReactShinyInput(
    inputId       = inputId,
    class         = "strengthBar",
    dependencies  = htmltools::htmlDependency(
      name    = "strengthBar-input",
      version = "1.0.0",
      src     = "www/rCohenWidgets/strengthBar",
      package = "rCohenWidgets",
      script  = "strengthBar.js"
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
