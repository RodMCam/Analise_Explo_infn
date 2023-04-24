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


 #   observeEvent(input$daterange,{
#      base_filtrada  <- base_dados_s %>% 
 #       dplyr::filter(Data >= input$daterange[1] & Data <= input$daterange[2]) 
  #      })

  
  
      output$distPlot <- renderPlot({

      #  base_filtrada  <- base_dados_s  %>% 
       #   dplyr::filter(Data >= min(input$daterange) & Data <= max(input$daterange))
  
        x <- base_dados_s$Data
        
        y <- base_dados_s$furto_bicicleta



        

        # draw the histogram with the specified number of bins
        ggplot() +
          geom_line(data =  base_dados_s,  aes(y = y , x = x, color = "" )) +
          labs(x = "Data", y = "Quantidade de Registros",  title ="Registros de Furtos a bicicleta") +
          theme_minimal() +
          scale_color_manual( values = c(input$cor)) +
     #     xlim(min(input$Lim_X),max (input$Lim_X)) +
          ylim(min(input$Lim_Y),max (input$Lim_Y)) 


    })

})
