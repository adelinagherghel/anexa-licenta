# Evoluția populației în zone afectate (Bangladesh și Teleorman)

library(ggplot2)
library(readr)
library(dplyr)

# Citim datele dintr-un fișier extern
pop <- read_csv("data/pop_evolutie_extern.csv")

# Ne uităm dacă e structurat corect
head(pop)

# Grafic linie cu puncte
ggplot(pop, aes(x = an, y = populatie, color = regiune)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "Evoluția populației (2000–2020)",
    x = "An",
    y = "Populație",
    color = "Regiune"
  ) +
  scale_y_continuous(labels = scales::comma) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "right"
  )
