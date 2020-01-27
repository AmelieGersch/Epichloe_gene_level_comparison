# Amelie 15/11/19

# merge tab 1 and tab 2

# tab1
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

all_gff <- read_gff("all_specie_gff_location_1.gff")

#tab2
flatten_ortho <- function(spp_col, ortho_col, spp_name){
    keepers <- !grepl("\\*", spp_col) # asterisk means no gene for this spp
    genes <- spp_col[keepers]
    og <- ortho_col[keepers]
    n <- str_count(genes, ",") + 1
    if (any(n > 1)){ #some orthos with more than one copy
        genes <- unlist(str_split(genes, ","))
        og <- rep(og,n)
    }
    data.frame( ortho_group = og, gene_id = genes, spp = spp_name)
}

process_ortho_file <- function(ortho_df){
    group <- sprintf("og_%04d", 1:nrow(ortho_df))
    spp_cols <- 4:ncol(ortho_df)
    spp_names <- sapply(str_split(ortho_df[1,spp_cols], "_"), "[[", 1) #hard-coded as locus tag!
    per_gene <- lapply(4:ncol(ortho_df), function(i) {
          flatten_ortho(ortho_df[,i], ortho_col = group, spp_name = spp_names[[i-3]])
    })
    do.call(rbind.data.frame, per_gene)
}

ortho_table <- read.table("~/fungalgene/protein_ortho/Eam_Ecl_Efe_Ety_Eel728_Eel732.proteinortho", stringsAsFactors=FALSE)
ortho_long <- process_ortho_file(ortho_table)

#remove "-T1" tag from gene_id because this tag isn't in the other tab
remove_tag <- function(gene_id){
    str_remove(gene_id, "-T1")
}
ortho_long$gene_id <- remove_tag(ortho_long$gene_id)

# concatenate these 2 tab
a <- merge(all_gff, ortho_long, by.x="ID", by.y="gene_id")
write.table(a, "~/fungalgene/ortho_gff_tab/Ety_cluster/ortho_gff_combined_1.csv")


# create the plot with all specie and outpout ortho_group
library(stringr)
library(ggplot2)
library(gggenes)

ggplot(a, aes(xmin=start, xmax=end, y=chr, fill=ortho_group, forward=phase=="+")) +
  geom_gene_arrow() +
  theme_genes() +
  facet_wrap(~ chr, scales = "free", ncol = 1)
ggsave ("~/fungalgene/ortho_gff_tab/Ety_cluster/ortho_gff_combined_plot_1.svg")

# plot just for Efe
Efe_tab <- read.table("~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/Efe.tsv")
Efe_and_ortho <- merge(Efe_tab, ortho_long, by.x="V2", by.y="gene_id")
write.table(Efe_and_ortho, "~/fungalgene/ortho_gff_tab/Ety_cluster/ortho_Efe_combined_1.csv")
ggplot(Efe_and_ortho, aes(xmin=V5, xmax=V6, y=V4, fill=ortho_group, forward=V7=="+")) +
  geom_gene_arrow() +
  theme_genes()
ggsave ("~/fungalgene/ortho_gff_tab/Ety_cluster/Efe_ortho_gff_combined_plot_1.png")
