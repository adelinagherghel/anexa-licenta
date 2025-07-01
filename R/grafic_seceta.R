# Număr episoade secetă – Teleorman vs Sahel (2000–2020)

library(ggplot2)
library(readr)
library(dplyr)

# Citim fișierul cu datele de secetă
seceta <- read_csv("data/seceta_teleorman_sahel.csv")

# Grafic linie + puncte
ggplot(seceta, aes(x = an, y = nr_episoade, color = regiune)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Numărul de episoade de secetă (2000–2020)",
    x = "Anul",
    y = "Număr episoade de secetă",
    color = "Regiune"
  ) +
  theme_minimal()
