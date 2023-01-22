
#Install the 2 packages needed
install.packages(c("quantmod", "dygraphs"))

#Load packages into current session
library("quantmod")
library("dygraphs")

#Google stock price since last recession in 2008

google_stock_prices <- getSymbols("GOOG", src = "yahoo", from = "2008-01-01",
                                  auto.assign = FALSE)
chartSeries(google_stock_prices)

#Making the Google chart interactive
dygraph(google_stock_prices[,c("GOOG.Close")], 
        main = "Google Stock Price Starting in 2008")

#Facebook stock price since 2012

meta_stock_prices <- getSymbols("META", src = "yahoo", from = "2008-01-01",
                                  auto.assign = FALSE)
chartSeries(meta_stock_prices)

#Making the Meta chart interactive
dygraph(meta_stock_prices[,c("META.Close")], 
        main = "Meta Stock Price Starting in 2012")

#Tesla stock price since 2010

tesla_stock_prices <- getSymbols("TSLA", src = "yahoo", from = "2008-01-01",
                                auto.assign = FALSE)
chartSeries(tesla_stock_prices)

#Making the Tesla chart interactive
dygraph(tesla_stock_prices[,c("TSLA.Close")], 
        main = "Tesla Stock Price Starting in 2010")