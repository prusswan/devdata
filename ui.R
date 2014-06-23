library(shiny)

Team <- c('Germany','United States','Ghana','Portugal')


shinyUI(
  pageWithSidebar(
    headerPanel("World Cup 2014"),
    sidebarPanel(
      helpText("Use this calculator to determine the teams that will qualify from the group, depending on the scores in their final group games."),
      h4("Match 45"),
      fluidRow(
        column(4,
          numericInput('goalUSA', 'United States', 0, min=0, max =10, step=1)
        ),
        column(1,
          br(),
          h4(":", style="text-align:center")  
        ),
        column(4,
          numericInput('goalGER', 'Germany', 0, min=0, max =10, step=1)
        )

      ),
      h4("Match 46"),
      fluidRow(
        column(4,
               numericInput('goalPOR', 'Portugal', 0, min=0, max =10, step=1)
        ),
        column(1,
               br(),
               h4(":", style="text-align:center")  
        ),
        column(4,
               numericInput('goalGHA', 'Ghana', 0, min=0, max =10, step=1)
        )
        
      )
    ),

    mainPanel(
      h3('Group G'),
      dataTableOutput("mytable1")
      
      # plotOutput('newHist')     
    )
  )
)