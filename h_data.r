library(ggplot2)
library(plotly) 

fig

# 2009 - 2010
df <- Quant_Hockey

fig <- df %>%
  plot_ly(
    type = 'scatter',
    mode = 'markers',
    x = ~G/GP,
    y = ~A/GP,
    marker = list(size = ~P/GP, sizeref = 0.1, sizemode = 'area'),
    text = ~Name,
    hovertemplate = paste(
      "<b>%{text}</b><br><br>",
      "%{yaxis.title.text}: %{y:0.f}<br>",
      "%{xaxis.title.text}: %{x:0.f}<br>",
      "P/GP: %{marker.size:0.f}",
      "<extra></extra>"
    )
  ) 
fig <- fig %>%
  layout(legend = list(orientation = 'h', y = -0.3))

fig

# 2022 - 2023 Hockey
df <- Quant_Hockey_2

fig <- df %>%
  plot_ly(
    type = 'scatter',
    mode = 'markers',
    x = ~G/GP,
    y = ~A/GP,
    marker = list(size = ~P/GP, sizeref = 0.1, sizemode = 'area'),
    text = ~Name,
    hovertemplate = paste(
      "<b>%{text}</b><br><br>",
      "%{yaxis.title.text}: %{y:0.f}<br>",
      "%{xaxis.title.text}: %{x:0.f}<br>",
      "P/GP: %{marker.size:0.f}",
      "<extra></extra>"
    )
  ) 
fig <- fig %>%
  layout(legend = list(orientation = 'h', y = -0.3))

fig

# 2009 - 2010 Complete List Hockey

df <- Quant_Hockey_3

fig <- df %>%
  plot_ly(
    type = 'scatter',
    mode = 'markers',
    x = ~G/GP,
    y = ~A/GP,
    marker = list(size = ~P/GP, sizeref = 0.1, sizemode = 'area'),
    text = ~Name,
    hovertemplate = paste(
      "<b>%{text}</b><br><br>",
      "%{yaxis.title.text}: %{y:0.f}<br>",
      "%{xaxis.title.text}: %{x:0.f}<br>",
      "P/GP: %{marker.size:0.f}",
      "<extra></extra>"
    )
  ) 
fig <- fig %>%
  layout(legend = list(orientation = 'h', y = -0.3))

fig
