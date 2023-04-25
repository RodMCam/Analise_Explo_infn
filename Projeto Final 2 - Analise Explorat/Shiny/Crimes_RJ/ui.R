#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Quantidade de crimes de furto no Estado do RJ por dia"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateRangeInput("daterange", "Escolha um per?odo:",
                     start ="2014-01-01", 
                     end = "2022-12-31" ,
                     min = "2014-01-01" ,
                     max = "2022-12-31"
      ),
      
      
      pickerInput(
        inputId = "variavel",
        label = ("Escolha uma vari?vel"),
        choices = c("furto_bicicleta", "furto_coletivo"),
        selected = "furto_bicicleta",
        multiple = F),
      
      
      numericRangeInput(
        inputId = "Lim_Y",
        label = "Escolher limites do eixo Y :",
        value = c(0, 2000)
      ), 
      
      selectInput("cor",
                  "Escolha a cor do gr?fico:",
                  choices = c("light blue", "pink"),
                  selected = "pink"
      )
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
