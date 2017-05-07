library(shiny)
shinyUI(fluidPage(
  titlePanel("Predicttion of Weight given Height"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("SliderHeight", "What is the height (in inches) of a female/person?", 56, 77, value=68),
       checkboxInput("showModelF", "Show/Hide ModelF",value = TRUE),
       checkboxInput("showModelFm", "Show/Hide ModelFM", value = TRUE)
    ),
    
    mainPanel(
       plotOutput("plotF"),
       h3("Predicted Weight of a Female from Model_f:"),
       textOutput("predF"),
       plotOutput("plotFm"),
       h3("Predicted Weight of a person from Model_fm:"),
       textOutput("predFm")
    )
  )
))
