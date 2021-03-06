#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(visNetwork)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    sliderInput(inputId = "InputYears",
                label = "Partnership spans",
                min = 1930L, max = 2018L, value = c(1930L, 1940L),
                step = 1),
    visNetwork::visNetworkOutput("network_proxy_nodes", height = "1000px")
  )
)
