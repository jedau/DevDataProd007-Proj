library(shiny)

shinyUI(
    navbarPage('Titanic Survivability Calculator',
        tabPanel('Main',
            img(src='background.png', align = "right"),
            div(class="main",
                includeCSS('style.css'),
                absolutePanel(id = "controls", class = "modal", fixed = FALSE,
                            draggable = FALSE, top = "150px", left = "75%",
                            width = "400px", height = "auto",
                               
                            h1("You would have...", align = 'center'),
                            h2(textOutput("outcome"), align = 'center'),
                            h4(textOutput("tidbit"), align = 'center')
                ),
                absolutePanel(id = "controls", class = "modal", fixed = FALSE,
                          draggable = FALSE, top = "60px", left = "350px", 
                          bottom = "auto", width = "450px", height = "auto",
                          
                          h4("Titanic Survivability Calculator"),
                          p('What if you lived in the early 1900s and got a chance to board the RMS Titanic?'),
                          p('This Shiny app predicts your survivability by using real-world historical data and matches it with yours.'),
                          p('Enter your information below to test your fate.'),
                          
                          hr(),
                          
                          numericInput("age", label = "Age:", 
                                       value = 0, min = 0, max = 99, step = 1),
                          radioButtons("sex", label = "Gender:",
                                        list("Female" = "female", "Male" = "male"), 
                                       selected = "female"),
                          radioButtons("marital", label = "Marital Status:",
                                        list("Single" = "single", 
                                                      "Married" = "married", 
                                                      "Widowed" = "widowed"), 
                                       selected = "single"),
                          numericInput("pc", label = "How many parents/children with you?",
                                       value = 0, min = 0, max = 99, step = 1),
                          radioButtons("sp", label = "Traveling with spouse?",
                                        list("No" = "no", "Yes" = "yes"), 
                                       selected = "no"),
                          numericInput("sib", label = "How many siblings with you?",
                                       value = 0, min = 0, max = 99, step = 1),
                          selectInput("class", label ="Annual Income:", 
                                      list("< $20,000" = 3, 
                                           "$20,000-$100,000" = 2, 
                                           "> 100,000" = 1),
                                      selected = 3)
                )          
            )
        ),
        tabPanel('Data',
                 basicPage(
                     dataTableOutput(outputId = "table"),
                     downloadButton('downloadData', 'Download')
                 )
        ),
        tabPanel('About',
                 mainPanel(
                     
                     h1("Titanic Survivability Calculator"),
                     h3("Gonzales, Jed Aureus J."),
                     p("This project was created as a requirement for Johns Hopkins University's Developing Data Products course in Coursera"),
                     p("For more information, check out the project's Github repo."),
                     a("Titanic Survivabiliy Calculator on Github", href = "http://github.com/jedau")
                 )
        )
        )
)