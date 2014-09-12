###### Load data and libraries 
Batdata<-read.table("WindFarmData.txt", header=T)

names(Batdata)
head(Batdata)


library(ggplot2)
library(RColorBrewer)
library(ggvis)
library(shiny)

###### Script 1 
ggplot(Batdata, aes(x=factor(Habitat), y=Soprano.Pipistrelle)) + 
  geom_boxplot() 

###### Script 2
ggplot(Batdata, aes(x=factor(Month), y=Noctule, fill=Location)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette="Set1")

###### Script 3
ggplot(Batdata, aes(Barbastelle, y=Date, colour=Location)) + 
  geom_point( size=5) +
  xlim(1,6) +
  xlab("Observed bat passes per day") +
  ylab("Night Time")

###### Script 4
Batdata %>% ggvis(x = ~Noctule) %>%
  layer_densities(
    adjust = input_slider(.1, 2, value = 1, step = .1, label = "Bandwidth adjustment"),
    kernel = input_select(
      c("Gaussian" = "gaussian",
        "Epanechnikov" = "epanechnikov",
        "Rectangular" = "rectangular",
        "Triangular" = "triangular",
        "Biweight" = "biweight",
        "Cosine" = "cosine",
        "Optcosine" = "optcosine"),
      label = "Kernel")
  )
###### End
