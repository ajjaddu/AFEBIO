############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

groups <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$groups
  if (is.null(inFile)) return(NULL)
  df <- readxl::read_excel(input$groups$datapath)
  df <- as.data.frame(df)
  if(input$disp == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$groups <- renderDataTable(groups(),options = list(scrollX = TRUE))

Metabolomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$metabolomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$metabolomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_met == "No"){
    df <- log(df)
  } else {}
  
  if(input$disp_met == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Metabolomics <- renderDataTable(Metabolomics(),options = list(scrollX = TRUE))

Microbiomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$microbiomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$microbiomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_mic == "No"){
    df <- df + 1
    df2 <- logratio.transfo(df, logratio = 'CLR', offset = 0)
    df2 <- matrix(df2,ncol =ncol(df), nrow=nrow(df),byrow = F ) 
    df2 <- as.data.frame(df2)
    rownames(df2) <- rownames(df)
    colnames(df2) <- colnames(df)
    df <- df2
  } else {}
  
  
  if(input$disp_mic == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Microbiomics <- renderDataTable(Microbiomics(),options = list(scrollX = TRUE))

Proteomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$proteomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$proteomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_pro == "No"){
  } else {}
  
  if(input$disp_pro == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Proteomics <- renderDataTable(Proteomics(),options = list(scrollX = TRUE))

Epigenomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$epigenomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$epigenomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_epi == "No"){
  } else {}
  
  if(input$disp_epi == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Epigenomics <- renderDataTable(Epigenomics(),options = list(scrollX = TRUE))

Foodomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$foodomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$foodomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_foo == "No"){
  } else {}
  
  if(input$disp_foo == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Foodomics <- renderDataTable(Foodomics(),options = list(scrollX = TRUE))

Genomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$genomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$genomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_gen == "No"){
  } else {}
  
  if(input$disp_gen == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Genomics <- renderDataTable(Genomics(),options = list(scrollX = TRUE))

Glycomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$glycomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$glycomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_gly == "No"){
  } else {}
  
  if(input$disp_gly == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Glycomics <- renderDataTable(Glycomics(),options = list(scrollX = TRUE))

Lipidomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$lipidomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$lipidomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_lip == "No"){
  } else {}
  
  if(input$disp_lip == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Lipidomics <- renderDataTable(Lipidomics(),options = list(scrollX = TRUE))

Lipidomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$lipidomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$lipidomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_lip == "No"){
  } else {}
  
  if(input$disp_lip == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Lipidomics <- renderDataTable(Lipidomics(),options = list(scrollX = TRUE))

Transcriptomics <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$transcriptomics
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$transcriptomics$datapath,
                        sheetIndex = 1,
                        row.names=1)
  
  if (input$norm_tra == "No"){
  } else {}
  
  if(input$disp_tra == "head") {
    return(head(df))
  }
  else {
    return(df)
  }
  
})

output$Transcriptomics <- renderDataTable(Transcriptomics(),options = list(scrollX = TRUE))

observeEvent(input$analysis_question_group, {
  showModal(modalDialog(
    title = "Groups",
    HTML("When talking about groups there are some peculiarities:<br><br>
    
    <b> -   N-integration </b> <br><br>
    
    For N-integration methods the groups dataframe must have one variable of the same length as the number of patients that contains
    the information about what group belong each patient. Its a good practice to ensure that both groups and omics datasets have the 
    same patients in the same orther and labeled with the same terms.<br><br>
    
    <b>  -  P-integration </b> <br><br>
    
    For P-integration methods the groups dataframe must have the same variable as the N-integration and also other variable of the 
    same length that contains the information about the source of each sample."),
    easyClose = TRUE,
    footer = NULL
  ))
})