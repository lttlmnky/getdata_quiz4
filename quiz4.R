# Week 4 Quiz Getting and Cleaning Data
## Question 1
### codebook
urlCodebook <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
fileCodebook <- "getdata-data-PUMSDataDict06.pdf"
download.file(url = urlCodebook, destfile = fileCodebook, method = "curl")
### data file
urlData <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
fileData <- "getdata-data-ss06hid.csv"
download.file(url = urlData, destfile = fileData, method = "curl")
###
housing <- read.csv(file = fileData)
strsplit(names(housing), split = "wgtp")[[123]]
# [1] ""   "15"

## Question 2
###
urlData1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileData1 <- "getdata-data-GDP.csv"
download.file(url = urlData1, destfile = fileData1, method = "curl")
###
gdp <- read.csv(fileData1, header = FALSE, skip = 5, nrows = 190)
mean(as.numeric(gsub(pattern = ",", replacement = "", x = gdp$V5)))
# [1] 377652.4

## Question 3
###
countryNames <- gdp$V4
length(grep(pattern = "^United", x = countryNames))
# [1] 3
# Warning messages:
# ...

## Question 4
###
urlData1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileData1 <- "getdata-data-GDP.csv"
download.file(url = urlData1, destfile = fileData1, method = "curl")
###
urlData2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
fileData2 <- "getdata-data-EDSTATS_Country.csv"
download.file(url = urlData2, destfile = fileData2, method = "curl")
###
gdp <- read.csv(fileData1, header = FALSE, skip = 5, nrows = 190)
edu <- read.csv(fileData2)
###
m10 <- merge(x = gdp[, c(1,2)], y = edu[, c(1,10)], by.x = "V1", by.y = "CountryCode" )
length(grep("Fiscal year end: June", m10$Special.Notes))
# [1] 13

## Question 5
###
install.packages("quantmod")
library(quantmod)
amzn <- getSymbols("AMZN", auto.assign = FALSE)
sampleTimes = index(amzn)
s2012 <- sampleTimes[grep("2012-", sampleTimes)]
length(s2012)
# [1] 250
sum(weekdays(as.Date(s2012))=="Monday")
# [1] 47
