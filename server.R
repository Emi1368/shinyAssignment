
library(shiny)
library(ggplot2)
library(dplyr)
library(utils)
library(tidyverse)
library(tibble)
library(DT)
library(ggfortify)


function(input, output) {
  D <- file.path("C:", "Users", "Elham", "Documents", "shiny2", "data2use.csv")
  my_data <- read.csv(D,fileEncoding="UTF-8-BOM")
  
  mydata <- my_data %>% 
    select("REF_DATE", "GEO", "Flowers.and.plants" , "Output", "VALUE" )
  
  

  output$table1 <- renderDT(
    
    mydata %>%
      select("REF_DATE", "GEO", "Flowers.and.plants" , "Output", "VALUE" )%>%
      
      subset(REF_DATE == input$YEAR & 
               GEO == input$Province & 
               Output == input$SP  )
    
  ) #renderDataTable end
 
  
  

  output$plot2 <- renderPlot({
 
    mydata %>% 
      subset(  GEO == "Canada" & 
               Output =="Production (number)" & 
               Flowers.and.plants == input$FlowersPlants) %>%
      
      ggplot(aes(x = REF_DATE, y = VALUE  )) +
      labs(y = "Production (number)", 
           title = "Flower and plants production in Canada") +
      geom_line(aes(color = Flowers.and.plants)) 
    
  })
  
  output$plot3 <- renderPlot(
    
    if(input$Barplot){
      if(input$YEAR2){
        
        df2<- subset(mydata$GEO, mydata$Output, REF_DATE = input$YEAR2 ,
                         Flowers.and.plants = input$FlowersPlants , mydata$VALUE)

        ggplot(data = df2 , aes(x = mydata.GEO , y = mydata.VALUE , fill = mydata.Output)) +
          geom_bar(stat = "identity", width = 0.5)
        
      }
    }
  )
  
  
  #output$plot3 <- renderPlot({
    
  #  if(input$SalesProduct){
   #   if(input$YEAR2){
        
    #    s <- mydata %>% 
     #     subset( 
      #              GEO == "Canada" & Output =="Production (number)" &
       #               Flowers.and.plants == input$FlowersPlants)
        
        #tss <- ts(data = s$VALUE, start = c(s[1,"REF_DATE"]))
        
        #plot.ts(tss)
    #  }
      
  #  }
    
    

  #})
} #function ends

