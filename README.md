# Cricinformatics: applying bioinformatics to cricket

* [Introduction](#introduction)
  * [Slides](#slides)
* [Key results and updates](#key-results-and-updates)
  * [2018 - SUMS talk](#2018---sums-talk)
  * [2019 - Survival analysis](#2019---survival-analysis)
  * [2020 - Ball by ball commentary](#2020---ball-by-ball-commentary)
* [Reference](#reference)
* [Data sources](#data-sources)
   
# Introduction

My specialisation in statistics and bioinformatics meant that I often spend time sitting in front of a TV and doing data analysis at the same time. Some time around 2018, I had the idea of making these things come together into "cricinformatics" (cricket and bioinformatics) and gave several outreach talks. 

This repository contains: 

+ Analytics of cricket data
+ Outreach seminar slides 
+ Additional codes for harmonising cricket data analysis in R

## Slides

Slides for my presentation for Sydney University Mathematics Society is available [here](talks/cricinformatics.pdf).

# Key results and updates

## 2018 - SUMS talk

All analysis during this time was based on the Kaggle data. 

1.  Networks of batsmen were "prognostic" for Ashes team performance.
2.  Classifiability score (Strbenac et. al. 2015) of cricket players was directly correlated with well-established ternary categories of batsmen, bowlers, all-rounders.
3.  By applying Monocle, a single-cell trajectory analysis (Trapnell et. al. 2014) revealed potential career progressions and maturation of players.

## 2019 - Survival analysis 

All analysis during this time was downloaded directly from the Cricinfo website. 

1. Some codes were written to scrap data from the Cricinfo website for all existing players. 
2. A simple KM-plot was used to show that the first 30 balls or 30 runs are the more dangerous for a batsman, with roughly 50% of all batsmen get out before this. 

Analysis are temporarily placed in https://kevinwang09.github.io/tidytuesday/cricket. 

## 2020 - Ball by ball commentary

New data was downloaded from Cricsheet and is in the process of being cleaned. 

# Reference
+ Strbenac D, Mann GJ, Ormerod JT, Yang JYH (2015). "ClassifyR: an R package for performance assessment of classification with applications to transcriptomics."" Bioinformatics, 31(11), 1851-1853.

+ Trapnell, Cole and Cacchiarelli, Davide and Grimsby, Jonna and Pokharel, Prapti and Li, Shuqiang and Morse, Michael and Lennon, Niall J and Livak, Kenneth J and Mikkelsen, Tarjei S and Rinn, John L (2014). The dynamics and regulators of cell fate decisions are revealed by pseudotemporal ordering of single cells. Nature Biotech. 32, 381–386. 

# Data sources 

+ Kaggle: https://www.kaggle.com/cclayford/cricinfo-statsguru-data/version/8#
+ [ESPN Cricinfo](https://www.espncricinfo.com/)
+ [cricsheet](https://cricsheet.org/)