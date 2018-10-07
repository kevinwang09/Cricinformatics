#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(visNetwork)
library(tidyverse)
load("cleanedPartnershipData.RData")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$network_proxy_nodes <- renderVisNetwork({
    
    networkData = cleanedPartnerData %>% 
      dplyr::filter(numberOfPartnerships >= 20,
                    partnershipCareerEnd <= input$InputYears[2],
                    partnershipCareerEnd >= input$InputYears[1])
    
    uniquePlayers = networkData %>% 
      dplyr::select(player1, player2, country) %>% 
      tidyr::gather(player12, 
                    player, -country) %>% 
      dplyr::select(-player12) %>% 
      dplyr::arrange(player) %>% 
      group_by(player) %>% 
      dplyr::summarise(
        freq = n(),
        country = first(country)
      ) %>% 
      dplyr::filter(freq > 1)
    
    # uniquePlayers
    
    nodes = uniquePlayers %>% 
      dplyr::transmute(
        id = player, 
        group = country, 
        label = ifelse(freq > quantile(freq, 0.75), player, ""),
        value = freq*10,
        font.size = 50,
        title = player,
        color = ifelse(country == "Australia", "#FFD700", "#4169E1")
      )
    
    edges = networkData %>% 
      dplyr::transmute(
        from = player1, 
        to = player2,
        value = totalPartnershipRuns,
        label = avgPartnershipPerDismissal,
        color = ifelse(country == "Australia", "#FFD700", "#4169E1")
      )
    
    
    ausEngNetwork = visNetwork(nodes, edges, height = "1000px", width = "1000px") %>% 
      visOptions(highlightNearest = TRUE, 
                 nodesIdSelection = TRUE) %>% 
      visInteraction(navigationButtons = TRUE) %>% 
      # visLegend() %>% 
      visLayout(randomSeed = 1, improvedLayout = TRUE)
    
    ausEngNetwork
  })
  
  
})
