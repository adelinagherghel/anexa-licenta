# Evoluția temperaturii medii anuale (Teleorman vs Sahel, 2000–2020)

library(readr)

# Citim fișierul CSV cu temperaturi
temp <- read_csv("data/temperatura_teleorman_sahel.csv")

# Verificare simplă
head(temp)

# Grafic de linie cu culori diferite
plot(temp$an[temp$regiune == "Teleorman"], 
     temp$temp_medie[temp$regiune == "Teleorman"],
     type = "l", col = "blue", lwd = 2,
     ylim = c(10, 35),
     xlab = "Anul", ylab = "Temperatura medie (°C)",
     main = "Evoluția temperaturii medii anuale (2000–2020)")

lines(temp$an[temp$regiune == "Sahel"],
      temp$temp_medie[temp$regiune == "Sahel"],
      col = "red", lwd = 2)

legend("topleft", legend = c("Teleorman", "Sahel"), 
       col = c("blue", "red"), lwd = 2)
