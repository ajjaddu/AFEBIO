############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

filemanager <- navbarMenu("Uploading Files",
           tabPanel("Groups",
                    sidebarLayout(
                      
                      # Sidebar panel for inputs ----
                      sidebarPanel(h3("Groups"),
                                   h6("Information about the group that belong each patient. Is needed for plots and
                                       supervised methods."),
                                   
                                   # Input: Select a file ----
                                   div(
                                     class = "input-group", 
                                     tags$span(style = "display: inline-block",
                                               fileInput("groups", "Choose a group file (.xlsx)",
                                                         multiple = FALSE,
                                                         accept = c("text/csv",
                                                                    "text/comma-separated-values,text/plain",
                                                                    ".csv",
                                                                    ".xlsx"))),
                                     tags$span(style = "vertical-align: top;",actionButton("analysis_question_group", "", icon = icon("question"),style='padding:2px; font-size:80%'))),
                                   
                                   # Input: Select number of rows to display ----
                                   radioButtons("disp", "Display",
                                                choices = c(Header = "head",
                                                            All = "all"),
                                                selected = "all")
                                   
                      ),
                      
                      # Main panel for displaying outputs ----
                      mainPanel(
                        dataTableOutput("groups", width = 1100)
                      )
                      
                    )
           ),
           tabPanel("Epigenomics",
                    sidebarLayout(
                      
                      # Sidebar panel for inputs ----
                      sidebarPanel(h3("Epigenomics"),
                                   h6("Data must be shown as CPG islands (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                   
                                   # Input: Select a file ----
                                   fileInput("epigenomics", "Choose a epigenomics file (.xlsx)",
                                             multiple = FALSE,
                                             accept = c(".xlsx")),
                                   
                                   # Input: Select number of rows to display ----
                                   radioButtons("disp_epi", "Display",
                                                choices = c(Header = "head",
                                                            All = "all"),
                                                selected = "all"),
                                   
                                   radioButtons("norm_epi", "Is data log normalized?",
                                                choices = c(Yes = "Yes",
                                                            No = "No"),
                                                selected = "No")
                                   
                      ),
                      
                      # Main panel for displaying outputs ----
                      mainPanel(
                        dataTableOutput("Epigenomics", width = 1100)
                      )
                      
                    )
           ),tabPanel("Foodomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Foodomics"),
                                     h6("Data must be shown as metabolites (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("foodomics", "Choose Foodomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_foo", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_foo", "Is data log normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Foodomics", width = 1100)
                        )
                        
                      )
           ),tabPanel("Genomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Genomics"),
                                     h6("Data must be shown as genes (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("genomics", "Choose Genomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_gen", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_gen", "Is data log normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Genomics", width = 1100)
                        )
                        
                      )
           ),tabPanel("Glycomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Glycomics"),
                                     h6("Data must be shown as metabolites (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("glycomics", "Choose Glycomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_gly", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_gly", "Is data log normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Glycomics", width = 1100)
                        )
                        
                      )
           ),tabPanel("Lipidomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Lipidomics"),
                                     h6("Data must be shown as lipids (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("lipidomics", "Choose Lipidomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_lip", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_lip", "Is data log normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Lipidomics", width = 1100)
                        )
                        
                      )
           ),tabPanel("Metabolomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Metabolomics"),
                                     h6("Data must be shown as metabolites (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("metabolomics", "Choose Metabolomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_met", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_met", "Is data log normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Metabolomics", width = 1100)
                        )
                        
                      )
           ),tabPanel("Microbiomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Microbiomics"),
                                     h6("Data must be shown as microbiote (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("microbiomics", "Choose Microbiomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_mic", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_mic", "Is data logratio normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Microbiomics", width = 1100)
                        )
                        
                      )
           ),tabPanel("Proteomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Proteomics"),
                                     h6("Data must be shown as proteins (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("proteomics", "Choose Proteomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_pro", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_pro", "Is data logratio normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Proteomics", width = 1100)
                        )
                        
                      )
           ),tabPanel("Transcriptomics",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(h3("Transcriptomics"),
                                     h6("Data must be shown as transcripts (columns) and patients (rows) with 
                                              no other variabables and without empty cells."),
                                     
                                     # Input: Select a file ----
                                     fileInput("transcriptomics", "Choose Transcriptomics XLSX File",
                                               multiple = FALSE,
                                               accept = c("text/csv",
                                                          "text/comma-separated-values,text/plain",
                                                          ".csv",
                                                          ".xlsx")),
                                     
                                     # Input: Select number of rows to display ----
                                     radioButtons("disp_tra", "Display",
                                                  choices = c(Head = "head",
                                                              All = "all"),
                                                  selected = "all"),
                                     
                                     radioButtons("norm_tra", "Is data normalized?",
                                                  choices = c(Yes = "Yes",
                                                              No = "No"),
                                                  selected = "No")
                                     
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          dataTableOutput("Transcriptomics", width = 1100)
                        )
                        
                      )
           ))