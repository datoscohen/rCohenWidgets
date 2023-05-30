# Exportar funciones ------------------------------------------------------

#' @export strengthBarInput
#' @export updateStrengthBarInput
NULL


#' React Password Strength Bar
#'
#' Este input recibe una clave y e indica en la barra inferior y valida su fortaleza según cinco
#' estados posibles, siendo el mayor el de mayor seguridad.
#'
#' @param inputId
#' @param default Character. Valor que va a tomar el input por defecto
#' @param scoreWords List. El nombre para cada estado de la barra, tienen que ser cinco.
#' @param minLength Numeric. La cantidad minima de caracteres para que no aparezca la leyenda definida en \code{shortScoreWord}
#' @param shortScoreWord Character. Texto que se muestra cuando no se alcanzan la cantidad minima de caracteres
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
