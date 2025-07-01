# Migrație netă în Olt și regiunea Sahel (2000–2020)

library(ggplot2)
library(readr)
library(dplyr)

# Citim datele din fișierul extern
mig <- read_csv("data/migratie_olt_sahel.csv")

# Verificare rapidă
head(mig)

# Grafic bară pentru județul Olt
ggplot(mig %>% filter(regiune == "Olt"), aes(x = an, y = migratie_neta)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Migrația netă în județul Olt (2000–2020)",
    x = "An",
    y = "Migrație netă (axa inversată)"
  ) +
  theme_minimal()

# Grafic bară pentru regiunea Sahel
ggplot(mig %>% filter(regiune == "Sahel"), aes(x = an, y = migratie_neta)) +
  geom_col(fill = "orange") +
  labs(
    title = "Migrația netă în regiunea Sahel (2000–2020)",
    x = "An",
    y = "Migrație netă (persoane)"
  ) +
  theme_minimal()
