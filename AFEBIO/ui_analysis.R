############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

analysis <- tabPanel("Analysis",
                     #verbatimTextOutput("summary"),
                     sidebarLayout(
                       
                       # Sidebar panel for inputs ----
                       sidebarPanel(
                         
                         ####### Numero de omicas para el analisis #######
                         numericInput("number_omics","Choose the number of omics for the analysis.",0),
                         
                         ####### Seleccion de que omicas se van a emplear #######
                         conditionalPanel(condition = "input.number_omics >= 1", prettyCheckboxGroup("omics", "Choose the omics for the analysis", 
                                                                                                   choices = c("Epigenomics","Foodomics","Genomics","Glycomics",
                                                                                                               "Lipidomics","Metabolomics","Microbiomics",
                                                                                                               "Proteomics","Transcriptomics"),inline = T,animation = "pulse")),
                         ####### Tipo de integracion (N o P) #######
                         conditionalPanel(condition = "input.number_omics >= 1",
                         div(
                           class = "input-group", 
                           tags$span(style = "display: inline-block",
                                     prettyRadioButtons("integration", label="Choose the type of integration", 
                                            choices = c("N-integration","P-integration","None"),inline = T,selected = "None",animation = "pulse")),
                           tags$span(style = "vertical-align: middle;",actionButton("integration_question", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de analisis (Supervisado o No supervisado)
                         conditionalPanel(condition = "input.number_omics >= 1",
                         div(
                           class = "input-group", 
                           tags$span(style = "display: inline-block",
                                     prettyRadioButtons("type_analysis", "Choose the type of analysis", 
                                                        choices = c("Supervised","Unsupervised","None"),inline = T,selected = "None",animation = "pulse")),
                           tags$span(style = "vertical-align: middle;",actionButton("analysis_question", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de metodo de N-integracion para mas de 2 omicas supervisado (DIABLO) #######
                         conditionalPanel( condition = "input.number_omics >= 2 && input.type_analysis.includes('Supervised') && input.integration.includes('N-integration')",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       prettyRadioButtons("type_analysis2", "Choose the type of analysis", 
                                                                          choices = c("block.plsda","block.splsda","None"),inline = T,selected = "None",animation = "pulse")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question2", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de N-integracion para 2 omicas no supervisado #######
                         conditionalPanel( condition = "input.number_omics == 2 && input.type_analysis.includes('Unsupervised') && input.integration.includes('N-integration')",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       prettyRadioButtons("type_analysis3", "Choose the type of analysis", 
                                                                          choices = c("PLS","sPLS","rCCA","None"),inline = T,selected = "None",animation = "pulse")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question3", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de metodo de N-integracion para mas de 2 omicas no supervisado #######
                         conditionalPanel( condition = "input.integration.includes('N-integration') && input.number_omics > 2 && input.type_analysis.includes('Unsupervised')",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       prettyRadioButtons("type_analysis4", "Choose the type of analysis", 
                                                                          choices = c("block.PLS","block.spls","None"),inline = T,selected = "None",animation = "pulse")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question4", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de metodo de P-integracion para mas de 2 omicas no supervisado #######
                         conditionalPanel( condition = "input.integration.includes('P-integration') && input.number_omics >= 2 && input.type_analysis.includes('Unsupervised')",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       prettyRadioButtons("type_analysis5", "Choose the type of analysis", 
                                                                          choices = c("mint.pls","mint.spls","None"),inline = T,selected = "None",animation = "pulse")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question5", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de metodo de P-integracion para 1 omicas supervisada #######
                         conditionalPanel( condition = "input.integration.includes('P-integration') && input.number_omics == 1 && input.type_analysis.includes('Supervised')",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       prettyRadioButtons("type_analysis6", "Choose the type of analysis", 
                                                                          choices = c("mint.plsda","mint.splsda","None"),inline = T,selected = "None",animation = "pulse")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question6", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de analisis PLS #######
                         conditionalPanel( condition = "input.type_analysis3 == 'PLS' || input.type_analysis3 == 'sPLS'",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       prettyRadioButtons("type_PLS", "Choose the type of analysis", 
                                                                          choices = c("regression","invariant","classic","canonical","None"),inline = T,selected = "None",animation = "pulse")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question7", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Tipo de analisis PLS #######
                         conditionalPanel( condition = "input.type_analysis2 == 'PLS' || input.type_analysis2 == 'sPLS'",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       prettyRadioButtons("type_PLS2", "Choose the type of analysis", 
                                                                          choices = c("canonical","None"),inline = T,selected = "None",animation = "pulse")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question8", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Seleccion de KeepX para metodos sparse #######
                         conditionalPanel( condition = "input.number_omics >= 2 && input.type_analysis.includes('Supervised') && input.integration.includes('N-integration') && input.type_analysis2.includes('block.splsda') || input.type_analysis3.includes('sPLS') || input.type_analysis4.includes('block.spls') || input.type_analysis5.includes('mint.spls') || input.type_analysis6.includes('mint.splsda')",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       fileInput("keepX", "Choose keepX XLSX File",
                                                                 multiple = FALSE,
                                                                 accept = c("text/csv",
                                                                            "text/comma-separated-values,text/plain",
                                                                            ".csv",
                                                                            ".xlsx"))),
                                             tags$span(style = "vertical-align: top;",actionButton("analysis_question9", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Omica predictiva para metodo no supervisado #######
                         conditionalPanel( condition = "input.type_analysis4 == 'block.PLS' || input.type_analysis4 == 'block.spls'",       
                                           div(
                                             class = "input-group", 
                                             tags$span(style = "display: inline-block",
                                                       textInput("predictive_omic","Type the predictive omic.")),
                                             tags$span(style = "vertical-align: middle;",actionButton("analysis_question10", "", icon = icon("question"),style='padding:2px; font-size:80%')))),
                         
                         ####### Variable grupo #######
                         div(
                           class = "input-group", 
                           tags$span(style = "display: inline-block",
                                     textInput("grupos","Write the variable that correspond to the outcome when necessary")),
                           tags$span(style = "vertical-align: middle;",actionButton("analysis_question11", "", icon = icon("question"),style='padding:2px; font-size:80%'))),
                         
                         ####### ¿Tienen los datasets los pacientes ordenados en el mismo orden? #######
                         div(
                           class = "input-group", 
                           tags$span(style = "display: inline-block",
                                     prettyRadioButtons("same_patients", "Do all the datasets contain the same patients in the same orther?",
                                                        choices = c(Yes = "Yes",
                                                                    No = "No"),
                                                        selected = "No",inline = T,animation = "pulse")),
                           tags$span(style = "vertical-align: middle;",actionButton("patients_question", "", icon = icon("question"),style='padding:2px; font-size:80%'))),
                         
                         ####### Numero de componentes para generar el modelo #######
                         numericInput("components","Choose the number of components for the model.",1),
                         
                         ####### Numero de componentes para generar los graficos #######
                         numericInput("components_graphics","Choose the number of components for the graphics.",1),
                         
                         ####### Boton de ejecucion del codigo #######
                         actionButton("start", "Start analysis"),width = 12
                         
                       ),
                       
                       # Main panel for displaying outputs ----
                       mainPanel(
                         textOutput("text")
                       )
                       
                     )
)
