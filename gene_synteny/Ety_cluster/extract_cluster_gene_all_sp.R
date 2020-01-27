# Amelie 15/11/19

# Ety_cluster_gene.txt is a file with the list of gene from the cluster
# select these gene for all species
# V9 is the column for Ety in proteinorhto file

ortho<-read.table("Eam_Ecl_Efe_Ety_Eel728_Eel732.proteinortho")
gene_list<-read.table("Ety_cluster_gene.txt")
#add "-T1" for have the same structure between these 2 files
gene_list = paste0(gene_list$V1, "-T1")
#select gene from V9 colunm from ortho which are in the cluster
in_gene_list <- ortho$V9 %in% gene_list
#apply the selection of Ety cluster at all ortho file, select good gene for all species
orthologs_of_interest <- ortho[in_gene_list, ]

remove_asterisk <- function(column_of_interest){
  x <- column_of_interest
  is_gene <- x != "*"
  x[is_gene]
}
Efe <- remove_asterisk(orthologs_of_interest$V4)
Eam <- remove_asterisk(orthologs_of_interest$V5)
Ecl <- remove_asterisk(orthologs_of_interest$V6)
Eel732 <- remove_asterisk(orthologs_of_interest$V7)
Eel728 <- remove_asterisk(orthologs_of_interest$V8)

# sub command structure
#sub(pattern, replacement, x)
Efe <- sub("-T1","",Efe)
Eam <- sub("-T1","",Eam)
Ecl <- sub("-T1","",Ecl)
Eel732 <- sub("-T1","",Eel732)
Eel728 <- sub("-T1","",Eel728)

#save gene list by specie
write_gene_list <- function(orthologs_of_interest, filename){
  write.table(orthologs_of_interest, col.names=FALSE, row.names=FALSE, quote=FALSE, file=filename)
}
write_gene_list(Efe,"~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Efe_gene.txt")
write_gene_list(Eam,"~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Eam_gene.txt")
write_gene_list(Ecl,"~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Ecl_gene.txt")
write_gene_list(Eel732,"~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Eel732_gene.txt")
write_gene_list(Eel728,"~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Eel728_gene.txt")

#then grep out gene location with "grep_out_gene_location.sh" command in the terminal
