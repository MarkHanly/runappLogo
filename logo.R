  ########################################################
  # Purpose: Experiment with designs for the RUNAPP logo
  # Outputs: runapp-logo.png
  ########################################################
  
  # Load libraries
  library(hexSticker)
  library(ggplot2)
  library(dplyr)
  library(scales)
  
  # For reproducibility
  set.seed(333)
  
  # Useful for viridis hex codes
  show_col(viridis_pal()(20))
  
  aus <- ozmap_states %>% filter(NAME != "Other Territories")
  
  # Create artificial RDD data
  df <- tibble(
    x = seq(from = 110, to = 155, by = .5),
    d = x > 132,
    yhat = -27 + 5*d + .3*(x - mean(x)) + .2*d*(x - mean(x)), 
    y = yhat + rnorm(length(x), 0, 1))
  
  # Plot  
  rdd <- ggplot() +
    geom_sf(data = aus, aes(fill = NAME), fill = 'black', color = "#1F968BFF", size = .05, alpha = .9) +
    geom_point(data = df, aes(x = x, color = y, y = y), size = .1, shape = 20) +
    geom_path(data = df, aes(x = x, y=yhat, color = yhat, group = d), size = 0.8) +
    scale_color_continuous(type = "viridis") +
    theme_void() +
    theme(legend.position = 'none')
    
    #geom_vline(xintercept = 50, color = '#1F968BFF', size = .1) + # #FDE725FF
     
  
  
  # Create sticker
  sticker(rdd, package="Communicating \nData", p_size = 3, p_y = 1.5, p_color = '#1F968BFF',
          s_x=1, s_y=0.8, s_width=1.4, s_height=1.4,
          h_fill = 'black',
          h_size = .6,
          h_color = '#1F968BFF',
          filename="runapp-logo.png") 
