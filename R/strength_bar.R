# Exportar funciones ------------------------------------------------------

#' @export strengthBarInput
NULL


#' React Password Strength Bar
#'
#' Esta función proporciona un widget de entrada de contraseña para Shiny, que incluye una
#' barra de fortaleza de contraseña proveniente de la libreria
#' [react-password-strength-bar](https://www.npmjs.com/package/react-password-strength-bar).
#' La barra de fortaleza muestra la seguridad del texto
#' ingresado basándose en cinco posibles estados, siendo el estado mayor el más seguro.
#' El widget de entrada crea una lista en Shiny que contiene el texto ingresado y la
#' puntuación de seguridad, que varía de 0 a 4.
#'
#' @param inputId Character. Id del input.
#' @param label Character. Texto del input.
#' @param icon Character. Icono que aparece al lado del texto del input.
#' @param scoreWords Character. El nombre para cada estado de la barra, tienen que ser cinco.
#' @param minLength Numeric. La cantidad mínima de caracteres para que no aparezca la leyenda definida en \code{shortScoreWord}.
#' @param shortScoreWord Character. Texto que se muestra cuando no se alcanzan la cantidad mínima de caracteres.
#'
#' @return Lista con valor del input y nivel de seguridad.
#'
#' @examples
#' \dontrun{
#' library(shiny)
#' devtools::load_all()
#'
#' ui <- fluidPage(
#'   fontawesome::fa_html_dependency(),
#'   column(
#'     width = 6,
#'     strengthBarInput("textInput"),
#'     textOutput("textOutput"),
#'     actionButton("calcular", "Calcular")
#'   )
#' )
#'
#' server <- function(input, output, session) {
#'
#'   valor <- reactiveValues(password = "", score = 0)
#'
#'   observeEvent(input$calcular, {
#'     valor$password <- input$textInput$password
#'     valor$score <- input$textInput$score
#'   })
#'
#'   output$textOutput <- renderText({
#'     glue::glue(
#'       "Password: {valor$password} | Score: {valor$score}"
#'     )
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
strengthBarInput <- function(inputId,
                             label = "Contraseña",
                             icon = "lock",
                             scoreWords = c("Insegura", "Mala", "Regular", "Buena", "Excelente"),
                             minLength = 6,
                             shortScoreWord = "Muy Corta") {

  checkmate::assert_character(
    x           = scoreWords,
    any.missing = FALSE,
    len         = 5L
  )

  checkmate::assert_numeric(
    x           = minLength ,
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
    default       = "",
    configuration = list(
      label          = label,
      icon           = icon,
      scoreWords     = scoreWords,
      shortScoreWord = shortScoreWord,
      minLength      = minLength
    ),
    container     = htmltools::tags$span
  )
}
