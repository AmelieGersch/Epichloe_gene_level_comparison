# Amelie 21/11/19

# obtain the total length of genes, for each species
# thanks you gff file

full_gene_length <- function(gff_file){
  a <-subset(gff_file, V3 == "gene")  # select only gene lines
  b <-sum(a$V5-a$V4)
  print(paste("The total genes length is", b/1e6, "megabase"))
}

Ecl_gff <- read.table("~/fungalgene/genome_data/E.clarkii_1605_22/annotation/Epichloe_clarkii_Hl.gff3",quote='"', sep="\t")
full_gene_length(Ecl_gff)
Eel728_gff <- read.table("~/fungalgene/genome_data/E.elymi_NFe728/annotation/Epichloe_elymi_728.gff3",quote='"', sep="\t")
full_gene_length(Eel728_gff)
Eel732_gff <- read.table("~/fungalgene/genome_data/E.elymi_NFe732/annotation/Epichloe_elymi.gff3",quote='"', sep="\t")
full_gene_length(Eel732_gff)
Ety_gff <- read.table("~/fungalgene/genome_data/E.typhina_1756/annotation/Epichloe_typhina_Dg.gff3",quote='"', sep="\t")
full_gene_length(Ety_gff)
Eam_gff <- read.table("~/fungalgene/genome_data/E.amarillans_NFe708/annotation/Epichloe_amarillans.gff3",quote='"', sep="\t")
full_gene_length(Eam_gff)
Efe_gff <- read.table("~/fungalgene/genome_data/E.festucae_Fl1/EfeFl1_v3.gff",quote='"', sep="\t")
full_gene_length(Efe_gff)
