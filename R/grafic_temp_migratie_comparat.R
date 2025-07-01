# Comparatie temperatură și migrație România vs Internațional

library(readr)

# Citim datele
df <- read_csv("data/temp_migratie_comparat.csv")

# Pregătim plotul
par(mar = c(5, 4, 4, 4) + 0.1)

# Temperatura (axă stângă)
plot(df$an, df$temp_romania, type = "l", col = "blue", lwd = 2,
     xlab = "Anul", ylab = "Temperatura medie (°C)",
     main = "Temperatură și migrație netă: România vs Internațional (2000–2020)",
     ylim = c(10, 32))

lines(df$an, df$temp_international, col = "red", lwd = 2, lty = 2)

# Adăugăm a doua axă Y pentru migrație netă
par(new = TRUE)
plot(df$an, df$migratie_romania, type = "l", col = "blue", lwd = 2, lty = 3,
     axes = FALSE, xlab = "", ylab = "", ylim = c(-5, 2))
lines(df$an, df$migratie_international, col = "red", lwd = 2, lty = 3)

axis(4)
mtext("Migrație netă (%)", side = 4, line = 3)

legend("topleft",
       legend = c("Temp România", "Temp Internațional", "Migrație România", "Migrație Internaț."),
       col = c("blue", "red", "blue", "red"),
       lty = c(1, 2, 3, 3),
       lwd = 2,
       cex = 0.8)
