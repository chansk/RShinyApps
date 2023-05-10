server <- function(input, output, session) {
  
  output$plot_id <- renderPlot({
    temp <- filter(data, Region == input$region_id)
    plot(x = temp$Season, y = temp$Count, xlab = "Season", ylab = "# Confirmed Flu Cases")
  })
}