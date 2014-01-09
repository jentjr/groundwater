#' This function plots groundwater data faceted by parameters with shaded regions
#' for background and compliance date ranges. Horizontal lines are plotted for 
#' Groundwater Protection Standards. 
#' 
#' @param df data frame in long format containing groundwater monitoring data
#' assumes column names of location_id, param_name, analysis_result, 
#' default_unit, lt_measure, sample_date. Dates for sample_date column
#'  must be in as.POSIXct format
#' @param facet_col the column to facet the plot by
#' @param back_date vector of start and end of background dates. Use as.POSIXct()
#' @param comp_date vector of start and end of compliance dates. Use as.POSIXct()
#' @param limits column vector of limits e.g. c("EPA_Limits", "DMR_limits")
#' @export


combo_plot <- function(df, facet_col = "param_name", back_date = NULL, 
                       comp_date = NULL, limit1 = NULL, limit2 = NULL, 
                       name = NULL, pnt = 3){
  
  df$non_detect <- ifelse(df$lt_measure == "<", "non-detect", "detected")

  if(isTRUE(name == "short")){
    df$param_name <- paste(df$short_name, " (", df$default_unit, ")", sep = "")
  } else {
    df$param_name <- paste(df$param_name, " (", df$default_unit, ")", sep = "")
  }
  
  # main plot
  p <- ggplot(data = df, aes(x = sample_date, y = analysis_result)) + 
    geom_line(data = df) +
    geom_point(data = df, aes(shape = factor(non_detect)), size = pnt) +
    facet_wrap(as.formula(sprintf('~%s', facet_col)), scale="free") 
  
  # Plot legends, labels, and titles
  if(facet_col == "param_name"){
    p <- p + ggtitle(paste("Time Series Plots for", 
                  df$location_id[1], "\n", sep=" "))
  }
  if(facet_col == "location_id"){
    p <- p + ggtitle(paste("Time Series Plots for", 
                           df$param_name[1], "\n", sep = " "))
  }
  
  p <- p + ylab("Analysis Result") +
    xlab("Sample Date") + 
    scale_x_datetime(labels = scales::date_format("%Y")) +
    theme(plot.margin = grid::unit(c(0.75, 0.75, 0.75, 0.75), "in")) + 
    theme_bw() +  
    
    # create custom legend using guide
    theme(axis.title.x = element_text(size = 15, vjust=-0.3)) +
    theme(axis.title.y = element_text(size = 15, vjust=0.3)) +
    guides(colour = guide_legend(override.aes = list(linetype = 0)), 
           shape = guide_legend("Measure", override.aes = list(linetype = 0)),
           size = guide_legend("none"),
           linetype = guide_legend("Limits")) +
    scale_shape_manual(values = c("non-detect" = 1, "detected" = 16))
  
  # shaded background and compliance date regions
  if(!missing(back_date)){
    # add rectangles for date ranges
    shaded_dates <- data.frame(xmin = c(back_date[1], comp_date[1]), 
                               xmax = c(back_date[2], comp_date[2]),
                               ymin = c(-Inf, -Inf), 
                               ymax = c(Inf, Inf),
                               Years = c("background", "compliance"))
    
    p <- p + geom_rect(data = shaded_dates, 
                       aes(xmin = xmin, ymin = ymin, xmax = xmax, 
                           ymax = ymax, fill = Years),
                       alpha = 0.2, inherit.aes = FALSE) +
      scale_fill_manual(values=c("blue","green")) +
      guides(fill = guide_legend(override.aes = list(linetype = 0)))
  }
  
  # add horizontal line for limit1
  if(!missing(limit1)){
    limit1 <- as.quoted(limit1)
    df$limit1_name <- paste(limit1[[1]])
      p <- p + geom_hline(data = df, 
                          aes_string(yintercept = limit1, 
                                     linetype = "limit1_name"), 
                          show_guide = TRUE)
  }
  # add horizontal line for limit2
  if(!missing(limit2)){
    limit2 <- as.quoted(limit2)
    df$limit2_name <- paste(limit2[[1]])
    p <- p + geom_hline(data = df, 
                        aes_string(yintercept = limit2, 
                                   linetype = "limit2_name"), 
                        show_guide = TRUE)
  }  
return(p)
}