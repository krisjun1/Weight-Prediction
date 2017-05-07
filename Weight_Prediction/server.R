library(shiny)

shinyServer(function(input, output) {
  modelF<-lm(Weight~Height, data = data_f)
  modelFm<-lm(Weight~Height, data = data_fm)
  
  modelFpred<-reactive({
    heightInput<-input$SliderHeight
    predict(modelF, newdata=data.frame(Height=heightInput))
  })
  
  modelFmpred<-reactive({
    heightInput<-input$SliderHeight
    predict(modelFm, newdata=data.frame(Height=heightInput))
  })
  
  output$plotF<-renderPlot({
    heightInput<-input$SliderHeight
    
    plot(data_f$Height, data_f$Weight, xlab = "Height of Female (in inches)", 
         ylab = "Weight of Female (in lbs)", bty="n", pch=16,
         xlim = c(56,77), ylim = c(95, 285))
    if(input$showModelF){
      abline(modelF, col="red", lwd=2)
    }
    points(heightInput, modelFpred(), col="red", pch=16, cex=2)
  })
 
  output$plotFm <-renderPlot({
    heightInput<-input$SliderHeight
    
    plot(data_fm$Height, data_fm$Weight, xlab = "Height of a person (in inches)", 
         ylab = "Weight of a person (in lbs)", bty="n", pch=16,
         xlim = c(56,77), ylim = c(95, 285))
    if(input$showModelFm){
      abline(modelFm, col="blue", lwd=2)
    }
    points(heightInput, modelFmpred(), col="blue", pch=16, cex=2)
  })
  
  output$predF<-renderText({
    modelFpred()
  })
  output$predFm<-renderText({
    modelFmpred()
  })
  
})
