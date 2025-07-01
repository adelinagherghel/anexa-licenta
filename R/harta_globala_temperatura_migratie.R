# Harta globală cu temperatura medie și migrația climatică

library(terra)
library(ggplot2)
library(sf)

# Citim rasterul de temperatură medie de la WorldClim (format .tif)

r_temp <- rast("data/wc_temp.tif")  # ex: bio1 = temp medie anuală *10

# Transformăm în dataframe pentru ggplot (pentru ușurință)
r_df <- as.data.frame(r_temp, xy = TRUE)
colnames(r_df) <- c("x", "y", "temp")

# Temperatura este în zecimi de °C, deci împărțim la 10
r_df$temp <- r_df$temp / 10

# Vizualizare simplă cu scale tematică de tip heatmap
ggplot(r_df) +
  geom_raster(aes(x = x, y = y, fill = temp)) +
  scale_fill_gradientn(colors = c("white", "yellow", "orange", "red", "darkred"),
                       name = "Temp. medie (°C)",
                       breaks = c(-10, 0, 5, 10, 15, 20, 25, 30, 35),
                       limits = c(-10, 40)) +
  coord_fixed(1.3) +
  labs(
    title = "Suprapunere: Temperatura medie globală (2001–2020)",
    subtitle = "Date: WorldClim v2.1, rezoluție 10min",
    caption = "Realizare proprie în R"
  ) +
  theme_minimal()
