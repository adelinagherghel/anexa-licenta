# Hărți tematice pentru migrație și temperatură – România

library(sf)
library(tmap)
library(readr)
library(dplyr)

# Citim datele statistice
df <- read_csv("data/df_complet.csv")

# Citim shapefile-ul cu județele României
judete <- st_read("data/judete.shp")

# Ne uităm doar la anul 2020
df_2020 <- df %>% filter(an == 2020)

# Verificăm dacă denumirile se potrivesc
table(df_2020$judet %in% judete$judet)

# Alipim valorile statistice pe geometrie
harta <- judete %>%
  left_join(df_2020, by = "judet")

# Trecem tmap în modul static
tmap_mode("plot")

# Definim 2 hărți: temperatură și migrație
harta_temp <- tm_shape(harta) +
  tm_polygons("temp_medie", palette = "YlOrRd", title = "Temperatură (°C)") +
  tm_layout(title = "Temperatura medie anuală – 2020", legend.outside = TRUE)

harta_migratie <- tm_shape(harta) +
  tm_polygons("migratie_neta", palette = "RdBu", title = "Migrație netă") +
  tm_layout(title = "Migrație netă pe județe – 2020", legend.outside = TRUE)

# Afișăm ambele hărți una sub alta
tmap_arrange(harta_temp, harta_migratie, ncol = 1)
