#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above or runApp(opt dir)
# Shiny generates a HTML Web Page
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    #Fluid pages scale their components in realtime to fill all 
    # available browser width.
    #Title: The browser window title
    #Theme: Alternative Bootstrap stylesheet
    titlePanel("Slider App"),
    sidebarLayout(
        sidebarPanel(
          h1("Move the slider!"),
          sliderInput("slider2", "Slide Me!", 0, 100, 50)
          #(inputID, label, min, max, defValue)
        ),
        mainPanel(
            h3("Slider Value:"),
            textOutput("text1"),
            code("System.out.println(\"Hi\")")
        )
    )
))
