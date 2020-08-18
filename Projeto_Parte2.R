library(readxl)
library(ggplot2)
library(tidyr)
library(dplyr)
InfData<- read_excel("C:/Users/João Bernardo/Desktop/BigDataAnalisys/DATABASES/InflationVals.xls")
long <- gather(InfData, Year, Value, -`Country Name`) %>%
  filter(`Country Name` == "Poland") 
  


ggplot(data = long,aes(x=Year, y = Value, group=1))+
  geom_line(color = 'cyan') +
  geom_area(fill='cyan', alpha= .1) +
  labs(x = 'Date'
       ,y = 'Inflation %'
       ,title = "Poland's Inflation" ) +
  theme(text = element_text(family = 'Arial', color = "#444444")
        ,panel.background = element_rect(fill = '#444B5A')
        ,panel.grid.minor = element_line(color = '#4d5566')
        ,panel.grid.major = element_line(color = '#586174')
        ,plot.title = element_text(size = 28)
        ,axis.title = element_text(size = 18, color='#555555')
        ,axis.title.y = element_text(vjust = 1, angle = 90)
        ,axis.title.x = element_text(hjust = 0)
        ,axis.text.x = element_text(angle = 90, hjust = 0)
        )