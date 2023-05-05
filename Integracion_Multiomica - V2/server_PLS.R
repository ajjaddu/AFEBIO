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
pls_function <- reactive({
  if (is.null(input$omics)) return(NULL)
  if (is.null(input$grupos)) return(NULL)
  if (is.null(input$same_patients)) return(NULL)
  if (is.null(input$components)) return(NULL)
  if (is.null(input$integration)) return(NULL)
  if (is.null(input$type_analysis)) return(NULL)
  if (is.null(input$type_analysis3)) return(NULL)
  if (is.null(input$type_PLS)) (modo <- "regression")
  if (input$type_analysis3 == "None") return(NULL)
  
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
  
  if (input$same_patients=="No"){
    
    a <- lapply(lista_omicas,rownames)
    b <- do.call("c",a)
    c <- as.data.frame(table(b))
    nombres_comunes <- as.character(c[which(c[,2]==length(lista_omicas)),1])
    
    for (n in 1:length(lista_omicas)){
      lista_omicas[[n]] <- lista_omicas[[n]][rownames(lista_omicas[[n]])%in%nombres_comunes,]
    }
  }
  
  grupillos <- as.data.frame(groups())
  grupillos <- grupillos[grupillos$Description %in% nombres_comunes,]
  grupillos <- as.vector(grupillos[,input$grupos])
  modo <- input$type_PLS
  
  if (input$number_omics == 2 & input$type_analysis3 == "PLS"){
    
    X <- lista_omicas[[1]]
    Y <- lista_omicas[[2]]
    
    modelo = pls(X = X, Y = Y, ncomp = input$components, mode = modo)
    
  }
  
  if (input$number_omics == 2 & input$type_analysis3 == "sPLS"){
    if (is.null(input$keepX)) return(NULL)
    
    X <- lista_omicas[[1]]
    Y <- lista_omicas[[2]]
    
    keepsito <- as.data.frame(keep_spls())
    
    modelo = spls(X = X, Y = Y, ncomp = input$components,keepX = keepsito[,1], keepY = keepsito[,2], mode = modo)
    
  }
  
  if (input$number_omics == 2 & input$type_analysis3 == "rCCA"){
    
    X <- lista_omicas[[1]]
    Y <- lista_omicas[[2]]
    
    modelo = rcc(X = X, Y = Y, method = 'shrinkage', ncomp = input$components) 
  }
  
  return(list(modelo,grupillos))
})


#############################################################