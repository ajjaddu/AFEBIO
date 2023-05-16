############################################################
###########                                         ########
###########        Integracion Multiomica           ########
###########       Design by Antonio Cantarero       ########
###########               IBIMA                     ########
###########                                         ########
############################################################

about <- navbarMenu("More",
                    tabPanel("Table",
                             DT::dataTableOutput("table")
                    ),
                    tabPanel("About",
                             fluidRow(
                               column(6,
                                      HTML("<b> About the project:</b> <br><br> 
                                            
                                            This application arises as part of the PhD programme of the student Antonio Cantarero Cuenca. 
                                            The application is designed to bring multiomics integration closer to people with less knowledge 
                                            of bioinformatics but, maintaining the complexity for more specialised personnel who require a more 
                                            complex analysis.<br><br>
                                            
                                            <b> Developed by:</b> <br><br> 

                                            -   Antonio Cantarero Cuenca (Bioinformatician at IBIMA Plataforma BIONAND) <br><br> 
      
                                            -   Andres Gonzalez Jimenez (Bioinformatician at IBIMA Plataforma BIONAND) <br><br>
      
                                            -   Juan Antonio Garcia Ranea (Professor and Bioinformatics Platform Coordinator) <br><br>")
                               ),
                               column(3,
                                      img(class="img-polaroid",
                                          src="https://i.postimg.cc/8CqgxqMF/Logo-IBIMA-Bionand-PNG2.png"),
                                      img(class="img-polaroid",
                                          src="https://i.postimg.cc/YqGX4hWW/image-300212.jpg"),
                               ),
                             )
                    )
)