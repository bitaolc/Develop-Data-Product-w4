#Developing Data Product Week 4 Assignment
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Predict Stopping Distance from Cars Speed"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderspeed", "The Speed of Cars", 5, 25, value = 15),
       checkboxInput("showModel", "Show/Hide Model", value = T)
    ),
   # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot"),
       h3("Predicted Stopping Distance from Linear Model"),
       textOutput("pred")
    )
  )
  
))
