---
title: "Class11"
author: "LVN"
date: "May 9, 2018"
output: 
  html_document: 
    keep_md: yes
---



## PDB statistics
Q1: Download a CSV file from the PDB site (accessible from “Analyze” -> “PDB Statistics” > “by Experimental Method and Molecular Type”. Move this CSV file into your RStudio project and determine the percentage of structures solved by X-Ray and Electron Microscopy. From the website what proportion of structures are protein?


```r
PDBstatistics <- read.csv("Data Export Summary.csv", row.names = 1)
percent <- PDBstatistics$Total / sum(PDBstatistics$Total)
names(percent) <- row.names(PDBstatistics)
barplot(percent)
```

![](Class11_files/figure-html/unnamed-chunk-1-1.png)<!-- -->
azef

bla






























