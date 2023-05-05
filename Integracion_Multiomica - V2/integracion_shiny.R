############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

################### PACKAGES NEEDED ########################
# packages that need to be load with the run
library(shiny)
library(shinythemes)
library(shinyWidgets)
library(DT)
library(xlsx)
library(mixOmics)
library(plotly)
######################## UI CODE ###########################

# UI is the front of the app

# principal structure that calls the files with ui data
ui <- navbarPage(
  "Multi-omic integration",
  theme = shinytheme("sandstone"),
  source("ui_filemanager.R",local=TRUE)$value,
  source("ui_analysis.R",local=TRUE)$value,
  source("ui_mixomics.R",local=TRUE)$value,
  source("ui_about.R",local=TRUE)$value
)

###################### SERVER CODE ##########################

# SERVER is the back of the app

# General server code 
server <- function(input, output, session) {
  source("server_DIABLO.R",local = TRUE)$value
  source("server_filemanager.R",local = TRUE)$value
  source("server_analysis.R",local = TRUE)$value
  source("server_mixomics.R",local = TRUE)$value
  source("server_PLS.R",local = TRUE)$value
  source("server_blockpls.R",local = TRUE)$value
  source("server_integracion_p.R",local = TRUE)$value
}

###################### RUN APP ##########################
shinyApp(ui = ui, server = server)

