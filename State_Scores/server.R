

library(shiny)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
library(dplyr)
source("helpers.R")



# Define a server for the Shiny app
shinyServer(function(input, output) {
  data <- select(make_table(), State, Temperature_Ranking, Well_Being_Ranking, total_score)
  data$total_score <- as.numeric(data$total_score)
  data$Temperature_Ranking <- as.numeric(data$Temperature_Ranking)
  data$Well_Being_Ranking <- as.numeric(data$Well_Being_Ranking)
  data <- data[order(-data$total_score),]
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    
    if (input$Well_Being_Ranking != "All") {
      data <- data[data$Well_Being_Ranking == input$Well_Being_Ranking,]
        
    }
    if (input$Temperature_Ranking != "All") {
      data <- data[data$Temperature_Ranking == input$Temperature_Ranking,]
    }
    if (input$Total_Score != "All") {
      data <- data[data$total_score == input$Total_Score,]
    }
    data
  }))
  
})

