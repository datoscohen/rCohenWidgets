# Exportar funciones ------------------------------------------------------

#' @export strengthBarInput
#' @export updateStrengthBarInput
NULL


#' React Password Strength Bar
#'
#' @param inputId
#' @param default Character. Valor que va a tomar el input por defecto
#' @param scoreWords List. El nombre para cada estado de la barra, tienen que ser cinco.
#' @param minLength Numeric. La cantidad minima de caracteres para que no aparezca la leyenda definida en \code{shortScoreWord}
#' @param shortScoreWord Character. Texto que se muestra cuando no se alcanzan la cantidad minima de caracteres
strengthBarInput <- function(inputId,
                             default = "",
                             scoreWords = list("Insegura", "Mala", "Regular", "Buena", "Excelente"),
                             minLength = 4,
                             shortScoreWord = "Muy Corta") {
  reactR::createReactShinyInput(
    inputId,
    "strengthBar",
    htmltools::htmlDependency(
      name = "strengthBar-input",
      version = "1.0.0",
      src = "www/rCohenWidgets/strengthBar",
      package = "rCohenWidgets",
      script = "strengthBar.js"
    ),
    default,
    list(
      scoreWords     = scoreWords,
      shortScoreWord = shortScoreWord,
      minLength      = minLength
    ),
    htmltools::tags$span
  )
}

#' Actualizar strengthBar widget
#'
#' <Add Description>
updateStrengthBarInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
