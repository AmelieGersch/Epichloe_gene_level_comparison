# Amelie 25/11/19

x <- read.csv("~/fungalgene/gene_in_AT/tab_for_plot.csv")

# convert the sheet file (in wide format) in a long format table
# necessary to ggplot creation

library(reshape2)
long_format <-melt(data=x, na.rm = FALSE)


# create the plot, in histogram format, with this result
# thanks to ggplot function

library(ggplot2)
library(viridis)
library(hrbrthemes)


position <- c("Efe", "Eam", "Eel728", "Eel732", "Ety", "Ecl")
ggplot(long_format, aes(fill=variable, y=value, x=strain)) +
  scale_x_discrete(limits = position) +
  scale_y_continuous("Size (Mb)") +
  geom_bar(position="stack", stat="identity", colour="black") +
  scale_fill_brewer(palette="BuPu")+
  theme_bw()+
  xlab("")
ggsave("~/fungalgene/gene_in_AT/AT_gene_GC_in_genome_size.png")
