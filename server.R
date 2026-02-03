# load necessary packages
# and source your functions.R file

library(shiny)
library(tidyverse)
library(kableExtra)

source('functions.R')

# this function defines your server logic
server <- function(input, output){
  # you will put your interactions here
  
  # we want a dataframe df to be reactive (responsive)
  # to the input of min_petal_width.
  df <- reactiveValues(data = iris)
  
  observeEvent(input$min_petal_width, {
    df$data <- iris %>% filter(Petal.Width > input$min_petal_width)
  })
  
  # placeholder plot
  output$scatterplot <- renderPlot(
    create_plot(df$data, input$show_color)
  )
  
  # placehold table
  output$my_summaries <- function(){
    create_table(df$data)
  }

  
}
