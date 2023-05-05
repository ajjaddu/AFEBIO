############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

observeEvent(input$start,{
  
  ##### Output del diablo
  if (input$type_analysis2 == "None") {
  }else {
    diablo <- Diablo()
  
    output$PCA <- renderUI({
      
      outfile <- tempfile(fileext='.pdf')
      
      pdf(outfile, width=10, height=10)
      plotIndiv(diablo[[1]], 
                ind.names = FALSE, 
                legend=TRUE, cex=1:input$number_omics,
                title = 'Control vs High vs Low',
                ellipse = T)
      dev.off()
      
      file.copy(outfile,"www/individuals_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="individuals_plot.pdf")
      
    })
    
    output$Arrow <- renderUI({
      
      outfile2 <- tempfile(fileext='.pdf')
      
      pdf(outfile2, width=10, height=10)
      plotArrow(diablo[[1]],group = diablo[[2]], legend = TRUE, legend.title = 'Grupos')
      dev.off()
      
      file.copy(outfile2,"www/arrows_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="arrows_plot.pdf")
    })
    
    output$DIABLO <- renderUI({
      
      outfile3 <- tempfile(fileext='.pdf')
      
      pdf(outfile3, width=10, height=10)
      plotDiablo(diablo[[1]],ncomp = input$components_graphics)
      dev.off()
      
      file.copy(outfile3,"www/diablo_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="diablo_plot.pdf")
    })
    
    output$Variables <- renderUI({
      
      outfile4 <- tempfile(fileext='.pdf')
      
      pdf(outfile4, width=10, height=10)
      plotVar(diablo[[1]], legend = TRUE)
      dev.off()
      
      file.copy(outfile4,"www/variables_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="variables_plot.pdf")
    })
    
    output$Loadings <- renderUI({
      
      outfile5 <- tempfile(fileext='.pdf')
      
      pdf(outfile5, width=10, height=10)
      plotLoadings(diablo[[1]], comp = input$components_graphics, size.name = rel(0.5))
      dev.off()
      
      file.copy(outfile5,"www/loadings_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="loadings_plot.pdf")
    })
    
    output$Circos <- renderUI({
      
      outfile6 <- tempfile(fileext='.pdf')
      
      pdf(outfile6, width=10, height=10)
      circosPlot(diablo[[1]], cutoff=0.7,comp=input$components_graphics)
      dev.off()
      
      file.copy(outfile6,"www/circos_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="circos_plot.pdf")
    })
    
    output$Heatmap <- renderUI({
      
      outfile7 <- tempfile(fileext='.pdf')
      
      pdf(outfile7, width=10, height=10)
      cimDiablo(diablo[[1]],comp = input$components_graphics,margin=c(8,20))
      dev.off()
      
      file.copy(outfile7,"www/heatmap_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="heatmap_plot.pdf")
      
    })
    
    output$ROC <- renderUI({
      
      outfile8 <- tempfile(fileext='.pdf')
      
      pdf(outfile8, width=10, height=10)
      for(n in 1:input$number_omics){
        auroc(diablo[[1]], roc.block = n, roc.comp = input$components_graphics)
      }
      dev.off()
      
      file.copy(outfile8,"www/roc_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="roc_plot.pdf")
      
    })
  }
  
  ##### Output del block.pls
  if (input$type_analysis4 == "None") {
  }else {
    blockpls <- Blockpls()
    
    output$PCA <- renderUI({
      
      outfile <- tempfile(fileext='.pdf')
      
      pdf(outfile, width=10, height=10)
      plotIndiv(blockpls[[1]], 
                ind.names = FALSE, 
                legend=TRUE, group = blockpls[[2]],
                title = 'Control vs High vs Low',
                ellipse = T)
      dev.off()
      
      file.copy(outfile,"www/individuals_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="individuals_plot.pdf")
      
    })
    
    output$Arrow <- renderUI({
      
      outfile2 <- tempfile(fileext='.pdf')
      
      pdf(outfile2, width=10, height=10)
      plotArrow(blockpls[[1]],group = blockpls[[2]], legend = TRUE, legend.title = 'Grupos')
      dev.off()
      
      file.copy(outfile2,"www/arrows_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="arrows_plot.pdf")
    })
    
    output$DIABLO <- renderUI({
      
      outfile3 <- tempfile(fileext='.pdf')
      
      pdf(outfile3, width=10, height=10)
      plotDiablo(blockpls[[1]],ncomp = input$components_graphics)
      dev.off()
      
      file.copy(outfile3,"www/diablo_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="diablo_plot.pdf")
    })
    
    output$Variables <- renderUI({
      
      outfile4 <- tempfile(fileext='.pdf')
      
      pdf(outfile4, width=10, height=10)
      plotVar(blockpls[[1]], legend = TRUE)
      dev.off()
      
      file.copy(outfile4,"www/variables_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="variables_plot.pdf")
    })
    
    output$Loadings <- renderUI({
      
      outfile5 <- tempfile(fileext='.pdf')
      
      pdf(outfile5, width=10, height=10)
      plotLoadings(blockpls[[1]], comp = input$components_graphics, size.name = rel(0.5))
      dev.off()
      
      file.copy(outfile5,"www/loadings_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="loadings_plot.pdf")
    })
    
    output$Circos <- renderUI({
      
      outfile6 <- tempfile(fileext='.pdf')
      
      pdf(outfile6, width=10, height=10)
      circosPlot(blockpls[[1]], cutoff=0.7,comp=input$components_graphics)
      dev.off()
      
      file.copy(outfile6,"www/circos_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="circos_plot.pdf")
    })
    
    output$Heatmap <- renderUI({
      
      outfile7 <- tempfile(fileext='.pdf')
      
      pdf(outfile7, width=10, height=10)
      cimDiablo(blockpls[[1]],comp = input$components_graphics,margin=c(8,20))
      dev.off()
      
      file.copy(outfile7,"www/heatmap_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="heatmap_plot.pdf")
      
    })
    
    output$ROC <- renderUI({
      
      outfile8 <- tempfile(fileext='.pdf')
      
      pdf(outfile8, width=10, height=10)
      for(n in 1:input$number_omics){
        auroc(blockpls[[1]], roc.block = n, roc.comp = input$components_graphics)
      }
      dev.off()
      
      file.copy(outfile8,"www/roc_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="roc_plot.pdf")
      
    })
  }
  
  ##### Output de la integracion P
  if (input$type_analysis6 == "None") {
  }else {
    pintegracion <- P_integracion()
    
    output$PCA <- renderUI({
      
      outfile <- tempfile(fileext='.pdf')
      
      pdf(outfile, width=10, height=10)
      plotIndiv(pintegracion[[1]], 
                ind.names = FALSE, 
                legend=TRUE,
                title = 'Control vs High vs Low',
                ellipse = T)
      dev.off()
      
      file.copy(outfile,"www/individuals_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="individuals_plot.pdf")
      
    })
    
    output$Arrow <- renderUI({
      
      outfile2 <- tempfile(fileext='.pdf')
      
      pdf(outfile2, width=10, height=10)
      plotArrow(pintegracion[[1]],group = pintegracion[[2]], legend = TRUE, legend.title = 'Grupos')
      dev.off()
      
      file.copy(outfile2,"www/arrows_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="arrows_plot.pdf")
    })
    
    output$DIABLO <- renderUI({
      
      outfile3 <- tempfile(fileext='.pdf')
      
      pdf(outfile3, width=10, height=10)
      plotDiablo(pintegracion[[1]],ncomp = input$components_graphics)
      dev.off()
      
      file.copy(outfile3,"www/diablo_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="diablo_plot.pdf")
    })
    
    output$Variables <- renderUI({
      
      outfile4 <- tempfile(fileext='.pdf')
      
      pdf(outfile4, width=10, height=10)
      plotVar(pintegracion[[1]], legend = TRUE)
      dev.off()
      
      file.copy(outfile4,"www/variables_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="variables_plot.pdf")
    })
    
    output$Loadings <- renderUI({
      
      outfile5 <- tempfile(fileext='.pdf')
      
      pdf(outfile5, width=10, height=10)
      plotLoadings(pintegracion[[1]], comp = input$components_graphics, size.name = rel(0.5))
      dev.off()
      
      file.copy(outfile5,"www/loadings_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="loadings_plot.pdf")
    })
    
    output$Circos <- renderUI({
      
      outfile6 <- tempfile(fileext='.pdf')
      
      pdf(outfile6, width=10, height=10)
      circosPlot(pintegracion[[1]], cutoff=0.7,comp=input$components_graphics)
      dev.off()
      
      file.copy(outfile6,"www/circos_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="circos_plot.pdf")
    })
    
    output$Heatmap <- renderUI({
      
      outfile7 <- tempfile(fileext='.pdf')
      
      pdf(outfile7, width=10, height=10)
      cim(pintegracion[[1]], comp = 1, 
          row.sideColors = color.mixo(as.numeric(pintegracion[[2]][,2])), 
          row.names = FALSE, title = "MINT sPLS-DA, component 1")
      dev.off()
      
      file.copy(outfile7,"www/heatmap_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="heatmap_plot.pdf")
      
    })
    
    output$ROC <- renderUI({
      
      outfile8 <- tempfile(fileext='.pdf')
      
      pdf(outfile8, width=10, height=10)
      for(n in 1:input$number_omics){
        auroc(pintegracion[[1]], roc.block = n, roc.comp = input$components_graphics)
      }
      dev.off()
      
      file.copy(outfile8,"www/roc_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="roc_plot.pdf")
      
    })
  }
  
  ##### Output del PLS
  if (input$type_analysis3 == "None") { 
  }else {
    plsito <- pls_function()
   
    output$PCA <- renderUI({
      
      outfile4 <- tempfile(fileext='.pdf')
      
      pdf(outfile4, width=10, height=10)
      plotIndiv(plsito[[1]], group = plsito[[2]],
                rep.space = "XY-variate", legend = TRUE,
                pch = as.factor(plsito[[2]]),
                legend.title = 'Genotype',
                title = 'Plot individuals',
                ellipse = T)
      dev.off()
      
      file.copy(outfile4,"www/individuals_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="individuals_plot.pdf")
    })

    output$Arrow <- renderUI({
      
      outfile5 <- tempfile(fileext='.pdf')
      
      pdf(outfile5, width=10, height=10)
      plotArrow(plsito[[1]],group = plsito[[2]], legend = TRUE, legend.title = 'Grupos')
      dev.off()
      
      file.copy(outfile5,"www/arrows_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="arrows_plot.pdf")
    })
    
    output$text_diablo <- renderText({paste("This plot is not available for the selected method.")})
    
    output$Variables <- renderUI({
      
      outfile <- tempfile(fileext='.pdf')
      
      pdf(outfile, width=10, height=10)
      plotVar(plsito[[1]], cex=c(3,2), legend = TRUE)
      dev.off()
      
      file.copy(outfile,"www/variables_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="variables_plot.pdf")
    })
    
    output$Loadings <- renderUI({
      
      outfile2 <- tempfile(fileext='.pdf')
      
      pdf(outfile2, width=10, height=10)
      plotLoadings(plsito[[1]], comp = input$components_graphics, size.name = rel(0.5))
      dev.off()
      
      file.copy(outfile2,"www/loadings_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="loadings_plot.pdf")
    })
    
    output$text_circos <- renderText({paste("This plot is not available for the selected method.")})
    
    output$Heatmap <- renderUI({
      
      outfile3 <- tempfile(fileext='.pdf')
      
      pdf(outfile3, width=15, height=10)
      cim(plsito[[1]],comp = 1:input$components_graphics)
      dev.off()
      
      file.copy(outfile3,"www/heatmap_plot.pdf", overwrite = T)
      
      tags$iframe(style="height:600px; align-items:center; width:100%", src="heatmap_plot.pdf")
    })
    
    output$ROC <- renderText({paste("This plot is not available for the selected method.")})
    
    
  }
  output$text <- renderText({paste("Finished succesfully. Go to mixomics tab to see the results.")})
  
})