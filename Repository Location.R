library(plotly)
trace1 <- list(
  x = c("San Francisco", "San Francisco", "San Francisco", "San Francisco", "In the NW", "Bay Minette", "Los Angeles", "San Francisco", "Buffalo", "New York City", "Louisville", "Montreal", "Portland", "Portland", "Seattle", "San Francisco", "Bloomington", "San Francisco", "Amsterdam", "Broomfield", "San Francisco", "New York", "South Lake Tahoe", "Bend", "Austin", "Austin", "Lawton", "Rochester", "Portland", "Portland", "San Francisco", "San Fransico", "Madison", "San Francisco", "Oslo", "Portland", "Dallas", "Berkshire", "San Francisco", "PDX", "SF", "San Francisco", "Skipton", "San Francisco", "Sevilla", "Florida", "Palm Springs", "Portland", "San Francisco", "SL", "San Francisco", "Berlin", "Plano", "Atlanta", "San Francisco", "Berlin", "Orlando", "Toledo", "San Francisco", "Santa Monica", "West Linn", "San Francisco", "Republic of Texas", "Cincinnati", "Ann Arbor", "Brisbane", "South Australia", "London", "San Francisco", "Santa Monica", "Columbus Indiana", "Copacabana", "San Francisco", "Cambridge", "Carlsbad", "Houston", "Los Angeles", "Bucharest", "Kansas City", "Denver", "Holland", "Montreal", "SF", "Holland", "Salt Lake City", "Milwaukee", "Fort Lauderdale", "Paris", "Mission", "Gothenburg", "San Francisco", "San Francisco", "San Francisco", "San Francisco", "San Francisco", "In the NW", "Bay Minette", "Los Angeles", "San Francisco", "Buffalo"), 
  autobinx = TRUE, 
  autobiny = TRUE, 
  name = "dataLocation", 
  type = "histogram", 
  uid = "45fa23", 
  xbins = list(
    end = 58.5, 
    size = 1, 
    start = -0.5
  ), 
  xsrc = "conorwallace:18:05c4a3"
)
data <- list(trace1)
layout <- list(
  hovermode = "closest", 
  title = "Repository commits per location", 
  xaxis = list(
    autorange = TRUE, 
    range = c(-0.5, 58.5), 
    title = "Data Location", 
    type = "category"
  ), 
  yaxis = list(
    autorange = TRUE, 
    range = c(0, 27.3684210526), 
    title = "Total Num Repositories per Location", 
    type = "-"
  )
)
p <- plot_ly()
p <- add_trace(p, x=trace1$x, autobinx=trace1$autobinx, autobiny=trace1$autobiny, name=trace1$name, type=trace1$type, uid=trace1$uid, xbins=trace1$xbins, xsrc=trace1$xsrc)
p <- layout(p, hovermode=layout$hovermode, title=layout$title, xaxis=layout$xaxis, yaxis=layout$yaxis)

p

detach("package:plotly", unload=TRUE)