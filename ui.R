

library(shiny)

navbarPage( "Flower and plants Data",
  tabPanel( "Table",
            sidebarLayout(
              sidebarPanel(
                
                sliderInput("YEAR",
                            label = "select Year",
                            min = 2007,
                            max = 2019,
                            value = 2007,sep = "" 
                            ), #Ends sliderInput
                
                selectInput("Province",
                            "which Province:",
                            choices = c(
                              "Alberta",
                              "British Columbia",
                              "Manitoba",
                              "Newfoundland and Labrador",
                              "Nova Scotia",
                              "New Brunswick",
                              "Quebec",
                              "Ontario",
                              "Prince Edward Island",
                              "Saskatchewan",
                              "Canada"
                            ) #c ends
        
                ), #selectInput ends
                
                selectInput( "SP",
                             h5("What kind of data?"), 
                             choices =  c("Sales" ,
                                          "Production (number)"
                                          ), # c ends
                             selected = 1
                             
                ) #ends selectInput
              ), #sidebarPanel ends
              
              mainPanel(
                DTOutput('table1'),
                plotOutput('plot1')
              ) #mainpanel ends
              
            ) #sidberLayout end
  ), #tasbpanel 1 ends
  
  
  tabPanel( "charts", 
    fluidPage(
      # Application title
      titlePanel("Flower Data"),
      # Sidebar with a slider input for number of bins 
      sidebarLayout(
        sidebarPanel(
          selectInput("FlowersPlants",
                      "Total Flowers and Plants:",
                      choices = c(
                        "Total cuttings [1151433]",
                        "Total cut flowers [1151435]",
                        "Total ornamental bedding plants [115143411]",
                        "Total potted plants [1151431 + 1151432]",
                        "Total vegetable bedding plants [115143421]"
                        
                      ) #c ends
                      
                      
          ), #selectInput ends
          sidebarLayout(
            checkboxInput("Barplot", strong("Bar plot?"), FALSE),
            conditionalPanel(
              condition = "input.Barplot == true", 
              helpText(HTML("<h3>Barplot</h3>")), 
              sliderInput("YEAR2",
                          label = "select Year:",
                          min = 2010,
                          max = 2019,
                          value = 2007,sep = "" 
            ) #Ends sliderInput
            
          )#Ends conditionalPanel 
          ) #End SidebarLayout
        
          
          
        ), #sidebarPanel ends
        mainPanel(
          plotOutput('plot2'),
          plotOutput('plot3'),
          tableOutput('table2')
          
        )
        
        
      )#sidebar Layoout ends
      
    ) #fluid page ends
    
  ) #tabpanel2 ends
  
) #navbarPage ends
