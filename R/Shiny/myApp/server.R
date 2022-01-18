#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    output$text1 = renderText(input$slider2 + 10)
    #take in slider2 value, +10, render text & name it as text1
})
