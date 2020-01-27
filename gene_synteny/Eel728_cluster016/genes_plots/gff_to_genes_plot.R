
library(stringr)
library(ggplot2)
library(gggenes)


.drop_empty <- function(x){
    lapply(x, function(x) x[x!=""])
}

.split_one <- function(x){
        pairs <- .drop_empty(str_split(x, "="))
        structure(as.list(sapply(pairs, "[[", 2)), .Names=sapply(pairs, "[[", 1))
}


read_gff <- function(fname, parse_attr=TRUE){
    res <- read.table(fname, sep="\t", stringsAsFactors=FALSE)
    names(res) <- c("chr", "source", "feature", "start", "end", "score", "phase"," frame", "attributes")
    if(parse_attr){
        new_cols <- lapply(.drop_empty(str_split(res$attributes, ";")), .split_one)
        res[["attributes"]] <- NULL
        res <- data.frame(res, do.call(rbind.data.frame, new_cols))
    }
    res
}


create_plot <- function(name, input, output){
name <- read_gff(input)
ggplot(name, aes(xmin=start, xmax=end, y=chr, fill=ID, forward=phase=="+")) +
  geom_gene_arrow() +
  theme_genes() +
  scale_fill_brewer(palette = "Set3")
ggsave(filename=output)
}

A <- "eam"
B <- "~/fungalgene/gene_synteny/specie_gene_location_gff/Eam.gff"
C <- "Eam_gene_plot.png"

A <- "ecl"
B <- "~/fungalgene/gene_synteny/specie_gene_location_gff/Ecl.gff"
C <- "Ecl_gene_plot.png"

A <- "ety"
B <- "~/fungalgene/gene_synteny/specie_gene_location_gff/Ety.gff"
C <- "Ety_gene_plot.png"

A <- "efe"
B <- "~/fungalgene/gene_synteny/specie_gene_location_gff/Efe.gff"
C <- "Efe_gene_plot.png"

A <- "eel728"
B <- "~/fungalgene/gene_synteny/specie_gene_location_gff/Eel728.gff"
C <- "Eel728_gene_plot.png"

A <- "eel732"
B <- "~/fungalgene/gene_synteny/specie_gene_location_gff/Eel732.gff"
C <- "Eel732_gene_plot.png"


# David ideas for reading multiple files at once
#
#
# First use list.files to find all files ending .gff in the gff directory
# (full.names) means we get the full-path to that gene
# all_files <- list.files("~/fungalgene/gene_synteny/specie_gene_location_gff", pattern="*.gff", full.names=TRUE)
#
# Now read every file in, using lappy to apply the read_gff function to each file name
# all_gffs <- lapply(all_files, read_gff)
#
# finally, combine then all into one big gff (combined) using rbind.data.fame. Note, we are
# using do.call, which takes first a function and thena  list of arguments for that
# function. This is very useful because rbind.data.frame takes any number of data.frames
# as input. And we alreay have a list of all of our gffs as data.frame in all_gffs!
# big_gff <- do.call(rbind.data.frame, all_gffs)


all_files <- list.files("~/fungalgene/gene_synteny/specie_gene_location_gff", pattern="*.gff", full.names=TRUE)
all_gffs <- lapply(all_files, read_gff)
combined <- do.call(rbind.data.frame, all_gffs)
ggplot(combined, aes(xmin=start, xmax=end, y=chr, fill=chr, forward=phase=="+")) +
  geom_gene_arrow() +
  theme_genes() +
  facet_wrap(~ chr, scales = "free", ncol = 1)
ggsave ("~/fungalgene/gene_synteny/plots/all_gene_plot.png")
