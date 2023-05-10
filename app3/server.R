library(shiny)

# Define server logic to summarize and view dataset
function(input, output) {

  # Reactive expression: returns dataset corresponding to user choice
  # Rendering expresssions: create summary and view values
    # only executed when dependencies change (input$dataset or input$obs)
  
  # Return requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock, # Selecting one of three built-in datasets
           "pressure" = pressure,
           "cars" = cars)
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
}
