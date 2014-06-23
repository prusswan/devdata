library(shiny)

Team <- c('Germany','United States','Ghana','Portugal')


shinyUI(
  pageWithSidebar(
    headerPanel("World Cup 2014"),
    sidebarPanel(
      h4("Match 45"),
      fluidRow(
        column(4,
          numericInput('goal-USA', 'United States', 0, min=0, max =10, step=1)
        ),
        column(1,
          br(),
          h4(":", style="text-align:center")  
        ),
        column(4,
          numericInput('goal-GER', 'Germany', 0, min=0, max =10, step=1)
        )

      ),
      h4("Match 46"),
      fluidRow(
        column(4,
               numericInput('goal-POR', 'Portugal', 0, min=0, max =10, step=1)
        ),
        column(1,
               br(),
               h4(":", style="text-align:center")  
        ),
        column(4,
               numericInput('goal-GHA', 'Ghana', 0, min=0, max =10, step=1)
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