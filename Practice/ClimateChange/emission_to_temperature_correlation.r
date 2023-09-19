CO2data <- read.csv("Data/1_CO2_data.csv")
tempdata <- read.csv("Data/NH.Ts+dSST.csv", skip = 1, na.strings = "***")

# contains only june emissions
CO2data_june <- CO2data[CO2data$Month == 6, ]

# merge two datasets
names(CO2data)[1] <- "Year"
tempCO2data <- merge(tempdata, CO2data_june)

head(tempCO2data[, c("Year", "Jun", "Trend")])

# scatterplot or CO2 emissions and temperature anomalies
plot(tempCO2data$Jun, tempCO2data$Trend,
     xlab = "Temperature anomaly (degrees Celsius)",
     ylab = "CO2 levels (trend, mole fraction)",
     pch = 16, col = "blue")

title("Scartterplot for CO2 emissions and temperature anomalies")

# calculate correlation coefficient
cor(tempCO2data$Jun, tempCO2data$Trend)

# create dataset for linear plot
tempCO2data$Jun <- ts(tempCO2data$Jun,
                      start = c(1958), end = c(2017), frequency = 1)

tempCO2data$Trend <- ts(tempCO2data$Trend,
                        start = c(1958), end = c(2017), frequency = 1)

# linear plot for june temperature anomalies and CO2 emissions
plot(tempCO2data$Jun, type = "l", col = "blue", lwd = 2,
     ylab = "June temperature anomalies", xlab = "Year")

title("June temperature anomalies and CO2 emissions")

# create extra margins used for the second axis
par(mar = c(5, 5, 2, 5))

plot(tempCO2data$Jun, type = "l", col = "blue", lwd = 2,
     ylab = "June temperature anomalies", xlab = "Year")

title("June temperature anomalies and CO2 emissions")

# This puts the next plot into the same picture
par(new = T)

# No axis no labels
plot(tempCO2data$Trend, pch = 16, lwd = 2,
     axes = FALSE, xlab = NA, ylab = NA, cex = 1.2)

axis(side = 4)
mtext(side = 5, line = 3, "CO2 emissions")

legend("topleft", legend = c("June temp anom", "CO2 emis"),
       lty = c(1, 1), col = c("blue", "black"), lwd = 2)

#EXTRA PRACTISE
#plots for January and September
CO2data_january <- CO2data[CO2data$Month == 1, ]
CO2data_september <- CO2data[CO2data$Month == 9, ]

tempCO2data <- merge(tempdata, CO2data_january)
tempCO2data <- merge(tempdata, CO2data_september)

head(tempCO2data[, c("Year", "Jan", "Trend")])

tempCO2data$Jan <- ts(tempCO2data$Jan,
    start = c(1958), end = c(2016), frequency = 1
)

tempCO2data$Sep <- ts(tempCO2data$Sep,
    start = c(1958), end = c(2016), frequency = 1
)

tempCO2data$Trend <- ts(tempCO2data$Trend,
    start = c(1958), end = c(2016), frequency = 1
)

par(mar = c(5, 5, 2, 5))

#JANUARY
plot(tempCO2data$Jan, type = "l", col = "blue", lwd = 2,
     ylab = "January temperature anomalies", xlab = "Year")

title("January temperature anomalies and CO2 emissions")

par(new = T)

plot(tempCO2data$Trend,
    pch = 16, lwd = 2,
    axes = FALSE, xlab = NA, ylab = NA, cex = 1.2
)

axis(side = 4)
mtext(side = 5, line = 3, "CO2 emissions")

legend("topleft",
    legend = c("January temp anom", "CO2 emis"),
    lty = c(1, 1), col = c("blue", "black"), lwd = 2
)

#SEPTEMBER
plot(tempCO2data$Sep,
    type = "l", col = "blue", lwd = 2,
    ylab = "Semptember temperature anomalies", xlab = "Year"
)

title("Semptember temperature anomalies and CO2 emissions")

par(new = T)

plot(tempCO2data$Trend,
    pch = 16, lwd = 2,
    axes = FALSE, xlab = NA, ylab = NA, cex = 1.2
)

axis(side = 4)
mtext(side = 5, line = 3, "CO2 emissions")

legend("topleft",
    legend = c("Semptember temp anom", "CO2 emis"),
    lty = c(1, 1), col = c("blue", "black"), lwd = 2
)
