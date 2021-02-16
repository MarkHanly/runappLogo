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

# Create artificial RDD data
df <- tibble(
  x = 1:100,
  d = x > 50,
  yhat = 0.2 * x + 5 * d + 0.2 * x * d,
  y = yhat + rnorm(length(x), 0, 4))

# Plot  
rdd <- ggplot(df, aes(x = x, color = x)) +
  geom_point(aes(y=y), size = .01) +
  geom_line(aes(y=yhat, group = d), size = 0.8) +
  geom_vline(xintercept = 50, color = '#B8DE29FF', size = .1) +
  scale_color_continuous(type = "viridis") +
  theme_void() +
  theme(legend.position = 'none')


# Create sticker
sticker(rdd, package="RUNAPP", p_size = 5, p_color = '#FDE725FF',
        s_x=1, s_y=0.8, s_width=1, s_height=1,
        h_fill = 'black',
        h_size = 1.5,
        h_color = 'grey40',
        filename="runapp-logo.png") 
