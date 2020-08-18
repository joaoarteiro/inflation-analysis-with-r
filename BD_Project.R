install.packages("RColorBrewer")
install.packages("rworldmap")
install.packages("readxl")

library(RColorBrewer)
library(rworldmap)
library(readxl)


mapData <- read_excel("C:/Users/João Bernardo/Desktop/BigDataAnalisys/DATABASES/Inflation.xls")

mapData <- aggregate(mapData$`2016`, by=list(Country=mapData$`Country Name`), FUN=sum)
                     colnames(mapData)[colnames(mapData)=='x'] <- "Inflation by country"
                     
       ##Venezuela 2016--example
                     
                     worldMapInflation <- joinCountryData2Map(mapData,
                                                              nameJoinColumn = "Country",
                                                              joinCode = "NAME")
                     
                     cores <- RColorBrewer::brewer.pal(9,'Reds')
                     
                     mapCountryData(worldMapInflation,
                                    nameColumnToPlot = 'Inflation by country',
                                    catMethod = 'fixedWidth',
                                    colourPalette = cores ,
                                    numCats = 9)
