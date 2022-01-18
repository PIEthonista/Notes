library(shiny)
shinyServer(function(input, output){
  output$plot1 = renderPlot({
    set.seed(2021-12-17)
    no_of_points = input$numeric
    minX = input$sliderX[1]
    maxX = input$sliderX[2]
    minY = input$sliderY[1]
    maxY = input$sliderY[2]
    #r unif (not run if) generate uniform numbers
    dataX = runif(no_of_points, minX, maxX)
    dataY = runif(no_of_points, minY, maxY)
    #ifelse statement (expression, trueVal, falseVal)
    xlab = ifelse(input$show_xlab, "X Axis", "")
    ylab = ifelse(input$show_ylab, "Y Axis", "")
    main = ifelse(input$show_title, "Title", "")
    plot(dataX, dataY, xlab=xlab, ylab=ylab, main=main,
         xlim=c(-100, 100), ylim=c(-100, 100))
  })
})