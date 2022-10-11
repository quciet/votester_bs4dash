server <- function(input, output, session) {
  
  ### ts plot
  output$trendplot <- renderEcharts4r({
    ts_test
  })

  ### Choropleth plot
  output$mapplot <- renderEcharts4r({
    votes_US_year_map
  }) 
  
}
