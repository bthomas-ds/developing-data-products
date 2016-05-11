

library(shiny)
library(DT)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Temperature & Well Being Composite Rankings"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
             selectInput("Well_Being_Ranking",
                         "Well_Being_Ranking:",
                         c("All",
                           unique(as.character(data$Well_Being_Ranking))))
      ),
      column(4,
             selectInput("Temperature_Ranking",
                         "Temperature_Ranking:",
                         c("All",
                           unique(as.character(data$Temperature_Ranking))))
      ),
      column(4,
             selectInput("Total_Score",
                         "Total_Score:",
                         c("All",
                           sort(unique(data$total_score))))
      )
    ),
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table"),
      tags$p("Temperatures scores were developed by reverse rank scoring. A number 1 in average temperature was assigned a 50. Number 2 was assigned a 49, etc."),
      tags$p("The original data can be viewed at https://www.currentresults.com/Weather/US/average-annual-state-temperatures.php"),
      tags$p("Well being scores were also reverse rank ordered scores and extracted from http://www.bankrate.com/finance/retirement/best-places-retire-how-state-ranks.aspx")
    )
  
  )
  
)



