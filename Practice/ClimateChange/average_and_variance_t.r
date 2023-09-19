library(mosaic)

tempdata <- read.csv("Data/NH.Ts+dSST.csv", skip = 1, na.strings = "***")

# FREQUENCY TABLES
# categorical variable that indicates subperiods
tempdata$Period <- factor(NA,
    levels = c("1921-1950", "1951-1980", "1981-2010"),
    ordered = TRUE
)

tempdata$Period[(tempdata$Year > 1920) & (tempdata$Year < 1951)] <- "1921-1950"
tempdata$Period[(tempdata$Year > 1950) & (tempdata$Year < 1981)] <- "1951-1980"
tempdata$Period[(tempdata$Year > 1980) & (tempdata$Year < 2011)] <- "1981-2010"

paste("Mean of DJF temperature anomalies across periods")

# calculating mean of DJF
mean(~DJF | Period, data = tempdata)

paste("Variance of DJF anomalies across periods")

# calculating variance of DJF
var(~DJF | Period, data = tempdata)

paste("Variance of MAM anomalies across periods")
var(~MAM | Period, data = tempdata)

paste("Variance of JJA anomalies across periods")
var(~JJA | Period, data = tempdata)

paste("Variance of SON anomalies across periods")
var(~SON | Period, data = tempdata)

# plot for 
plot(tempdata$DJF, type = "l", col = "blue", lwd = 2,
     ylab = "Annual temperature anomalies", xlab = "Year")

# \n creates a line break
title("Average temperature anomaly in DJF and JJA \n in
the northen hemisphere (1880 - 2023)")

# Add a horizontal line (at y = 0)
abline(h = 0, col = "darkorange2", lwd = 2)
lines(tempdata$JJA, col = "darkgreen", lwd = 2)

# Add a label to the horizontal line
text(1895, 0.1, "1951 - 1980 average")
legend(1880, 1.5, legend = c("DJF", "JJA"),
       col = c("blue", "darkgreen"),
       lty = 1, cex = 0.8, lwd = 2)