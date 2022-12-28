library(magrittr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(ggthemes)
library(ggrepel)
library(scales)
library(png)
library(grid)

M <- 1000000

ggdf2 <- data.frame(X = rep(c(1,2,5,10,20), times = 2),
                    Method = rep(c("OTT", "Riemannian SGD"), each = 5),
                    Value = c(7.0971996784210205, 6.869725704193115, 7.377142906188965, 7.163392543792725, 7.044593811035156,
                              30.371521949768066, 30.836822032928467, 38.0672652721405, 54.24374175071716, 91.08871269226074)/10)

ggplot(data = ggdf2, aes(x = X, y = Value, color = Method)) +
  geom_point(size = 3) +
  geom_line() +
  theme(panel.background = element_blank(),
        panel.border = element_rect(color = "black", fill = NA),
        panel.grid.major = element_line(color = "#CCCCCC"),
        panel.grid.minor = element_line(color = "#EEEEEE"),
        strip.background = element_blank(),
        plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm"),
        legend.position = c(0.025, 0.975),
        legend.justification = c(0, 1),
        legend.box.background	= element_rect(color = "black", size = 0.8),
        legend.key = element_blank(),
        legend.title = element_text(size=14),
        legend.text = element_text(size=14),
        axis.text = element_text(size=14),
        axis.title = element_text(size=18)) +
  scale_x_continuous(breaks = ggdf2$X) +
  scale_y_continuous(limits = c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(y = "Seconds per iteration", x = "TT Rank") +
  scale_color_brewer(palette = "Dark2")
ggsave("time_comparison.eps", height = 4, width = 6, units = "in")