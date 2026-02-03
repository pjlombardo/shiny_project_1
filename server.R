# load necessary packages
# and source your functions.R file

library(shiny)
library(tidyverse)

source('functions.R')

# this function defines your server logic
server <- function(input, output){
  # you will put your interactions here
  
  
  
  # placeholder plot
  output$scatterplot <- renderPlot(
    hist(iris$Sepal.Length)
  )
  
  # placehold table
  output$my_summaries <- renderTable(
    iris %>%
      group_by(Species) %>%
      summarise(sample_size = n())
  )

  
}
