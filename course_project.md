Shiny Application and Reproducible Pitch
========================================================
author: Brian E. Thomas
date: May 11, 2016
autosize: true

Assignment
========================================================

The outline of the assignment for this course is:

- Develop a shiny application with associated supporting documentation.
- Deploy the application on Rstudio's shiny server.
- Share the application link by pasting it into the provided text box in the assignment page.
- Share server.R and ui.R code on github.

Data
========================================================

Two data sources were reverse ranked scored for the highest average temperature and the best to worst retirement index.

Bank Rate
- Evaluated states by weather, cost of living, crime rate, health care quality, tax rate, and community well being.
- http://www.bankrate.com/finance/retirement/best-places-retire-how-state-ranks.aspx

Average Temperature
- Average annual temperatures were scored by state.
- https://www.currentresults.com/Weather/US/average-annual-state-temperatures.php



Scoring and Data Manipulation
========================================================

Scores were extracted from the web by:
- State level data was extracted and reverse ranked score.
- total_score is the combination of the reverse ranking of the highest average temperature and the well being index ranking.
- Emacs was used for extracting the data and formatting the data into a csv file.
- The data table is sorted in descending order of total_score.


Data Table
========================================================

The data table provides for search and resorting:
- State, Temperature Ranking (annual average), Well Being Ranking, and Total Score can be click on the heading to resort.
- Search box allows you to retrieve a single search.

