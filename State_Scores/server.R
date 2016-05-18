library(shiny)
library(dplyr)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  
  con <- gzfile("Data/df1.rds")
  df1 <- readRDS(con)
  close(con)
  output$usamap <- renderPlot(state_choropleth(df1))
  
  output$table <- DT::renderDataTable(DT::datatable({
    # read in presorted table
    con <- gzfile("Data/data1.rds")
    data1 <- readRDS(con)
    close(con)
    
     # Filter data based on selections
    
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

