#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Water Stress in Mexico City"),
    
    img(src = "http://www.urbanisten.nl/wp/wp-content/uploads/WS_mexico11.jpg", height = 200, width = "auto"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout( position = "right",
        sidebarPanel( 
                    
                    #Info about the data
                    
                      "About",
                      
                      h3("Why Mexico?"), 
                    
                      p("Mexico City is drawing groundwater at an unsustainable rate and is expected to reach day zero (run out off water) by 2050. Consuming water at a higher rate than it's able to recover is called water stress.With over 20 million citizens and hosting the federal government, water scarcity will pose a national emergency. Mexico City has been focusing efforts in developing resilience strategies to fight water scarcity. One of them has been around rainwater harvesting in communities that are already facing water scarcity."), 
                      
                      h3("Where is this data from?"),
                      
                      p("This data is from the water utility in Mexico City (SACMEX) to compare water consumption per neighborhoods (colonias).   
This data set was combined with data collected by the Natural Environment Secretary (SEDEMA) which shows points for high precipitation levels and flooding risks."),
                      
                      h3("The data explained:"),
                      
                      p("*The district name is the name of the neighborhoods in Mexico City. *Each district belong to a municipality. *Both each district and each municipality have spatial coordinates linked to them. *Precipitation level can be high, medium or low, based on the amount of water collected from rainfall throughout the year. *Flooding risk is also measured in high, medium or low, based on the precipitation level, capacity of draining infrastructure and flood cases observed."),
                      
                      h3("Source:"),
                      
#[Datos Abiertos Ciudad de Mexico](https://datos.cdmx.gob.mx/explore/dataset/consumo-agua/information/?location=10,19.35762,-99.14463&dataChart=eyJxdWVyaWVzIjpbeyJjaGFydHMiOlt7InR5cGUiOiJiYXIiLCJmdW5jIjoiQ09VTlQiLCJ5QXhpcyI6ImNvbnN1bW8iLCJzY2llbnRpZmljRGlzcGxheSI6dHJ1ZSwiY29sb3IiOiJyYW5nZS1CbHVlcyJ9XSwieEF4aXMiOiJhbGNhbGRpYSIsIm1heHBvaW50cyI6NTAsInNvcnQiOiIiLCJzZXJpZXNCcmVha2Rvd24iOiJpbmRpY2VfZGVzYXJyb2xsbyIsInN0YWNrZWQiOiJub3JtYWwiLCJjb25maWciOnsiZGF0YXNldCI6ImNvbnN1bW8tYWd1YSIsIm9wdGlvbnMiOnt9fX1dLCJ0aW1lc2NhbGUiOiIiLCJkaXNwbGF5TGVnZW5kIjp0cnVlLCJhbGlnbk1vbnRoIjp0cnVlfQ%3D%3D) 

                      
                      
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 10,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel( 
            
           
           plotOutput("distPlot"),
           
           # Show TF
           
           "TF: Celine", 
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'white', border = 'gray')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
