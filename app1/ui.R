# library(shiny)
# above should be unnecesary if I have it in global.R

# Define UI (HTML webpage) that draws a histogram
  # fluidPage auto adjusts to browser dimensions
fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Create a main panel to display outputs
        mainPanel(
            plotOutput("distPlot")
        )
    )
)

# 
