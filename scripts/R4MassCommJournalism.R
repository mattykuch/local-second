
library(quantmod)
library(dygraphs)

#3.4 

#Graph a MA’s median income

ma_income <- getSymbols("MEHOINUSMAA646N", src="FRED", auto.assign = FALSE)

names(ma_income) <- "MA Income"
dygraph(ma_income, main = "Massachusetts Median Household Income")

#Graph a CA’s median income

ca_income <- getSymbols("MEHOINUSCAA646N", src="FRED", auto.assign = FALSE)

names(ca_income) <- "CA Income"
dygraph(ca_income, main = "California Median Household Income")

#Graph a US’s median income

us_income <- getSymbols("MHIUS00000A052NCEN", src="FRED", auto.assign = FALSE)

names(us_income) <- "US Income"
dygraph(us_income, main = "United States Median Household Income")

#Combine charts
mygraphdata <- cbind(ma_income,ca_income,us_income)

dygraph(mygraphdata, main = "US, MA and CA Median Household Income")


