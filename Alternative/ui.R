data <- fread("./Data/Influenza_Laboratory-Confirmed_Cases_By_County__Beginning_2009-10_Season.csv")

ui <- fluidPage(
  titlePanel("R Shiny Framework"),
  navlistPanel(
    "Tabs",
    tabPanel("First Tab",
             h3("Confirmed Flu Cases by Season"),
             selectInput("region_id", 'Please select a region', 
                         choices = unique(data$Region),
                         selected = "WESTERN")
             
    ),
    mainPanel(
      plotOutput(outputId = "plot_id"),
      h6("Data Provided by New York State Department of Health"))
  )
)