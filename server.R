library(shiny)

source("predictor.R", local = TRUE)

shinyServer(
    function(input, output){
        output$outcome <- renderText({
            survivability(input$age, input$sex, input$marital,
                          input$pc, input$sib, input$sp, input$class)
            })
        
        output$tidbit <- renderText({
            tidbit(input$age, input$sex, input$marital,
                          input$pc, input$sib, input$sp, input$class)
        })
        
        output$table <- renderDataTable({
            training
            }, options = list(searching = FALSE, pageLength = 50))
        
        output$downloadData <- downloadHandler(
            filename = 'preprocessed.csv',
            content = function(file) {
                write.csv(dataTable(), file, row.names=FALSE)
            }
        )
    }
)