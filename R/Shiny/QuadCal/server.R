library(shiny)
shinyServer(function(input, output){
  observe({
    a=as.numeric(input$Aval)
    b=as.numeric(input$Bval)
    c=as.numeric(input$Cval)
    det = (b^2)-(4*a*c)
    output$r1 = renderText(ifelse(det>=0, (-b+sqrt((b^2)-(4*a*c)))/(2*a), "No Root"))
    output$r2 = renderText(ifelse(det>=0, (-b-sqrt((b^2)-(4*a*c)))/(2*a), "No Root"))
  })
})