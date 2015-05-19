library(shiny)
library(markdown)
shinyUI(navbarPage("Exploring the Swiss dabase",
        tabPanel("Plot",
                 sidebarPanel(
                         selectInput("select1", label = h3("Select Variable 1"), 
                                     choices = list("Fertility" = names(swiss)[1], "Agriculture" = names(swiss)[2], "Examination" = names(swiss)[3], "Education" = names(swiss)[4],"Catholic" = names(swiss)[5],"Infant.Mortality" = names(swiss)[6]), 
                                     selected = names(swiss)[1]),
                         
                         selectInput("select2", label = h3("Select Variable 2"), 
                                     choices = list("Fertility" = names(swiss)[1], "Agriculture" = names(swiss)[2], "Examination" = names(swiss)[3], "Education" = names(swiss)[4],"Catholic" = names(swiss)[5],"Infant.Mortality" = names(swiss)[6]), 
                                     selected = names(swiss)[2]),
                         checkboxInput("fitCheckbox", label = "Fit linear model?", value = FALSE),
                         helpText("Select the variables for the scatter plot. Optionally, a linear model can be fitted to the selected variables. Note that if a linear model is fitted, the modeled lined will be ploted in blue and the residuals in red. For every residual the distance to the modeled line will be also displayed.")
                         ),
                 
                 mainPanel(
                         plotOutput("plot")
                         )
                 
                 ),

        tabPanel("Residuals",
                 sidebarPanel(
                         selectInput("select3", label = h3("Select Variable 1"), 
                                     choices = list("Fertility" = names(swiss)[1], "Agriculture" = names(swiss)[2], "Examination" = names(swiss)[3], "Education" = names(swiss)[4],"Catholic" = names(swiss)[5],"Infant.Mortality" = names(swiss)[6]), 
                                     selected = names(swiss)[1]),
                         
                         selectInput("select4", label = h3("Select Variable 2"), 
                                     choices = list("Fertility" = names(swiss)[1], "Agriculture" = names(swiss)[2], "Examination" = names(swiss)[3], "Education" = names(swiss)[4],"Catholic" = names(swiss)[5],"Infant.Mortality" = names(swiss)[6]), 
                                     selected = names(swiss)[2]),
                         
                         radioButtons("polyRadio", label = h3("Degree of the polynomial"),
                                      choices = list("2" = 2, "3" = 3, "4" = 4,"5" = 5), 
                                      selected = 3),
                         helpText("Select the variables for plot of the residual of the linear model. Additionaly, to explore the structure of the residuals, polynomial curves of several degrees (red) can be fitted to the residuals.")
                                 
                 ),
                 mainPanel(
                         plotOutput("residuals")
                 )
                 
        ),
        
        tabPanel("Summary",
                 sidebarPanel(
                         selectInput("select5", label = h3("Select Variable 1"), 
                                     choices = list("Fertility" = names(swiss)[1], "Agriculture" = names(swiss)[2], "Examination" = names(swiss)[3], "Education" = names(swiss)[4],"Catholic" = names(swiss)[5],"Infant.Mortality" = names(swiss)[6]), 
                                     selected = names(swiss)[1]),
                         
                         selectInput("select6", label = h3("Select Variable 2"), 
                                     choices = list("Fertility" = names(swiss)[1], "Agriculture" = names(swiss)[2], "Examination" = names(swiss)[3], "Education" = names(swiss)[4],"Catholic" = names(swiss)[5],"Infant.Mortality" = names(swiss)[6]), 
                                     selected = names(swiss)[2]),
                         helpText("For selected variables, we display the full information of the linear model (p-values,slope,intercept, etc.)")
                         
                 ),
                 mainPanel(
                         verbatimTextOutput("summary")
                 )
                 
        ),
        
        tabPanel("About",
                 #sidebarPanel(),
                 #mainPanel(verbatimTextOutput("about"))
                 verbatimTextOutput("about")
        )
        
))

