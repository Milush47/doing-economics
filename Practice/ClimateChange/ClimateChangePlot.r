#installing library
install.packages("mosaic", lib = "/Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/library")



tempdata <- read.csv("Data/NH.Ts+dSST.csv", skip = 1, na.strings = "***")

# head(tempdata)
#str(tempdata)

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


