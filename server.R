library(shiny)
library(ggplot2)
library(datasets)

shinyServer(function(input, output) {
  output$airPlot <- reactivePlot(function() {
    # body of the function
    # aes_string means u can put strings inside with double quotes
    ggplot(airquality,aes_string(input$X_axis, input$Y_axis)) + geom_point(size=3,color="green") + theme_bw()
    # print(plot)
    
  })
})