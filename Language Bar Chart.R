# Get this figure: fig <- get_figure("conorwallace", 15)
# Get this figure's data: data <- get_figure("conorwallace", 15)$data
# Add data to this figure: p <- add_trace(p, x=c(4, 5), y=c(4, 5), kwargs=list(filename="Language Bar Chart", fileopt="extend"))
# Get y data of first trace: y1 <- get_figure("conorwallace", 15)$data[[1]]$y

# Get figure documentation: https://plot.ly/r/get-requests/
# Add data documentation: https://plot.ly/r/file-options/

# You can reproduce this figure in R with the following code!

# Learn about API authentication here: https://plot.ly/r/getting-started
# Find your api_key here: https://plot.ly/settings/api

library(plotly)
trace1 <- list(
  x = c("CSS", "JavaScript", "JavaScript.1", "CoffeeScript", "CSS.1", "CSS.2", "Shell", "Ruby", "CoffeeScript.1", "Perl", "Ruby.1", "C", "Erlang", "Ruby.2", "JavaScript.2", "Ruby.3", "Ruby.4"), 
  y = c("3332", "1011", "24107", "2592", "242", "3701", "898", "537", "257", "32", "31821", "11777", "2243", "21290", "80072", "294", "217035"), 
  name = "B", 
  type = "bar", 
  uid = "fd3afe", 
  xsrc = "conorwallace:14:d9a08b", 
  ysrc = "conorwallace:14:7345e9"
)
data <- list(trace1)
layout <- list(
  hovermode = "closest", 
  title = "Lines Of Code in Each Languages", 
  xaxis = list(
    autorange = TRUE, 
    range = c(-0.5, 16.5), 
    title = "Language", 
    type = "category"
  ), 
  yaxis = list(
    autorange = TRUE, 
    range = c(0, 228457.894737), 
    title = "Lines Of Code", 
    type = "linear"
  )
)
p <- plot_ly()
p <- add_trace(p, x=trace1$x, y=trace1$y, name=trace1$name, type=trace1$type, uid=trace1$uid, xsrc=trace1$xsrc, ysrc=trace1$ysrc)
p <- layout(p, hovermode=layout$hovermode, title=layout$title, xaxis=layout$xaxis, yaxis=layout$yaxis)
p

detach("package:plotly", unload=TRUE)