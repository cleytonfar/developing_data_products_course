Developing Data Products Project
========================================================
author: Cleyton Farias
date: January 29, 2019
autosize: true

Overview
========================================================

- This application examines the data from imdb and Rotten Tomatoes of 651 movies
released in the US between 1970 and 2014; 

- The application provides an interface where the user can choose what attributes to
be plotted as well as a filter regarding preferred studios. 

- The appplication displays an scatterplot, a histogram as  well as the dataset. 

- To have access to the application, please refer to this [link](https://cleytonfarias.shinyapps.io/my_app/);

- All the necessary code to reproduce this exercise is available [here](www.google.com)


User Options
========================================================

- The user can choose from one or more studios available in the dataset. 
Available options:
**IMDB number of votes**,
**Critics score**
**Audience Score**
**Runtime**

- Moreover, the user can choose which variables to be plotted on the application;

- The user can choose to display or not the dataset;

- Also, the user can download the dataset in *csv* or *tsv* formats.



User Options
========================================================

- A summary of the dataset:


```
    title            title_type           genre              runtime     
 Length:651         Length:651         Length:651         Min.   : 39.0  
 Class :character   Class :character   Class :character   1st Qu.: 92.0  
 Mode  :character   Mode  :character   Mode  :character   Median :103.0  
                                                          Mean   :105.8  
                                                          3rd Qu.:115.8  
                                                          Max.   :267.0  
                                                          NA's   :1      
 mpaa_rating           studio          thtr_rel_date     
 Length:651         Length:651         Length:651        
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
                                                         
```


User Interface
=========================================================

<center>
![](presentation-figure/user_interface.png)
</center>

