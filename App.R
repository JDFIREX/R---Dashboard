library(shiny)
library(shinyWidgets)
library(shiny.semantic)

source("./App/map.R")
source("./App/stats.R")
source("./App/wykres.R")


ui <- semanticPage(
  
  tags$head(
    includeCSS("./style.css"),
    includeScript("https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js")
  ),
  
  
  div(
    class="main_map",
    map
  ),
  div(
    class="stats",
    statsBTN
  ),
  
  div(
    class="stats_box",
    statsBoxFlex
  ),
  
  
  wykres,
  wykresBTN,
  
  includeScript("App.js")
)


server <- function(input, output) {
  output$plot1 <- wykresRender
}
shinyApp(ui, server)




