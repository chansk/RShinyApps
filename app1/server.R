library(shiny)

# Define server logic required to draw a histogram
  # contains functions for server (computer) to build the app
  # I think server gets run every time
  # Guess: plotOutput("distPlot") in ui.R calls output$distPlot, which uses
    # the number of bins selected as "input"

# server-side code block, which defines three arguments
function(input, output, session) {

    # Instantiate new output called 'distPlot' generated by code block within renderPlot()
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2] # extracts second column of 'faithful' dataset
        # input$bins utilizes bin variable to set length.out
        bins <- seq(min(x), max(x), length.out = input$bins + 1) 

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkblue', border = 'black',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')

    })

}
