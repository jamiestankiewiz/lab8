#install.packages('shiny')
library(shiny)

ui <- fluidPage(
                selectInput(inputId='histo', label='Variable', choices=c('Radio','TV','Newspaper')),
                plotOutput('hist')
                )

server <- function(input, output){
    output$hist <- renderPlot({   
    
    ad <- read.csv('Advertising.csv')
    
    plot(ad[,input$histo], ad$Sales, main=c(input$histo, 'vs Sales'), xlab= input$histo, ylab='Sales')
    #lm1 <- lm(Sales ~ input$histo, data=ad)
    #abline(lm1, col='red')
    }) #end renderPlot
      } #end function

shinyApp(ui=ui, server=server)
