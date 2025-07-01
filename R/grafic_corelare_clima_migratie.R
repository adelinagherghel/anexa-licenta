# Corelarea temperaturii, secetei și migrației nete (2000–2020)

library(ggplot2)
library(readr)

# Citim fișierul cu date climatice și demografice
corel <- read_csv("data/corelatie_clima_migratie.csv")

# Bubble plot
ggplot(corel, aes(x = temp_medie, y = seceta, size = abs(migratie_neta), fill = regiune)) +
  geom_point(alpha = 0.6, shape = 21, color = "black") +
  geom_text(aes(label = regiune), vjust = -1, size = 3) +
  scale_size_continuous(name = "Migrație netă (absolut)") +
  labs(
    title = "Corelarea datelor climatice cu migrația netă (2000–2020)",
    x = "Temperatura medie anuală (°C)",
    y = "Număr episoade de secetă"
  ) +
  theme_minimal()
