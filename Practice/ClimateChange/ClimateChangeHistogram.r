# load the library
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

# combine the temperature data for June, July and August
#1
temp_summer <- c(tempdata$Jun, tempdata$Jul, tempdata$Aug)
#2
temp_summer <- unlist(tempdata[, 7:9], use.names = FALSE)

#MY SOLUTION!!!!
desired_order <- c("1921-1950", "1951-1980", "1981-2010")

# mirror the period information for temp_sum
temp_period <- c(tempdata$Period, tempdata$Period, tempdata$Period)

# repopulate the factor information
temp_period <- factor(temp_period, levels = desired_order, labels = levels(tempdata$Period))

#SOLUTION SUGGESTED BY CORN_ECON (DOESN'T WORK)!!!
# mirror the period information for temp_sum
temp_period <- c(tempdata$Period, tempdata$Period, tempdata$Period)

# repopulate the factor information
temp_period <- factor(temp_period, levels = 1:nlevels(tempdata$Period), labels = levels(tempdata$Period))

# build histograms
hist(temp_summer[(temp_period == "1951-1980")], plot = FALSE)

histogram(~ temp_summer | temp_period,
    type = "count",
    breaks = seq(-0.5, 1.3, 0.10),
    main = "Histogram of Temperature anomalies",
    xlab = "Summer temperature distribution"
)
