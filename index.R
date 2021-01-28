library(shiny)
library(dygraphs)
library(ggplot2)
library(plotly)
library(shinyWidgets)
library(rgeos)
library(maptools)
library(leaflet)

data <- data.frame(
  name=c("A","B","C","D","E","F","G","H","I","J") ,  
  value=c(3,12,5,18,45,32,53,26,34,32)
)
countries <- read.csv("UIA_World_Countries_Boundaries.csv")
# Define UI
ui <- fluidPage(
  
  tags$head(
    includeCSS("./style.css")
  ),
  tags$h1(
    "Enterprise Shiny Dashboards",
    class="main_header"
  ),

  tags$div(class="header",
        tags$div(
          class="profit",
          tags$h2("$ 2 674 862",class="profi_value"),
          tags$div(
            class="profit_total_procent",
            tags$h5(class="profit_total","TOTAL PROFIT"),
            tags$p("+4,5%",class="profit_procent")
          ),
          tags$div(class="stats",
            selectInput("variable","",
              c("MONTHLY STATS" = "Month","DAILY STATS" = "Day","ANNUAL STATS" = "year"))
          )
        ),
        tags$div(
          class="profit",
          tags$h2("$ 2 674 862",class="profi_value"),
          tags$div(
            class="profit_total_procent",
            tags$h5(class="profit_total","TOTAL PROFIT"),
            tags$p("+4,5%",class="profit_procent")
          ),
          tags$div(class="stats",
                   selectInput("variable","",
                               c("MONTHLY STATS" = "Month","DAILY STATS" = "Day","ANNUAL STATS" = "year"))
          )
        ),
        tags$div(
          class="profit",
          tags$h2("$ 2 674 862",class="profi_value"),
          tags$div(
            class="profit_total_procent",
            tags$h5(class="profit_total","TOTAL PROFIT"),
            tags$p("+4,5%",class="profit_procent")
          ),
          tags$div(class="stats",
                   selectInput("variable","",
                               c("MONTHLY STATS" = "Month","DAILY STATS" = "Day","ANNUAL STATS" = "year"))
          )
        ),
        tags$div(
          class="profit",
          tags$h2("$ 2 674 862",class="profi_value"),
          tags$div(
            class="profit_total_procent",
            tags$h5(class="profit_total","TOTAL PROFIT"),
            tags$p("+4,5%",class="profit_procent")
          ),
          tags$div(class="stats",
                   selectInput("variable","",
                               c("MONTHLY STATS" = "Month","DAILY STATS" = "Day","ANNUAL STATS" = "year"))
          )
        )
      ),
    tags$div(class="main_dash",
      
      tags$div(class="left_dash",
        
          tags$div(class="production",
                   tags$div(
                     class="production_header",
                     tags$h4(class="production_title",""),
                     selectInput("production_input","",
                       c("PRODUCTION" = "Prod","SALES" = "sale"))
                   ),
                   plotlyOutput("plot1")
   
          )
      ),
      tags$div(class="right_dash",
               
               leaflet(countries)
               
      )
    )
)



# Define server function  
server <- function(input, output) {
  
  output$plot1<-renderPlotly({
    bar<-ggplot(data, aes(x=name, y=value)) + 
      geom_bar(stat = "identity", fill="#aa2345")+
      geom_point()
    bar + theme(
      panel.background = element_rect(fill = "#F9F7FC")
   )
  })
  
  
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)