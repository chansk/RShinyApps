library(shiny)
library(reticulate)
# above should be unnecesary if I have it in global.R


RETICULATE_PYTHON="venvnew/bin/python" # Attention: try running first without this
py_run_file(paste0(getwd(),"/apiCalls.py"))
r_df <- py$df # assigning python variables as R variables

# Not needed, but this is how we read in other R scripts from current directory
# source("data.R") 

# Define UI (HTML webpage) that draws a histogram
  # fluidPage auto adjusts to browser dimensions
shinyUI(fluidPage(

    # Application title
    titlePanel("NBA API AST_TOV"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          # Attention: This sliderInput() works, I just don't want to display at the moment
            # sliderInput("bins",
            #             "Number of bins:",
            #             min = 1,
            #             max = 50,
            #             value = 30),
            selectInput("team_selector", "Select Team", choices = unique(r_df$TEAM)),
            sliderInput("pts_threshold", "Points Threshold", min = 0, max = max(r_df$PTS), value = max(r_df$PTS) / 2)
            
        ),

        # Create a main panel to display outputs
        mainPanel(
          # Attention: These two work, I just don't want to display at the moment
          #plotOutput("distPlot"),
          #plotOutput("scatterPlot1"),
          plotOutput("scatterPlot2"),
          plotOutput("scatterPlot3")
          #   tabsetPanel(type = "tabs",
          #               tabPanel("Plot", plotOutput("distPlot")),
          #               tabPanel("Summary", verbatimTextOutput("summary")),
          #               tabPanel("Table", tableOutput("table")))
        )
    )
))

# 
