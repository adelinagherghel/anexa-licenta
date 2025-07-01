# Scatterplot temperatură vs migrație netă pentru Olt și Bangladesh

library(ggplot2)
library(readr)
library(dplyr)

# Citim datele
df <- read_csv("data/temp_migratie.csv")

# Grafic 1 – Olt
df_olt <- df %>% filter(regiune == "Olt")

ggplot(df_olt, aes(x = temp_medie, y = migratie_neta_pct)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  labs(
    title = "Corelație temperatură - migrație netă în Olt (2000–2020)",
    x = "Temperatura medie anuală (°C)",
    y = "Migrație netă (%)"
  ) +
  theme_minimal()

# Grafic 2 – Bangladesh
df_bang <- df %>% filter(regiune == "Bangladesh")

ggplot(df_bang, aes(x = temp_medie, y = migratie_neta_pct)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  labs(
    title = "Corelație temperatură - migrație netă în Bangladesh (2000–2020)",
    x = "Temperatura medie anuală (°C)",
    y = "Migrație netă (%)"
  ) +
  theme_minimal()
