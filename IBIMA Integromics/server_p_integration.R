############################################################
###########                                         ########
###########                 DIABLO                  ########
###########       Design by Antonio Cantarero       ########
###########                 IBIMA                   ########
###########                                         ########
############################################################

###################### Librerias ######################

#######################################################

###################### Analisis DIABLO ######################
P_integracion <- reactive({
  if (is.null(input$omics)) return(NULL)
  if (is.null(input$grupos)) return(NULL)
  if (is.null(input$components)) return(NULL)
  if (is.null(input$integration)) return(NULL)
  if (is.null(input$type_analysis)) return(NULL)
  if (is.null(input$type_analysis6)) return(NULL)
  if (input$type_analysis6 == "None") return(NULL)
  
  omicas <- as.vector(input$omics)
  
  lista_omicas <- list()
  if ("Epigenomics" %in% omicas){lista_omicas[["Epigenomics"]] <- as.data.frame(Epigenomics())} else {}
  if ("Foodomics" %in% omicas){lista_omicas[["Foodomics"]] <- as.data.frame(Foodomics())} else {}
  if ("Genomics" %in% omicas){lista_omicas[["Genomics"]] <- as.data.frame(Genomics())} else {}
  if ("Glycomics" %in% omicas){lista_omicas[["Glycomics"]] <- as.data.frame(Glycomics())} else {}
  if ("Lipidomics" %in% omicas){lista_omicas[["Lipidomics"]] <- as.data.frame(Lipidomics())} else {}
  if ("Metabolomics" %in% omicas){lista_omicas[["Metabolomics"]] <- as.data.frame(Metabolomics())} else {}
  if ("Microbiomics" %in% omicas){lista_omicas[["Microbiomics"]] <- as.data.frame(Microbiomics())} else {}
  if ("Proteomics" %in% omicas){lista_omicas[["Proteomics"]] <- as.data.frame(Proteomics())} else {}
  if ("Transcriptomics" %in% omicas){lista_omicas[["Transcriptomics"]] <- as.data.frame(Transcriptomics())} else {}

  
  grupillos <- as.data.frame(groups())
  
  X <- lista_omicas[[1]]
  Y <- grupillos
  Y[,2] <- as.factor(Y[,2])
  Y[,3] <- as.factor(Y[,3])
  
  if (input$number_omics == 1 & input$type_analysis6 == "mint.plsda"){
    
    final.diablo.model <- mint.plsda(X, Y[,2], study = Y[,3], ncomp = input$components) # generate basic MINT pls-da model
  }
  
  if (input$number_omics == 1 & input$type_analysis6 == "mint.splsda"){
    
    design = matrix(0.1, ncol = length(X), nrow = length(X), 
                    dimnames = list(names(X), names(X)))
    diag(design) = 0 # set diagonal to 0s
    
    list.keepX <- keep_pint()
    
    final.diablo.model = mint.splsda(X = X, Y = Y[,2], study = Y[,3], ncomp = input$components, keepX = list.keepX) # generate basic MINT pls-da model
  }

  return(list(final.diablo.model,Y))
})


#############################################################