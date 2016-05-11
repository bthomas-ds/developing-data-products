make_table <- function(){
library(dplyr)  
rm(list=ls())
setwd("~/Github/developing-data-products")
temperatures_by_state <- read.csv("/home/bthomas/Github/developing-data-products/Data/temperature.txt", header = TRUE, stringsAsFactors = FALSE)
temperatures_by_state <- temperatures_by_state[order(-temperatures_by_state$Avg..F),]
# create a vector of 50 in descending order
a1 <- seq(1:50)
a1 <- a1[order(-a1)]

# bind the rank level score
temperature_rank <- cbind(temperatures_by_state, a1)
colnames(temperature_rank)[3] <- "Temp_Score"
rm(temperatures_by_state)

# Add State codes
states_codes <- read.csv("./Data/states.txt", stringsAsFactors = FALSE, header = TRUE)
temperature_rank <- left_join(temperature_rank, states_codes,"State" )
rm(states_codes)

# healthcare
# well being ranking for older americans
# http://www.bankrate.com/finance/retirement/best-places-retire-how-state-ranks.aspx
well_being <- read.csv("/home/bthomas/Github/developing-data-products/Data/well_being_rank.txt", header = TRUE, stringsAsFactors = FALSE)
colnames(well_being)[1] <- "Well_Being_Rank"
well_being <- well_being[with (well_being, order(-Well_Being_Rank)),]
a1 <- a1[order(a1)]
wb_rank_score <- cbind(well_being,a1)
colnames(wb_rank_score)[3] <- "wb_r_score"
rm(well_being)

# join tables together
tbl_join <- inner_join(temperature_rank, wb_rank_score, 'State')
tbl_join <- select(tbl_join, State, code, Temp_Score, wb_r_score)
tbl_join$total_score <- tbl_join$Temp_Score + tbl_join$wb_r_score
rm(temperature_rank)
rm(wb_rank_score)

# prepare data for the map
colnames(tbl_join)[3] <- "Temperature_Ranking"
colnames(tbl_join)[4] <- "Well_Being_Ranking"

rm(a1)

tbl_join$hover <- with(tbl_join, paste(State, '<br>', "Score", total_score))
make_table <- tbl_join
}