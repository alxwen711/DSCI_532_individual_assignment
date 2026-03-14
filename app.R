# Load packages used by the app. Install missing packages, if needed.
library(shiny)
library(bslib)
library(thematic)
library(tidyverse)
library(gitlink)

# Read dataset
sales_df <- read_csv("data/raw/sales_and_customer_insights.csv") |>
  mutate(Value_At_Risk = Churn_Probability*Lifetime_Value)

# Set the default theme for ggplot2 plots
ggplot2::theme_set(ggplot2::theme_minimal())

# Apply the CSS used by the Shiny app to the ggplot2 plots
thematic_shiny()


# Define the Shiny UI layout
ui <- page_sidebar(
  
  # Set CSS theme
  theme = bs_theme(bootswatch = "darkly",
                   bg = "#222222",
                   fg = "#86C7ED",
                   success ="#86C7ED"),
  
  # Add title
  title = "Salescope Churn Rate Analysis Dashboard",
  
  # Add sidebar elements
  sidebar = sidebar(title = "Place a filter here",
                    class ="bg-secondary",
                    sliderInput("maxchurnrate","Select Maximum Churn Rate",value = 1, min = 0, max = 1, step = 0.01)),
  
  # Layout non-sidebar elements
  layout_columns(
    value_box(title = "Average Lifetime Value",
              value = textOutput("kpi_value"),
              theme_color = "primary"),
    value_box(title = "Average Value at Risk",
              value = textOutput("kpi_risk"),
              theme_color = "primary"),
    value_box(title = "Datapoints In Max Churn Filter",
              value = textOutput("kpi_count"),
              theme_color = "secondary"),
    col_widths = c(4,4,4)
  )
)

# Define the Shiny server function
server <- function(input, output) {
  
  filtered_sales_df <- reactive({
    sales_df |>
      filter(Churn_Probability <= input$maxchurnrate)
  })
  
  output$kpi_value <- renderText({
    result <- round(mean(filtered_sales_df()$Lifetime_Value),2)
    as.character(result)
  })
  
  output$kpi_risk <- renderText({
    result <- round(mean(filtered_sales_df()$Value_At_Risk),2)
    as.character(result)
  })
  
  output$kpi_count <- renderText({
    result <- nrow(filtered_sales_df())
    as.character(result)
  })
  
}

# Create the Shiny app
shinyApp(ui = ui, server = server)