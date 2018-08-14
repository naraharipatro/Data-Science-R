
library(shiny)

shinyUI(fluidPage(
  headerPanel("plot the airquality data set"),
  sidebarPanel(
    #select input for x axis
    selectInput("X_axis", "X axis:",
                list("Ozone"="Ozone",
                     "Solar.R"="Solar.R",
                     "Wind"="Wind",
                     "Temp"="Temp")),
    
    selectInput("Y_axis", "Y axis:",
                list("Ozone"="Ozone",
                     "Solar.R"="Solar.R",
                     "Wind"="Wind",
                     "Temp"="Temp"))
    ),
  plotOutput("airPlot")
))