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
    titlePanel("Crimes de furto à Bicicleta no Estado do RJ"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          numericRangeInput(
            inputId = "Lim_X",
            label = "Escolher limites do eixo X :",
            value = c(0, 1000)
          ),
     #     dateRangeInput("daterange", "Escolha um período:",
     #                    
     #                    min = "2014-01-01",
     #                    max = "2022-01-01"
     #     ),

          numericRangeInput(
             inputId = "Lim_Y",
              label = "Escolher limites do eixo Y :",
              value = c(0, 1000)
            ), 
         
            selectInput("cor",
                        "Escolha a cor do gráfico:",
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
