library(shiny)
library(dplyr)
library(bs4Dash)
library(shinydashboard)
library(shinyWidgets)
library(echarts4r)
library(countrycode)
###
source('global.R')
source('ui.R', local = TRUE)
source('server.R')

shinyApp(
  ui = ui,
  server = server
)