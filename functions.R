# here we develop some helper functions to make the ui.R and server.R
# files cleaner in appearance.

create_plot <- function(df, show_color){
  if (show_color){
    ggplot(data = df,
           aes(x = Sepal.Width, y = Petal.Width,
               color = Species))+
      geom_point() + 
      scale_color_brewer(palette = "Dark2")+
      labs(x = "Sepal Width (in)",
           y = "Petal Width (in)")+
      scale_y_continuous(limits = c(0,2.6))+
      scale_x_continuous(limits = c(2, 4.5))+
      theme_bw()
  } else {
    ggplot(data = df,
           aes(x = Sepal.Width, y = Petal.Width))+
      geom_point() + 
      labs(x = "Sepal Width (in)",
           y = "Petal Width (in)")+
      scale_y_continuous(limits = c(0,2.6))+
      scale_x_continuous(limits = c(2, 4.5))+
      theme_bw()
  }

}

create_table <- function(df){
  df %>%
    group_by(Species) %>%
    summarise(mean_petal = mean(Petal.Width),
              mean_sepal = mean(Sepal.Width)) %>%
    knitr::kable(
      "html",
      col.names = c("Species", "Mean Petal Width", "Mean Sepal Width"),
      align = c("r","c","c")
    ) %>%
    kable_styling(full_width = F,
                  bootstrap_options = c("hover","bordered"))
}
