library(tidyverse)
library(shiny)

weather <- read_csv("../test/weather_monthsum.csv")

ui <- fluidPage(
  #title:
  titlePanel("Cotton EDA"),
  
  #sidebar with slider:
  sidebarLayout(
    sidebarPanel(
      varSelectInput("variable",
                     "Variable:",
                     weather)
    ),
    mainPanel(
      plotOutput("Plot")
    )
  )
)

server <- function(input, output) {
  output$Plot <- renderPlot({
    ggplot(data = weather,
           aes(x = !!sym(input$variable))) +
      geom_density() 
    
  })
  
}

shinyApp(ui, server)
