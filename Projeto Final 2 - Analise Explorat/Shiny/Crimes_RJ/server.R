#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  #Filtra os dados de acordo com input
  
  
  observeEvent(input$daterange,{
    
    base_filtrada  <- base_dados_s %>% 
      dplyr::filter(Data >= input$daterange[1] & Data <= input$daterange[2]) 
    
    
    
    
    output$distPlot <- renderPlot({
      
      
      
      x <- base_filtrada $Data
      
      y <- base_filtrada   %>%   dplyr::pull(input$variavel)  
      
      titulo <- paste("Registros de", input$variavel)
      
     
      # draw the graph
      ggplot() +
        geom_line(data =  base_filtrada ,  aes(y = y , x = x, color = "" )) +
        labs(x = "Data", y = "Quantidade de Registros",  title =titulo) +
        theme_minimal() +
        scale_color_manual( values = c(input$cor)) +
        ylim(min(input$Lim_Y),max (input$Lim_Y)) 
      
      
    })
    
  })
  
})  
