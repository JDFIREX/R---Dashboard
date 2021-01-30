library(shiny)
library(shinyWidgets)
library(shiny.semantic)
library(raster)
world_spdf <- shapefile("./DATA/world_shape_file/TM_WORLD_BORDERS_SIMPL-0.3.dbf")

library(dplyr)
world_spdf@data$POP2005[ which(world_spdf@data$POP2005 == 0)] = NA
world_spdf@data$POP2005 <- as.numeric(as.character(world_spdf@data$POP2005)) / 1000000 %>% round(2)

library(leaflet)


mypalette <- colorNumeric( palette = "plasma", domain=world_spdf@data$AREA, na.color="transparent")


mytext <- paste(
  "Country: ", world_spdf@data$NAME,"<br/>", 
  "Area: ", world_spdf@data$AREA, "<br/>", 
  "Population: ", round(world_spdf@data$POP2005, 2),"M", 
  sep="") %>%
  lapply(htmltools::HTML)


map <- leaflet(
        data = world_spdf, 
        width = "100%", 
        height = "100%"
        ) %>% 
          setView( 
            lat=51.9189046, 
            lng=19.1343786, 
            zoom=5
          ) %>%
          addPolygons( 
            fillColor = ~mypalette(AREA), 
            stroke=FALSE,label = mytext , 
            smoothFactor = 0.2, 
            fillOpacity = 1,
            color="white", 
            weight=0.3,
            labelOptions = labelOptions( 
              style = list("font-weight" = "normal", padding = "3px 8px"), 
              textsize = "13px", 
              direction = "auto"
            )
          )







