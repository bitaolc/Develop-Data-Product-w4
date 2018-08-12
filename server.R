#Developing Data Product Week 4 Assignment
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   model <- lm(dist ~ speed, cars)
   modelpred <- reactive({
     speedInput <- input$sliderspeed
     predict(model, newdata = data.frame(speed=speedInput))
   })
   
   output$plot <- renderPlot({
    # generate bins based on input$bins from ui.R
    speedInput <- input$sliderspeed
    # draw the histogram with the specified number of bins
    plot(dist ~ speed, data = cars, 
         ylab = "Stopping Distance (ft)", xlab = "Speed (mph)")
    if (input$showModel){
      abline(model, col="blue2")
      points(speedInput, modelpred(), col="red", pch=16, cex=1.5)
    }
  })
  output$pred <- renderText({
    paste(round(modelpred(),2),"ft")
  })
})
