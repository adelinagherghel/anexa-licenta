# Harta suprapunere migrație netă + secetă

library(ggplot2)
library(dplyr)
library(readr)
library(sf)

# Citim datele
df <- read_csv("data/migratie_seceta_judete.csv")

# Citim harta județelor din România (din pachetul geojson sau shapefile)
romania <- st_read(...)

# Nume compatibil între date și hartă
romania$judet <- romania$name

# Combinăm harta cu datele
map_data <- romania %>%
  left_join(df, by = "judet")

# Generăm harta: colorare după migrație și secetă (prin scale continuă compusă)
ggplot(map_data) +
  geom_sf(aes(fill = migratie_neta + seceta * 200), color = "white") +
  scale_fill_gradient2(low = "lightblue", mid = "white", high = "darkred", midpoint = 0,
                       name = "Indice combinat") +
  labs(
    title = "Suprapunere: Migrație netă și secetă frecventă",
    caption = "Sursa: date INS și ANM, procesare proprie"
  ) +
  theme_minimal()
