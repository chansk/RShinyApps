library(shiny)
library(reticulate)
library(DT)
# library(shinythemes)
# above should be unnecesary if I have it in global.R

RETICULATE_PYTHON="venvnew/bin/python" # Attention: try running first without this
py_run_file(paste0(getwd(),"/apiCalls.py"))
r_df <- py$df # assigning python variables as R variables

# Not needed, but this is how we read in other R scripts from current directory
# source("data.R") 

# Define UI (HTML webpage) that draws a histogram
  # fluidPage auto adjusts to browser dimensions
shinyUI(fluidPage(
  # theme="darkly", # does not seem to work

    # Application title
    titlePanel("Tracking some NBA statistics versus minutes played"),

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
            sliderInput("pts_threshold", "Points Threshold", min = 0, max = max(r_df$PTS), value = max(r_df$PTS) / 10),
            # Add a selectInput for choosing the y-axis variable
            selectInput("y_axis_selector", "Choose Y-Axis Variable", choices = numeric_column_names(r_df), selected = "PTS"),
            
        ),

        # Create a main panel to display outputs
        mainPanel(
          # Attention: These two work, I just don't want to display at the moment
          #plotOutput("distPlot"),
          plotOutput("scatterPlot5"),
          # plotOutput("scatterPlot4", brush = "plot_brush"),
          dataTableOutput("table")
          #   tabsetPanel(type = "tabs",
          #               tabPanel("Plot", plotOutput("distPlot")),
          #               tabPanel("Summary", verbatimTextOutput("summary")),
          #               tabPanel("Table", tableOutput("table")))
        )
    ),
    
    # Everthing after this to try out panels
    tabsetPanel(
      tabPanel("Tab 1", 
               h2("Content for Tab 1"),
               plotOutput("plot1")
      ),
      tabPanel("All Players", 
               h2("Full Datatable for all players in the NBA"),
               dataTableOutput("fullTable")
      )
    )
))


