# import_and_clean.R
# Script pentru încărcarea și combinarea datelor geodemografice

library(readr)
library(dplyr)

# Citire fișiere CSV din folderul data
populatie <- read_csv("data/populatie.csv")
clima <- read_csv("data/clima.csv")
migratie <- read_csv("data/migratie_neta.csv")

# Verificare rapidă a datelor
head(populatie)
head(clima)
head(migratie)

# Combinarea datelor după judet și an
df <- populatie %>%
  inner_join(clima, by = c("judet", "an")) %>%
  inner_join(migratie, by = c("judet", "an"))

# Afișăm primii indicatori combinați
print("Date combinate:")
print(head(df))

# Salvare tabel final
write_csv(df, "data/df_complet.csv")
