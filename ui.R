
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(markdown)

shinyUI( fluidPage(
  h1("Rtt Percentile Heatmap"),
  selectInput("palette", "Palette", c("YlOrRd", "RdYlBu", "Greens", "Blues")),
  #checkboxInput("cluster", "Apply clustering"),
  d3heatmapOutput("heatmap")
)

)
