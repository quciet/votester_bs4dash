ui <- 
dashboardPage(
  ### name for the web browser tab
  title = "Shinny Votester",
  
  ### navbar section (mandatory)
  header = dashboardHeader(
    title = dashboardBrand(
      title = "Pardee Center",
      color = "primary",
      href = "https://korbel.du.edu/pardee"
    )
    #disable = TRUE
  ),
  
  ### left side bar (mandatory)
  sidebar = dashboardSidebar(
    #id = "Viz Tab",
    ### the upper left corner of side bar
    sidebarUserPanel(
      image = "https://pardeewiki.du.edu/images/3/34/Image.png",
      name = "Votester"
    ),
    ### menu in the left side bar
    sidebarMenu(
      #sidebarHeader("Votester"),
      ### items
      menuItem(
        text = "Time-Series",
        tabName = "trend",
        icon = icon("chart-line")
      ),
      menuItem(
        text = "Map",
        tabName = "map",
        icon = icon("map")
      ),
      menuItem(
        text = "About",
        tabName = "about",
        icon = icon("info-circle")
      )
    )
    
  ),
  
  # ### right side control bar (optional)
  # controlbar = dashboardControlbar(
  #   disable = TRUE
  # ),
  
  # ### footer (optional)
  # footer = dashboardFooter(
  # ),
  
  
  ### main body (mandatory)
  body = dashboardBody(
    ### Separate 3 tabs with respect to left bar
    tabItems(
      
      ### tab for time-series
      tabItem(
        tabName = "trend",
        fluidRow(
          ### box that contains the time series chart
          box(
            #title = "Time-Series",
            id = "trendgraph",
            width = 12,
            echarts4rOutput("trendplot")
          ),
          ### box that have control items for time-series chart
          box(
            #title = "Time-Series Control",
            id = "trendcontrol",
            width = 12,
            ### parallel buttons for voting body & voting issue
            fluidRow(
              ### voting body
              column(
                width = 4,
                radioButtons(
                  inputId = "trend_unbody", label = "Voting Body",
                  inline = TRUE,
                  choices = vote_body
                )
              ),
              ### voting issue
              column(
                width = 8,
                radioButtons(
                  inputId = "trend_unissue", label = "Issue Category",
                  inline = TRUE,
                  choices = issue_area
                )
              )
            ),
            ### parallel country pickers
            fluidRow(
              ### picker to live search one country as reference
              column(
                width = 4,
                pickerInput(
                  inputId = "trend_ca", label = "Select a country as reference", 
                  choices = country_geo_sort$Country,
                  choicesOpt = list(subtext = country_geo_sort$Subgroup),
                  multiple = TRUE, selected = FALSE,
                  options = pickerOptions(
                    liveSearch=TRUE, 
                    maxOptions=1,
                    noneSelectedText="No Country selected",
                  ),
                )
              ),
              ### live search countries for trends comparison
              column(
                width = 8,
                pickerInput(
                  inputId = "ctrendbgrp", label = "Select countries for comparison", 
                  choices = country_geo_sort$Country,
                  choicesOpt = list(subtext = country_geo_sort$Subgroup),
                  multiple = TRUE, selected = "United Kingdom",
                  options = pickerOptions(
                    liveSearch=TRUE, 
                    maxOptions=8,
                    noneSelectedText="No Country selected",
                  ),
                )
              )
            ),
            ### slider for a year range selection
            sliderInput(
              "ctrendyr", "Year Range:", width = "100%",
              min = 1960, max = 2020, step = 1,
              sep = NULL, ticks = FALSE,
              value = c(1960,2020)
            )
          )
        )
      ),

      ### tab for map
      tabItem(
        tabName = "map",
        ### box that contains the coincidence map
        box(
          title = "Map",
          id = "mapgraph",
          width = 12,
          echarts4rOutput("mapplot")
        ),
        ### box that have control items for map
        box(
          #title = "Time-Series Control",
          id = "mapcontrol",
          width = 12,
          ### parallel buttons for country selection, voting body & voting issue
          fluidRow(
            ### picker to live search one country as reference
            column(
              width = 4,
              pickerInput(
                inputId = "map_ca", label = "Select a country as reference", 
                choices = country_geo_sort$Country,
                choicesOpt = list(subtext = country_geo_sort$Subgroup),
                multiple = TRUE, selected = FALSE,
                options = pickerOptions(
                  liveSearch=TRUE, 
                  maxOptions=1,
                  noneSelectedText="No Country selected",
                ),
              )
            ),
            ### voting body
            column(
              width = 4,
              radioButtons(
                inputId = "map_unbody", label = "Voting Body",
                inline = TRUE,
                choices = vote_body
              )
            ),
            ### voting issue
            column(
              width = 4,
              radioButtons(
                inputId = "map_unissue", label = "Issue Category",
                inline = TRUE,
                choices = issue_area
              )
            )
          ),
          # ### slider to pick a year
          # ### might switch to echarts timeline map
          # sliderInput(
          #   "ctrendyr", "Year Range:", width = "100%",
          #   min = 1960, max = 2020, step = 1,
          #   sep = NULL, ticks = FALSE,
          #   value = c(1960,2020)
          # )
        )
      ), 
      
      ### about
      tabItem(
        tabName = "about"
      
      )
    )
  )
)

