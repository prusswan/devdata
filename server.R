library(shiny)


Team <- c('Germany','United States','Ghana','Portugal')
Played <- c(3,3,3,3)
W <- c(1,1,0,0)
D <- c(1,1,1,1)
L <- c(0,0,1,1)
GF <- c(6,4,3,2)
GA <- c(2,3,4,6)



df = data.frame(Team,Played,W,D,L,GF,GA)
df$GD <- with(df, GF - GA)
df$Pts <- with(df, W * 3 + D)


shinyServer(
  function(input, output){
        
    output$mytable1 = renderDataTable(
      df,
      options = list(bFilter=0, bSort=0, bProcessing=0, bPaginate=0, bInfo=0, bSearchable=0,
        aoColumns = 
          list(list(bSearchable=0), list(bSearchable=0), list(bSearchable=0), list(bSearchable=0), 
              list(bSearchable=0),list(bSearchable=0), list(bSearchable=0), list(bSearchable=0), list(bSearchable=0))
      )
    )
  }
)