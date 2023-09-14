#installing library
install.packages("mosaic", lib = "/Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/library")

#load the library
library(mosaic)

tempdata <- read.csv("Data/NH.Ts+dSST.csv", skip = 1, na.strings = "***")

# head(tempdata)
str(tempdata)

tempdata$Jan <- ts(tempdata$Jan, start = c(1880), end = c(2023), frequency = 1)
tempdata$DJF <- ts(tempdata$DJF, start = c(1880), end = c(2023), frequency = 1)
tempdata$MAM <- ts(tempdata$MAM, start = c(1880), end = c(2023), frequency = 1)
tempdata$JJA <- ts(tempdata$JJA, start = c(1880), end = c(2023), frequency = 1)
tempdata$SON <- ts(tempdata$SON, start = c(1880), end = c(2023), frequency = 1)
tempdata$J.D <- ts(tempdata$J.D, start = c(1880), end = c(2023), frequency = 1)

#MONTH
plot(tempdata$Jan, type = "l", col = "blue", lwd = 2,
     ylab = "Annual temperature anomalies", xlab = "Year")
# Add a title
title("Average temperature anomaly in January in the northern hemisphere (1880-2023)")
# Add a horizontal line (at y = 0)
abline(h = 0, col = "darkorange2", lwd = 2)

#SEASON
#plot for Winter
plot(tempdata$DJF, type = "l", col = "blue", lwd = 2,
     ylab = "Annual temperature anomalies", xlab = "Year")
title("Average temperature anomaly in Winter in the northern hemisphere (1880-2023)")
abline(h = 0, col = "darkorange2", lwd = 2)

#plot for Spring
plot(tempdata$MAM, type = "l", col = "blue", lwd = 2,
     ylab = "Annual temperature anomalies", xlab = "Year")
title("Average temperature anomaly in Spring in the northern hemisphere (1880-2023)")
abline(h = 0, col = "darkorange2", lwd = 2)

#plot in Summer
plot(tempdata$JJA, type = "l", col = "blue", lwd = 2,
     ylab = "Annual temperature anomalies", xlab = "Year")
title("Average temperature anomaly in Summer in the northern hemisphere (1880-2023)")
abline(h = 0, col = "darkorange2", lwd = 2)

#plot in Fall
plot(tempdata$SON, type = "l", col = "blue", lwd = 2,
     ylab = "Annual temperature anomalies", xlab = "Year")
title("Average temperature anomaly in September in the northern hemisphere (1880-2023)")
abline(h = 0, col = "darkorange2", lwd = 2)

#YEAR
plot(tempdata$J.D, type = "l", col = "blue", lwd = 2,
     ylab = "Annual temperature anomalies", xlab = "Year")
title("Average temperature anomaly in the northern hemisphere (1880-2023)")
abline(h = 0, col = "darkorange2", lwd = 2)

#---------------------------------------------------------------------------

#FREQUENCY TABLES
#categorical variable that indicates subperiods
tempdata$Period <- factor(NA,
levels = c("1921-1950", "1951-1980", "1981-2010"),
ordered = TRUE)

tempdata$Period[(tempdata$Year > 1920) & (tempdata$Year < 1951)] <- "1921-1950"
tempdata$Period[(tempdata$Year > 1950) & (tempdata$Year < 1981)] <- "1951-1980"
tempdata$Period[(tempdata$Year > 1980) & (tempdata$Year < 2011)] <- "1981-2010"

temp_summer <- c(tempdata$Jun, tempdata$Jul, tempdata$Aug)

#combine the temperature data for June, July and August
temp_summer <- unlist(tempdata[, 7:9], use.names = FALSE)

#mirror the period information for temp_sum
temp_period <- c(tempdata$Period, tempdata$Period, tempdata$Period)

#repopulate the factor information
temp_period <- factor(temp_period, levels = 1:nlevels(tempdata$Period),
labels = levels(tempdata$Period))

hist(temp_summer[(temp_period == "1951-1980")], plot = FALSE)


histogram(~ temp_summer | temp_period, type = "count",
breaks = seq(-0.5, 1.3, 0.10),
main = "Histogram of Temperature anomalies",
xlab = "Summer temperature distribution"
)
