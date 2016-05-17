library(shiny)
library(ggplot2)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)


# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Retirement Planning Highest Ranking States"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
             selectInput("Temperature_Ranking",
                         "Temperature_Ranking:",
                         c("All",
                           unique(as.character(data1$Temperature_Ranking))))
      ),
      column(4,
             selectInput("Well_Being_Ranking",
                         "Well_Being_Ranking:",
                         c("All",
                           sort(unique(as.numeric(data1$Well_Being_Ranking)), decreasing = TRUE)))
      ),
      column(4,
             selectInput("total_score",
                         "total_score:",
                         c("All",
                           sort(unique(as.numeric(data1$total_score)), decreasing = TRUE)))
      )
    ),
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table")
    ),
    tags$p("Temperature ranking source: https://www.currentresults.com/Weather/US/average-annual-state-temperatures.php"),
    tags$p("Well Being ranking from: http://www.bankrate.com/finance/retirement/best-places-retire-how-state-ranks.aspx"),
    tags$p("Reverse ranking scores were used. The number 1 state would receive a 50. The number 2 state would receive a 49, etc.")
            )
  )


