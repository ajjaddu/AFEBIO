############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

mixomics <- navbarMenu("mixOmics",
           tabPanel("Individuals",
                    fluidPage(
                      uiOutput("PCA",width = "100%", height = 800)
                    )),
           tabPanel("Arrow",
                    fluidPage(
                      uiOutput("Arrow",width = "100%", height = 800)
                    )),
           tabPanel("DIABLO Plot",
                    fluidPage(
                      textOutput("text_diablo"),
                      uiOutput("DIABLO",width = "100%", height = 800)
                    )),
           tabPanel("Variables",
                    fluidPage(
                      uiOutput("Variables")
                    )),
           tabPanel("Loadings",
                    fluidPage(
                      uiOutput("Loadings")
                    )),
           tabPanel("Circos plot",
                    fluidPage(
                      textOutput("text_circos"),
                      uiOutput("Circos",width = "100%", height = 800)
                    )),
           tabPanel("Heatmap",
                    fluidPage(
                      uiOutput("Heatmap")
                    )),
           tabPanel("ROC curves",
                    fluidPage(
                      uiOutput("ROC",width = "100%", height = 800)
                    ))
           
           
           
           
)
