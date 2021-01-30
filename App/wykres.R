library(shiny)
library(shinyWidgets)
library(shiny.semantic)
library(dygraphs)
library(plotly)
library(ggplot2)


data <- data.frame(
  name=c("A","B","C","D","E","F","G","H","I","J") ,  
  value=c(3,12,5,18,45,32,53,26,34,32)
)

wykres <- div(
  class="wykres_box",
  div(
    class="wykres_dane",
    dropdown_input(
      "wykres_dropdown",
      value = "test - 1",
      c("test - 1","test - 2")
    ),
    div(
      class="wykres_plotly",
      plotlyOutput("plot1")
    )
  )
)

wykresBTN <- div(
  class="wykres_btn",
  button("simple_wykres_btn", "Wykres")
)

wykresRender <- renderPlotly({
  bar<-ggplot(data, aes(x=name, y=value)) + 
    geom_bar(stat = "identity", fill="#aa2345")+
    geom_point()
  bar + theme(
    panel.background = element_rect(fill = "#F9F7FC")
  )
})