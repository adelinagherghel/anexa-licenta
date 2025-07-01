# harta_populatie_judete.R
# Distribuția populației pe județe – România
# Autor: Gherghel Adelina, Licență 2025

library(sf)
library(tmap)
library(readr)
library(dplyr)

# Citim datele demografice
pop <- read_csv("data/populatie.csv")

# Alegem doar anul 2020
pop2020 <- pop %>% filter(an == 2020)

# Citim fișierul shapefile cu județele (vector)
judete <- st_read("data/judete.shp")

# Alăturăm populația estimată (merge pe numele județului)
harta <- judete %>%
  left_join(pop2020, by = "judet")

# Modul de afișare static
tmap_mode("plot")

# Hartă tematică pe baza populației totale
tm_shape(harta) +
  tm_polygons("populatie_totala",
              palette = "Blues",
              style = "jenks",
              n = 6,
              title = "Populație estimată") +
  tm_layout(title = "Distribuția populației pe județe",
            legend.outside = TRUE)
