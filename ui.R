# Build your UI page here


ui <- fluidPage(
  # Fill in your details here
  # On the ui-side, every element needs to be followed by a comma.
  h1("Exploring the iris data set interactively"),
  
  p("This is a shiny app showing a scatter plot of Sepal Width by Petal Width, and sharing the means of each variable broken up by Species."),
  
  column(4,
    sliderInput("min_petal_width", 
                "Select the smallest Petal Width to appear in the data.",
                min = .09, max = 2.6, step = .01, value = .09),
    checkboxInput("show_color","Color Plot By Species?", value = FALSE)
  ),
  
  column(8,
    plotOutput("scatterplot")
  ),
  
  column(4, 
    
  ),
  
  column(8,
    tableOutput("my_summaries")
  )
  
)