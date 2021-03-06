## ---- echo = FALSE, message=FALSE----------------------------------------
library(manager)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "figures/geochemical-"
)

## ---- piper, fig.height=6, fig.width=9, results='hide', warning=FALSE----
# load example data
data("gw_data")

gw_data %>%
  piper_plot()

## ----schoeller, fig.height=6, fig.width=9, results='hide', warning=FALSE----
gw_data %>%
  schoeller_plot()

## ----stiff, eval=FALSE, fig.height=6, fig.width=9, warning=FALSE, include=FALSE, results='hide'----
#  gw_data %>%
#    filter(location_id == "MW-1") %>%
#    stiff_plot(., total_dissolved_solids = "Total Dissolved Solids")

