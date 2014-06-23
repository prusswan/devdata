library(shiny)




shinyServer(function(input, output){
  
  computeTable <- reactive({
    Team <- c('Germany','United States','Ghana','Portugal')
    Played <- c(3,3,3,3)
    W <- c(1,1,0,0)
    D <- c(1,1,1,1)
    L <- c(0,0,1,1)
    GF <- c(6,4,3,2)
    GA <- c(2,3,4,6)
    
    t1 <- input$goalGER
    t2 <- input$goalUSA
    t3 <- input$goalGHA
    t4 <- input$goalPOR
    
    netW <- c(t1 > t2, t2 > t1, t3 > t4, t4 > t3)
    netD <- c(t1 == t2, t2 == t1, t3 == t4, t4 == t3)
    netL <- c(t1 < t2, t2 < t1, t3 < t4, t4 < t3)
    
    W <- W + netW
    D <- D + netD
    L <- L + netL
    
    netGF <- c(input$goalGER, input$goalUSA, input$goalGHA, input$goalPOR)
    netGA <- c(input$goalUSA, input$goalGER, input$goalPOR, input$goalGHA)
            
    GF <- GF + netGF
    GA <- GA + netGA
    
    df = data.frame(Team,Played,W,D,L,GF,GA)
    df$GD <- with(df, GF - GA)
    df$Pts <- with(df, W * 3 + D)
    
    df[with(df, order(-Pts,-GD,-GF)), ]    
  })  
          
  output$mytable1 = renderDataTable(
    computeTable(),
    options = list(bFilter=0, bSort=0, bProcessing=0, bPaginate=0, bInfo=0, bSearchable=0,
      aoColumns = 
        list(list(bSearchable=0), list(bSearchable=0), list(bSearchable=0), list(bSearchable=0), 
            list(bSearchable=0),list(bSearchable=0), list(bSearchable=0), list(bSearchable=0), list(bSearchable=0))
    )
  )
  }
)