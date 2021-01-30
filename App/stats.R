library(shiny)
library(shinyWidgets)
library(shiny.semantic)


statsBTN <- div(
  class="stats_btn",
  button("simple_button", "Statystyki")
)


statsBoxFlex <- div(
  class="stats_box_flex",
  
  # item
  
  div(
    class="stats_item",
    dropdown_input(
      "simple_dropdown",
      value = "test - 1",
      c("test - 1","test - 2")
    ),
    h5("$ 2 255 423"),
    div(
      class="s_item_profit",
      p("TOTAL PROFIL"),
      p("+ 4,5 %")
    )
  ),
  
  # item
  
  div(
    class="stats_item",
    dropdown_input(
      "simple_dropdown",
      value = "test - 1",
      c("test - 1","test - 2")
    ),
    h5("$ 2 255 423"),
    div(
      class="s_item_profit",
      p("TOTAL PROFIL"),
      p("+ 4,5 %")
    )
  ),
  
  # item
  
  div(
    class="stats_item",
    dropdown_input(
      "simple_dropdown",
      value = "test - 1",
      c("test - 1","test - 2")
    ),
    h5("$ 2 255 423"),
    div(
      class="s_item_profit",
      p("TOTAL PROFIL"),
      p("+ 4,5 %")
    )
  ),
  
  # item
  
  div(
    class="stats_item",
    dropdown_input(
      "simple_dropdown",
      value = "test - 1",
      c("test - 1","test - 2")
    ),
    h5("$ 2 255 423"),
    div(
      class="s_item_profit",
      p("TOTAL PROFIL"),
      p("+ 4,5 %")
    )
  )
  
  
)
