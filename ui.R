require(shiny)
require(shinythemes)
require(data.table)
options(show.error.messages = FALSE)


shinyUI(navbarPage(strong("Data Science Capstone Project"),
   theme = shinytheme("united"),
     tabPanel(strong("Word Prediction"),
              tags$style(type="text/css",
                         ".shiny-output-error { visibility: hidden; }",
                         ".shiny-output-error:before { visibility: hidden; }"),
              fluidPage(
                      fluidRow(
                              column(5, offset = 1,
                                     h2("Input the first part of phrase/sentense"),
                                     tags$textarea(id = "Phrase", rows=5, cols = 30),
                                     submitButton("Predict next word")
                              ),
                              column(5,offset = 1,
                                     h2("Next word in the order of descending probability"),
                                     h2(strong(textOutput("word_predicted_1")),style="color:green"),
                                     h2(strong(textOutput("word_predicted_2")),style="color:green"),
                                     h2(strong(textOutput("word_predicted_3")),style="color:green"),
                                     h2(strong(textOutput("word_predicted_4")),style="color:green"),
                                     h2(strong(textOutput("word_predicted_5")),style="color:green")
                              )
                      )
                )
     ),
     tabPanel(strong("I N S T R U C T I O N S"),
            headerPanel("Instructions"),
            mainPanel(
                    h4("1. Enter a sentence on the 'Word Prediction' tab"),
                    h4("2. Press the 'Predict next word' button"),
                    h4("3. The most probable word (according to algorithm) will appear"),
                    hr(),
                    h4("This shiny app is built on", strong("N-gram"), "predictive language model with", strong("Back-off Smoothing"), "for cases when input phrase is absent in training set."),
                    h4("Training set comprises 100% of news, 50% of blogs and 25% of Twitter datasets."),
                    h4("bla-bla-bla"),
                    h4("bla-bla-bla"),
                    br(),
                    img(src = "Logo.png"),
                    "This app is created by ", 
                    a("Artem Braun", href = "mailto:artvbr@gmail.com")
            )
   )
))
