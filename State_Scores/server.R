library(shiny)
library(dplyr)

# setwd("~/Github/developing-data-products/State_Scores")
source("helpers.R", local = TRUE)
data1 <- make_table()


# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    
    if (input$Temperature_Ranking != "All") {
      data1 <- data1[data1$Temperature_Ranking == input$Temperature_Ranking,]
    }
    if (input$Well_Being_Ranking != "All") {
      data1 <- data1[data1$Well_Being_Ranking == input$Well_Being_Ranking,]
    }
    if (input$total_score != "All") {
      data1 <- data1[data1$total_score == input$total_score,]
    }
    data1
  }))

  
})

