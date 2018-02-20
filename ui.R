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
                                     h2("Input the first part of phrase/sentence"),
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
                    h4("3. The most probable 5 words will appear on the right side"),
                    hr(),
                    h4("This Shiny app is built on", strong("N-gram"), "predictive language model with", strong("Back-off Smoothing"), "for cases when input phrase is absent in training set."),
                    h4("Corpus comprises blog posts, news articles, and Twitter tweets in English, collected from publicly available sources by a web crawler."),
                    h4("Training sample comprises 100% of News, 50% of Blogs and 25% of Twitter datasets."),
                    h4("The predictions are based on almost 46 millions of unique N-grams ranging from Unigrams to 4-grams."),
                    h4("N-grams for building the model is used for predicting the next word based on the previous 1, 2, 3 and 4 words tokens."),
                    h4("Backoff Algorithm is in the core of the model."),
                    h4("To speed up the process of data reading and accessing, we created a dictionary in the form of a named vector. The key of this vector is the index in Unigram table, and the values are corresponding unigrams. This makes sense since it is much faster to find a word by integer than by characters."),
                    hr(),
                    h4("All source code files are available on my", a("GitHub page", href = "https://github.com/ArtemBraun/Data_Science_Capstone")),
                    br(),
                    img(src = "Logo.png"),
                    "This app is created by ", 
                    a("Artem Braun", href = "mailto:artvbr@gmail.com")
            )
   )
))
