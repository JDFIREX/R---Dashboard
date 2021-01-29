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



library(raster)
world_spdf <- shapefile("./DATA/world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.dbf")

library(dplyr)
world_spdf@data$POP2005[ which(world_spdf@data$POP2005 == 0)] = NA
world_spdf@data$POP2005 <- as.numeric(as.character(world_spdf@data$POP2005)) / 1000000 %>% round(2)


# Library
library(leaflet)


mypalette <- colorNumeric( palette = "plasma", domain=world_spdf@data$AREA, na.color="transparent")


mytext <- paste(
  "Country: ", world_spdf@data$NAME,"<br/>", 
  "Area: ", world_spdf@data$AREA, "<br/>", 
  "Population: ", round(world_spdf@data$POP2005, 2),"M", 
  sep="") %>%
lapply(htmltools::HTML)


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
           leaflet(data = world_spdf, width = "100%", height = "100%") %>% 
             setView( lat=0, lng=0 , zoom=2) %>%
             addPolygons( fillColor = ~mypalette(AREA), stroke=FALSE,label = mytext , smoothFactor = 0.2, fillOpacity = 1,color="white", weight=0.3,
                labelOptions = labelOptions( 
                  style = list("font-weight" = "normal", padding = "3px 8px"), 
                  textsize = "13px", 
                  direction = "auto"
                ))
          
           
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