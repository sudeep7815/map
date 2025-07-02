library(tidyverse)
library(janitor)
library(sf)
library(leaflet)


dir(path = "India Shape")

india<-st_read("India Shape/india_ds.shp")

india %>% 
  mutate(random_no = sample(c(1:100),482,replace = T))->india

#India map
ggplot(data = india)+
  geom_sf(fill = "grey",color = "black")+
  ggtitle("Map of India")
theme_minimal()

ggplot(data = india)+
  geom_sf(aes(fill = random_no),color = "black")+
  ggtitle("Map of India")
theme_minimal()


ggplot(data = india)+
  geom_sf(aes(fill = random_no),color = "black")+
  ggtitle("Map of India")+
  scale_fill_gradient(low = "red",high = "blue")+
  theme_void()

india%>% 
  filter(STATE=="KARNATAKA")->KA

ggplot(data = KA)+
  geom_sf(fill = "orange",color = "black")+
  ggtitle("Map of KARNATAKA")
theme_minimal()

  
ggplot(data = KA)+
  geom_sf(aes(fill = random_no),color = "black")+
  ggtitle("Map of KARNATAKA")
theme_minimal()


#create leaflet map

leaflet(india)%>%
  addTiles() %>%  #base map
  addProviderTiles("Stadia.AlidadeSatellite")
  addPolygons(
    fillColor = "lightblue",
    weight = 1,
    color = "black",
    fillOpacity = 0.5,
    popup = ~as.character(random_no)
  )
  

#leaflet




