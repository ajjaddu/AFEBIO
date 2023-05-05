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
Diablo <- reactive({
  if (is.null(input$omics)) return(NULL)
  if (is.null(input$grupos)) return(NULL)
  if (is.null(input$same_patients)) return(NULL)
  if (is.null(input$components)) return(NULL)
  if (is.null(input$integration)) return(NULL)
  if (is.null(input$type_analysis)) return(NULL)
  if (is.null(input$type_analysis2)) return(NULL)
  if (input$type_analysis2 == "None") return(NULL)
  
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
  
  if(input$same_patients=="No"){
  grupillos <- grupillos[grupillos$Description %in% nombres_comunes,]
  grupillos <- as.vector(grupillos[,input$grupos])
  }
  
  X <- lista_omicas
  Y <- grupillos
  
  if (input$number_omics >= 3 & input$type_analysis2 == "block.plsda"){
    
    design = matrix(0.1, ncol = length(X), nrow = length(X), 
                    dimnames = list(names(X), names(X)))
    diag(design) = 0 # set diagonal to 0s
    
    final.diablo.model = block.plsda(X = X, Y = Y, ncomp = input$components,design = design,scale = T)
  }
  
  if (input$number_omics >= 3 & input$type_analysis2 == "block.splsda"){
    
    design = matrix(0.1, ncol = length(X), nrow = length(X), 
                    dimnames = list(names(X), names(X)))
    diag(design) = 0 # set diagonal to 0s
    
    list.keepX <- keep_block.splsds()
    
    final.diablo.model = block.splsda(X = X, Y = Y, ncomp = input$components,design = design, keepX=list.keepX, 
                                     scale = T)
  }

  return(list(final.diablo.model,Y))
})


#############################################################