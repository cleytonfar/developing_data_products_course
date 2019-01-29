#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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


# Define UI for application that draws a histogram
fluidPage(

    # App title ----
    titlePanel(h1("Movies")),
    
    ## Sidebar layout with a input and output definitions:
    sidebarLayout(
        
        ## INPUTS:
        sidebarPanel(
            
            br(),
            HTML(paste("You can choose whatever Studio(s) you want:")),
            br(),
            selectInput(inputId = "studio",
                        label = "Select studio:",
                        choices = all_studios,
                        selected = "20th Century Fox",
                        multiple = T),
            
            selectInput(inputId = "y", 
                        label = "Y-axis:", 
                        choices = c("IMDB rating" =  "imdb_rating", 
                                    "IMDB number of votes" =  "imdb_num_votes", 
                                    "Critics score" =  "critics_score", 
                                    "Audience Score" =  "audience_score", 
                                    "Runtime" =  "runtime"), 
                        selected = "audience_score"),
            
            selectInput(inputId = "x", 
                        label = "X-axis:", 
                        choices = c("IMDB rating" = "imdb_rating", 
                                    "IMDB number of votes" = "imdb_num_votes", 
                                    "Critics score" = "critics_score", 
                                    "Audience score" =  "audience_score", 
                                    "Runtime" = "runtime"), 
                        selected = "critics_score"),
            
            selectInput(inputId = "z",
                        label = "Color by:",
                        choices = c("Title type" =  "title_type", 
                                    "Genre" =  "genre",
                                    "MPAA rating" =  "mpaa_rating", 
                                    "Critics rating" =  "critics_rating",
                                    "Audience rating" = "audience_rating"),
                        selected = "mpaa_rating"),
            
            sliderInput(inputId = "alpha", 
                        label = "Alpha:", 
                        min = 0, 
                        max = 1, 
                        value = 0.5, 
                        step = 0.1),
            
            checkboxInput(inputId = "show_data", 
                          label = "Show data", 
                          value = T),
            
            # Select filetype
            radioButtons(inputId = "filetype",
                         label = "Select filetype:",
                         choices = c("csv", "tsv"),
                         selected = "csv")
            
        ),
        
        ## OUTPUTS:
        mainPanel(
            
            tabsetPanel(type = "tabs", 
                        tabPanel(title = "Main results", 
                                 plotOutput(outputId = "scatterplot"),
                                 plotOutput(outputId = "histogramplot", height = 200),
                                 DT::dataTableOutput(outputId = "datamovies")),
                        
                        tabPanel(title = "Download the data",
                                 HTML("Select filetype and then hit 'Download data'."),
                                 br(), br(), # line break and some visual separation
                                 downloadButton(outputId = "download_data", label = "Download data"))
                        
            )
        )
        
        
    ) ## end of sidebarLayout()
    
)
