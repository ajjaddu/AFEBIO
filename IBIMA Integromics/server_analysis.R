############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

keep_spls <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$keepX
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx2(input$keepX$datapath,
                         sheetIndex = 1,
                         colClasses = "numeric")
  df <- as.data.frame(apply(df,2,as.numeric))
  return(df)
  })

keep_pint <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$keepX
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx2(input$keepX$datapath,
                         sheetIndex = 1,
                         colClasses = "numeric")
  df <- apply(df,2,as.numeric)
  return(df)
})

keep_block.splsds <- reactive({# input$file1 will be NULL initially. After the user selects
  # and uploads a file, head of that data file by default,
  # or all rows if selected, will be shown.
  inFile <- input$keepX
  if (is.null(inFile)) return(NULL)
  df <- xlsx::read.xlsx(input$keepX$datapath,
                         sheetIndex = 1)
  rownames(df) <- df$NA.
  df$NA. <- NULL
  df2 <- apply(df,1,function(x){list(as.numeric(x))})
  df2 <- lapply(df2,unlist)
  return(df2)
})

observeEvent(input$integration_question, {
  showModal(modalDialog(
    title = "Types of integration",
    HTML("When talking about type of integration there are two types:<br><br> 
    
    <b> - N-integration </b> <br><br>
    
    N-integration combines different biological molecules, or variables, measured on the same N individuals or samples to 
    characterise a biological system with a holistic view. N-integration is also known as 'vertical integration'. <br><br>
    
    <b> - P-integration </b> <br><br>
    
    P-integration combines the same P molecules (e.g. genes with the same identifier) measured across different data sets 
    generated from several laboratories but interested in the same biological question to increase sample size or to 
    identify a common signature between independent studies. P-integration is also known as 'horizontal integration'."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question, {
  showModal(modalDialog(
    title = "Types of analysis",
    HTML("When talking about type of analysis there are two types:<br><br>
    
    <b> -   Unsupervised analyses</b> <br><br>
    
    Can identify patterns in data, such as clusters of samples or variables, without considering a priori information about 
    the sample groups, or outcome information (e.g. disease status, cancer subtype, treatment intake). These methods can visualise 
    the data in an unbiased manner, and inform how samples 'naturally' form subgroups based on how similar their expression profiles 
    are according to a statistical criterion of interest (e.g. variance). Unsupervised analysis often refers to data exploration and 
    data mining.<br><br>
    
    <b>  -   Supervised analyses</b> <br><br>
    
    Supervised analyses are the counterpart of unsupervised analyses and often refer to broad types of techniques used in the Machine 
    Learning field. They are used for biomarker discovery and predicting an outcome. In classification analysis, there is one outcome 
    variable that is categorical and expressed as class membership of all samples. In regression analysis, the response variable (s) 
    is (are) continuous. Both analyses aim to model the relationship between the variables measured and the outcome."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question2, {
  showModal(modalDialog(
    title = "Types of analysis",
    HTML("There is only one difference between these 2 options, either if you want to select the number of variables for the model or not.
    With the no sparse option (pls) you make the model with all the omics variables while using the sparse version (spls) you indicate 
    to the model how many variables should use to make the model. On one hand you are forcing the algorithm to use a fixed number of 
    variables. On the other hand, you are reducing the execution time."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question3, {
  showModal(modalDialog(
    title = "Types of analysis",
    HTML("When talking about N-integration unsupervised analysis for 2 omics there are three types:<br><br>
    
    <b> -   PLS</b> <br><br>
    
    Partial Least Squares (PLS) regression (Wold 1966; Wold, Sjöström, and Eriksson 2001) is a multivariate methodology which relates 
    two data matrices X (e.g. transcriptomics) and Y (e.g. lipids). PLS goes beyond traditional multiple regression by modelling the structure 
    of both matrices. Unlike traditional multiple regression models, it is not limited to uncorrelated variables. One of the many advantages of
    PLS is that it can handle many noisy, collinear (correlated) and missing variables and can also simultaneously model several response variables 
    in Y.<br><br>

    PLS is a multivariate projection-based method that can address different types of integration problems. Its flexibility is the reason why it 
    is the backbone of most methods in mixOmics. PLS is computationally very efficient when the number of variables p+q>>n the number of samples. 
    It performs successive local regressions that avoid computational issues due to the inversion of large singular covariance matrices. Unlike PCA 
    which maximizes the variance of components from a single data set, PLS maximizes the covariance between components from two data sets. The mathematical 
    concepts of covariance and correlation are similar, but the covariance is an unbounded measure and covariance has a unit measure (see 2.2.1). 
    In PLS, linear combination of variables are called latent variables or latent components. The weight vectors used to calculate the linear 
    combinations are called the loading vectors. Latent variables and loading vectors are thus associated, and come in pairs from each of the 
    two data sets being integrated.<br><br>
    
    <b>  -   sPLS</b> <br><br>
    
    Even though PLS is highly efficient in a high dimensional context, the interpretability of PLS needed to be improved. sPLS has been recently 
    developed by our team to perform simultaneous variable selection in both data sets X and Y data sets, by including LASSO penalizations
    in PLS on each pair of loading vectors (Lê Cao et al. 2008).<br><br>
    
    <b>  -   rCCA</b> <br><br>
         
    Canonical Correlation Analysis (CCA) (Hotelling, 1936) assesses whether two omics data sets measured on the same samples contain similar 
    information by maximising their correlation via canonical variates. In this approach, both data sets play a symmetric role.<br><br>
    
    The ill-posed matrix problem in the context of high dimensional data can be by-passed by introducing constants, also called ridge 
    penalties (see Section 3.3), on the diagonal of the variance-covariance matrices of X and Y to make them invertible. It is then 
    possible to perform classical CCA, substituting with these regularised covariance matrices."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question4, {
  showModal(modalDialog(
    title = "Types of analysis",
    HTML("There is only one difference between these 2 options, either if you want to select the number of variables for the model or not.
    With the no sparse option (pls) you make the model with all the omics variables while using the sparse version (spls) you indicate 
    to the model how many variables should use to make the model. On one hand you are forcing the algorithm to use a fixed number of 
    variables. On the other hand, you are reducing the execution time."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question5, {
  showModal(modalDialog(
    title = "MINT",
    HTML("
    MINT (Multivariate INTegration, Rohart et al. (2017b)), is a method based on multi-group PLS that includes 
    information about samples belonging to independent groups or studies (Eslami et al., 2014). We focus on a supervised 
    classification analysis where the aim is to predict the class of new samples from external studies whilst identifying 
    a 'universal' signature across studies.<br><br>
    
    There is only one difference between these 2 options, either if you want to select the number of variables for the model or not.
    With the no sparse option (pls) you make the model with all the omics variables while using the sparse version (spls) you indicate 
    to the model how many variables should use to make the model. On one hand you are forcing the algorithm to use a fixed number of 
    variables. On the other hand, you are reducing the execution time."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question6, {
  showModal(modalDialog(
    title = "MINT",
    HTML("MINT (Multivariate INTegration, Rohart et al. (2017b)), is a method based on multi-group PLS that includes 
    information about samples belonging to independent groups or studies (Eslami et al., 2014). We focus on a supervised 
    classification analysis where the aim is to predict the class of new samples from external studies whilst identifying 
    a 'universal' signature across studies.<br><br>
         
    There is only one difference between these 2 options, either if you want to select the number of variables for the model or not.
    With the no sparse option (pls) you make the model with all the omics variables while using the sparse version (spls) you indicate 
    to the model how many variables should use to make the model. On one hand you are forcing the algorithm to use a fixed number of 
    variables. On the other hand, you are reducing the execution time."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question7, {
  showModal(modalDialog(
    title = "Types of algorithm",
    HTML("There are four types of algorithms:<br><br>
    
    <b> -   Regression mode</b> <br><br>
    
    The Y matrix is deflated with respect to the information extracted/modelled from the local regression on X. Here the goal is to 
    predict Y from X (Y and X play an asymmetric role). Consequently the latent variables computed to predict Y from X are different 
    from those computed to predict X from Y.<br><br>
    
    <b>  -   Canonical mode</b> <br><br>
    
    The Y matrix is deflated to the information extracted/modelled from the local regression on Y. Here X and Y play a symmetric role 
    and the goal is similar to a Canonical Correlation type of analysis.<br><br>
    
    <b>  -   Invariant mode</b> <br><br>
         
    The Y matrix is not deflated.<br><br>
    
    <b>  -   Classic mode</b> <br><br>
    
    Is similar to a regression mode. It gives identical results for the variates and loadings associated to the X data set, but differences 
    for the loadings vectors associated to the Y data set (different normalisations are used)."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question9, {
  showModal(modalDialog(
    title = "Keep file",
    HTML("Keep file is crucial for sparse method to indicate to the model how many variables do you want to select of each component and omic.
         Must be a matrix."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question10, {
  showModal(modalDialog(
    title = "Predictive omic",
    HTML("For N-integration when a no discriminant analysis is performed you must select what omic is going to be the Y (prediction) of the
         model."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$analysis_question11, {
  showModal(modalDialog(
    title = "Outcome variable",
    HTML("For discriminant analysis methods is necessary to select an outcome variable from the group dataset to perform the analysis."),
    easyClose = TRUE,
    footer = NULL
  ))
})

observeEvent(input$patients_question, {
  showModal(modalDialog(
    title = "Patients",
    HTML("Is important that all the data frames contain the same patients labelled with the same names and if possible, sorted in the order. 
          If any of your data frames have different names, please correct it before executing the program. On the other hand, if any of your 
          data frames have different number of patients than other please select the option 'No' to remove uncommon patients."),
    easyClose = TRUE,
    footer = NULL
  ))
})








