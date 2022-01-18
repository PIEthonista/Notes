library(shiny)
shinyUI(fluidPage(
  titlePanel("Quadratic Equation Solver"),
  sidebarLayout(
    sidebarPanel(
      h4("Equation: Ax^2 + Bx + C"),
      textInput("Aval", "Enter the value of A: "),
      textInput("Bval", "Enter the value of B: "),
      textInput("Cval", "Enter the value of C: ")
    ),
    mainPanel(
      h3("Root 1: "),
      textOutput("r1"),
      h3("Root 2: "),
      textOutput("r2")
    )
  )
))