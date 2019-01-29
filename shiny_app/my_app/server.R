#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(dplyr)
library(ggplot2)
movies <- fread("movies.csv")
n_total <- nrow(movies)
all_studios <- unique(movies$studio)

# Define server logic required to draw a histogram
function(input, output) {
   
    
    ## ScatterPlot:    
    output$scatterplot <- renderPlot({
        
        ## If the studio is not provided, then display nothing (silent):
        req(input$studio)
        movies %>% 
            filter(studio %in% input$studio) %>% 
            ggplot(data = .) + 
            aes_string(x = input$x, y = input$y, color = input$z) + 
            geom_point(alpha = input$alpha) + 
            labs(y = "", x = "") +
            theme_minimal()
        
        
    })
    
    ## Density Plot    
    output$histogramplot <- renderPlot({
        
        ## If the studio is not provided, then display nothing (silent):
        req(input$studio)
        
        movies %>% 
            filter(studio %in% input$studio) %>% 
            ggplot(data = .) + 
            aes_string(x = input$x) + 
            labs(y = "", x = "") + 
            geom_histogram() + 
            theme_minimal()
        
    })
    
    ## Data Table:
    output$datamovies <- DT::renderDataTable({
        
        ## If the studio is not provided, then display nothing (silent):
        req(input$studio)
        
        ## reactive expression:
        if(input$show_data){
            DT::datatable(data = movies %>%  filter(studio %in% input$studio) %>% select(1:7),
                          options = list(pageLength = 10),
                          rownames = F)
        }
        
    })
    
    
    # Download file
    output$download_data <- downloadHandler(
        
        filename = function() {
            paste0("movies.", input$filetype)
        },
        
        content = function(file) { 
            if(input$filetype == "csv"){ 
                readr::write_csv(x = movies %>% select(1:7), path = file) 
            }
            if(input$filetype == "tsv"){ 
                readr::write_tsv(x = movies %>% select(1:7), path = file) 
            }
            
        }
        
    )
    
  
}
  
