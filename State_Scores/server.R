#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library("plotly")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  source("/home/bthomas/Github/developing-data-products/State_Scores/helpers.R")
  tbl_join <- make_table()
  
  output$rankPlot <- renderPlot({
    
    
    # give state boundaries a white border
    l <- list(color = toRGB("white"), width = 2)
    # specify some map projection/options
    g <- list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      showlakes = TRUE,
      lakecolor = toRGB('white')
    )
    
    p <- plot_ly(tbl_join, z = total_score, text = hover, locations = code, type = 'choropleth',
            locationmode = 'USA-states', color = total_score, colors = 'Blues',
            marker = list(line = l), colorbar = list(title = "Total Score"))
    layout(p, title = 'Well Being Score + Temperature Ranking Score<br>(Hover for breakdown)', geo = g)
    
    
  })
  
})
