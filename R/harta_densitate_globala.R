# Harta globală a densității populației – Fig. 2 din lucrare

library(ggplot2)
library(dplyr)
library(readr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

# Citim datele de densitate (descărcate din World Bank sau altă sursă)
densitate <- read_csv("data/pop_density.csv")  # trebuie să aibă coloanele iso3c și density

# Harta politică a lumii (cu coduri ISO pentru merge)
world <- ne_countries(scale = "medium", returnclass = "sf")

# Alăturăm datele reale de densitate
world_dens <- left_join(world, densitate, by = c("iso_a3" = "iso3c"))

# Creăm o hartă tematică globală
ggplot(world_dens) +
  geom_sf(aes(fill = density), color = "gray70", size = 0.1) +
  scale_fill_viridis_c(
    option = "magma",
    na.value = "lightgray",
    trans = "log",
    name = "Densitate\n(pers/km²)"
  ) +
  labs(
    title = "Densitatea populației la nivel global",
    caption = "Date: World Bank (2025) | Prelucrare: R + ggplot2"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.title = element_text(size = 10)
  )
