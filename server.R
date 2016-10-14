
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(d3heatmap)
library(reshape2)

shinyServer(function(input, output) {

  output$heatmap <- renderD3heatmap({
    
    `dataset` = read.csv('C:/Users/alkhos/AppData/Local/Radio/REditorWrapper_6230fee7-61d1-47ca-a90b-3bfb93dafbc4/input_df_1bcfecf8-a88a-4742-801c-427118eb69d9.csv', check.names = FALSE, encoding = "UTF-8", blank.lines.skip = FALSE);
    
    dataset$RttP99<-as.numeric(dataset$RttP99)
    matrix_dataset<-dcast(data=dataset, formula = srcCluster~destCluster, fun.aggregate = sum, value.var = "RttP99")
    row.names(matrix_dataset)<-matrix_dataset$srcCluster
    matrix_dataset$srcCluster<-NULL
    matrix_dataset<-as.matrix(matrix_dataset)
    d3heatmap(scale(matrix_dataset), colors = input$palette, dendrogram='none')

  })
  
})
