library(shiny)
library(calibrate)
library(base)
shinyServer(function(input, output, session) {

        #fit<-reactive({
        #        lm(swiss[,input$select2]~swiss[,input$select1])
        #})
        
        output$plot <- renderPlot({
                fit<-lm(swiss[,input$select2]~swiss[,input$select1])
                res <- signif(residuals(fit), 5)
                pre <- predict(fit)
                if (input$fitCheckbox==TRUE){
                        plot(swiss[,input$select1],swiss[,input$select2],xlab=input$select1,ylab=input$select2,col="gray",main="Scatter + linear fit")
                        lines(swiss[,input$select1],fit$fitted.values,type="l",col="Blue",lwd=2)
                        segments(swiss[,input$select1], swiss[,input$select2], swiss[,input$select1], pre, col="red")
                        textxy(swiss[,input$select1], swiss[,input$select2], res, cx=0.7)

                } else {
                        plot(swiss[,input$select1],swiss[,input$select2],xlab=input$select1,ylab=input$select2,col="gray",main="Scatter + linear fit")
                        
                }
        })
        
        output$residuals <- renderPlot({
                fit<-lm(swiss[,input$select4]~swiss[,input$select3])
                f1<-lm(fit$residuals ~ poly(swiss[,input$select3], as.numeric(input$polyRadio), raw=TRUE))
                plot(swiss[,input$select3],fit$residuals,xlab=input$select3,ylab=input$select4,col="grey",main="Residuals from the linear fit")
                lines(swiss[,input$select3],swiss[,input$select3]*0,type="l",col="blue",lwd=2)
                points(swiss[,input$select3],f1$fitted.values,col="red",lwd=2)
        })
        
        output$summary <- renderPrint({
                fit<-lm(swiss[,input$select6]~swiss[,input$select5])
                summary(fit)
        })
        
        output$about <- renderPrint({
                "This is a small app to explore the swiss data base in R. The app displays a scatter plot and a linear fit of selected variables in the data set. The residuals from the linear model are visualized first on the original data and later in isolation. To explore the posibility of some structured trends remaining in the residuals of the linear model, the user can fit 'on the fly' several polynomial curves on the residuals. It is also possible to have a complete resume of the tested lineal models"
        })
        
})
