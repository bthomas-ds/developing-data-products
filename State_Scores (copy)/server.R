library(shiny)
library(dplyr)

# setwd("~/Github/developing-data-products/State_Scores")
# source("helpers.R", local = TRUE)
# data1 <- make_table()
# con <- gzfile("Data/data1.rds")
# data1 <- readRDS(con)
# close(con)
# data1 <- readRDS("Data/data1_rds.rds")
# data1 <- data1[order(-data1$total_score),]

# con <- gzfile("Data/data1.rds")
# data1 <- readRDS(con)
# close(con)

# data1 <- readRDS("Data/data1_rds.rds")
#data1 <- data1[order(-data1$total_score),]


con <- gzfile("Data/data1.rds")
data1 <- readRDS(con)
data1 <- data1[order(-data1$total_score),]



#df1 for map
df1 <- select(data1, State, total_score)
df1$State <- stringr::str_to_lower(df1$State)
colnames(df1)[1] <- "region"
colnames(df1)[2] <- "value"
df1$values <- as.numeric(df1$value)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  
  # Filter data based on selections
  
  con <- gzfile("Data/data1.rds")
  data1 <- readRDS(con)
  data1 <- data1[order(-data1$total_score),]
  
  #df1 for map
  df1 <- select(data1, State, total_score)
  df1$State <- stringr::str_to_lower(df1$State)
  colnames(df1)[1] <- "region"
  colnames(df1)[2] <- "value"
  df1$values <- as.numeric(df1$value)
  
  output$usamap <- renderPlot(state_choropleth(df1))
  
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

