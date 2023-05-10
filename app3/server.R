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
  
  # Create caption
    # renders input$caption as text when textInput caption field changes
      # data-oriented reactive expressions do not depend on text,
      # so figures and table expressions are NOT called when text changes
  output$caption <- renderText({
    input$caption
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
