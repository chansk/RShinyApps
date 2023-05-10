# library(shiny)
# above should be unnecesary if I have it in global.R

# Define UI (HTML webpage) that draws a histogram
  # fluidPage auto adjusts to browser dimensions
fluidPage(
    # Application title
    titlePanel("Old Faithful Geyser Data"),
    # Content appearing in the sidebar
    sidebarLayout(
        sidebarPanel(
          # selectInput creates a selector for choosing dataset
          selectInput(inputId = "dataset",
                      label = "Choose a dataset: ",
                      choices = c("rock", "pressure", "cars")),
          # guess: in server.r, will create a selectInput fxn with the above inputs
          
          # numericInput creates a  numeric entry, for number of obs, depending on three factors
          numericInput(inputId = "obs",
                       label = 'Number of observations to view',
                       value = 10)
          # guess: in server.r, will create a numericInput fxn with the above inputs
      ),
      # Create a main panel to display outputs
      mainPanel(
          # plotOutput("distPlot")
        # print everything contained within summary 
        verbatimTextOutput("summary"),
        # view HTML table with requested number of observations
        tableOutput("view") 
        )
    )
)

# 
