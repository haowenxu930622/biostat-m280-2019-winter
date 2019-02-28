library(tidyverse)
library(shiny)
library(reshape2)
library(ggplot2)


#read in data
pay <- readRDS("data/payroll.rds")

# Define UI ----
ui <- fluidPage(
  titlePanel("LA City Employee Payroll"),
  
  sidebarLayout(
    sidebarPanel(helpText("LA city employee payroll information from 2013 to
                          2018."),
                 selectInput("question", 
                             label = "Choose a question to display:",
                             choices = c("Total payroll(Q2)",
                                         "Who earned most?(Q3)",
                                         "Which department earned most?(Q4)",
                                         "Which department cost most?(Q5)"),
                             selected = "Total payroll"),
                 numericInput(inputId = "size",
                              label = "Number of observations to view(Q3~5):",
                              value = 5),
                 selectInput("year",
                             label = "Choose year of interest(Q2~5):",
                             choices = c("2013", "2014", "2015", "2016",
                                         "2017", "2018"),
                             selected = "2017"),
                 selectInput("method",
                             label = "Method(Q4):",
                             choices = c("Median", "Mean"),
                             selected = "Median")),
    mainPanel(plotOutput("myplot"))
))

# Define server logic ----
server <- function(input, output) {
  
  output$myplot <- renderPlot({
    
    if(input$question == "Total payroll(Q2)"){
      data <- summarize(group_by(pay, Year), base = sum(Base_Pay,
                                                        na.rm = TRUE),
                        over = sum(Overtime_Pay, na.rm = TRUE),
                        other = sum(other_pay, na.rm = TRUE))
      data <- melt(data, id.var = "Year")
      ggplot(data, aes(x = reorder(as.factor(Year), -value), y = value,
                       fill = variable)) +
        geom_bar(stat="identity") +
        ggtitle("Total payroll by LA city") +
        xlab("Year") + ylab("Total Payment") + 
        scale_y_continuous() 
    }else if(input$question == "Who earned most?(Q3)"){
      data <- arrange(pay, desc(Total_Payments)) %>%
        filter(Year == as.character(input$year)) %>%
        head(input$size)%>%
        mutate(rank = dense_rank(desc(Total_Payments))) %>%
        select(Base_Pay, Overtime_Pay, other_pay, rank) 
      data <- melt(data, id.var = "rank")
      ggplot(data, aes(x = as.factor(rank), y = value, fill = variable)) +
        geom_bar(stat="identity") +
        ggtitle("Who earned most?") +
        xlab("ID") + ylab("Total Payment") + scale_y_continuous()
    }else if(input$question == "Which department earned most?(Q4)"){
      data <- filter(pay, Year == as.character(input$year)) %>%
        group_by(Department_Title) %>%
        summarize(mean_tot = mean(Total_Payments, na.rm = TRUE),
                  mean_base = mean(Base_Pay, na.rm = TRUE),
                  mean_over = mean(Overtime_Pay, na.rm = TRUE),
                  mean_other = mean(other_pay, na.rm = TRUE),
                  median_base = median(Base_Pay, na.rm = TRUE),
                  median_over = median(Overtime_Pay, na.rm = TRUE),
                  median_other = median(other_pay, na.rm = TRUE),
                  median_tot = median(Total_Payments, na.rm = TRUE))
      if(input$method == "Median"){
        data <- arrange(data, desc(median_tot)) %>%
          head(input$size) %>%
          select(Department_Title, median_base, median_over, median_other)
        data <- melt(data, id.var = "Department_Title")
        ggplot(data, aes(x = reorder(as.factor(Department_Title), -value),
                         y = value,
                         fill = variable)) +
          geom_bar(stat="identity") +
          ggtitle("Which department earned most by median?") +
          xlab("Department") + ylab("Total Earned") + 
          scale_y_continuous() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }else if(input$method == "Mean"){
        data <- arrange(data, desc(mean_tot)) %>%
          head(input$size) %>%
          select(Department_Title, mean_base, mean_over, mean_other)
        data <- melt(data, id.var = "Department_Title")
        ggplot(data, aes(x = reorder(as.factor(Department_Title), -value),
                         y = value,
                         fill = variable)) +
          geom_bar(stat="identity") +
          ggtitle("Which department earned most by mean?") +
          xlab("Department") + ylab("Total Earned") + 
          scale_y_continuous() +
          theme(axis.text.x = element_text(angle = 90, hjust = 1))
      }
    }else if(input$question == "Which department cost most?(Q5)"){
      data <- filter(pay, Year == as.character(input$year)) %>%
        group_by(Department_Title) %>%
        summarize(tot = sum(Total_Payments), base = sum(Base_Pay),
                  over = sum(Overtime_Pay), other = sum(other_pay)) %>%
        arrange(desc(tot)) %>%
        head(input$size) %>%
        select(Department_Title, base, over, other)
      data <- melt(data, id.var = "Department_Title")
      ggplot(data, aes(x = reorder(as.factor(Department_Title), -value),
                       y = value,
                       fill = variable)) +
        geom_bar(stat="identity") +
        ggtitle("Which department cost the most?") +
        xlab("Department") + ylab("Total cost") + 
        scale_y_continuous() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    }
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)