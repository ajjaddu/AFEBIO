library(shiny)

ui <- shinyUI(fluidPage(
  
  titlePanel("Testing File upload"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput('file_input', 'upload file ( . pdf format only)', accept = c('.pdf'))
    ),
    
    mainPanel(
      uiOutput("pdfview")
    )
  )
))

server <- shinyServer(function(input, output) {
  
  observe({
    req(input$file_input)
    
    file.copy(input$file_input$datapath,"www/pepe.pdf", overwrite = T)
    
    output$pdfview <- renderUI({
      tags$iframe(style="height:600px; width:100%", src="pepe.pdf")
    })
    
  })
  
})

shinyApp(ui = ui, server = server)
