# Analize și grafice: migrație, temperatură, populație

library(ggplot2)
library(readr)
library(dplyr)

# Citim datele combinate din scriptul anterior
df <- read_csv("data/df_complet.csv")

# CORELAȚIE între temperatura medie și migrație netă
cor_pearson <- cor(df$temp_medie, df$migratie_neta)
cat("Coeficient de corelație Pearson (temp vs migrație):", round(cor_pearson, 3), "\n")

# GRAFIC 1 – Scatterplot temperatură vs migrație
ggplot(df, aes(x = temp_medie, y = migratie_neta)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Corelație între temperatura medie și migrația netă",
    x = "Temperatura medie (°C)",
    y = "Migrație netă"
  )

# GRAFIC 2 – Evoluția temperaturii în timp
ggplot(df, aes(x = an, y = temp_medie, color = judet)) +
  geom_line() +
  labs(
    title = "Evoluția temperaturii medii pe județe",
    x = "An",
    y = "Temperatură medie (°C)"
  )

# GRAFIC 3 – Evoluția migrației nete
ggplot(df, aes(x = an, y = migratie_neta, color = judet)) +
  geom_line() +
  labs(
    title = "Migrație netă în perioada 2000–2020",
    x = "An",
    y = "Migrație netă"
  )
