tempdata <- read.csv("Data/NH.Ts+dSST.csv", skip = 1, na.strings = "***")

# select years 1951 to 1980
temp_all_months <- subset(tempdata, (Year >= 1951 & Year <= 1980))

# columns 2 to 13 contain months Jan to Dec.
temp_51to80 <- unlist(temp_all_months[, 2:13])

# c(0.3, 0.7) indicates the chosen percentiles
perc <- quantile(temp_51to80, c(0.3, 0.7))

# the cold threshold
p30 <- perc[1]
p30

# The hot threshold
p70 <- perc[2]
p70

# Select years 1981 to 2010
temp_all_months <- subset(tempdata, (Year >= 1981 & Year <= 2010))

# Columns 2 to 13 contain months Jan to Dec
temp_81to10 <- unlist(temp_all_months[, 2:13])

paste("proportion smaller than p30")

# Show proportion < than p30
temp <- temp_81to10 < p30
mean(temp)

paste("Proportion larger than p70")

# Show proportion > then p70
mean(temp_81to10 > p70)