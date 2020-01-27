#Amelie 22/10/19


# Eel728_gene_ids.txt is the list of gene from our cluster (obtain with Python from the cluster file)
# we select this one in each specie in the protein ortho file
# V8 is the column for Eel728

ortho<-read.table("Eam_Ecl_Efe_Ety_Eel728_Eel732.proteinortho")
gene_list<-read.table("Eel728_gene_ids.txt")
#add "-T1" for have the same structure between these 2 files
gene_list = paste0(gene_list$V1, "-T1")
#select gene from V8 colunm from ortho which are in the cluster
in_gene_list <- ortho$V8 %in% gene_list
#apply the selection of Eel728 cluster at all ortho file, select good gene for all species
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
Ety <- remove_asterisk(orthologs_of_interest$V9)


# sub command structure
#sub(pattern, replacement, x)
Efe <- sub("-T1","",Efe)
Eam <- sub("-T1","",Eam)
Ecl <- sub("-T1","",Ecl)
Eel732 <- sub("-T1","",Eel732)
Ety <- sub("-T1","",Ety)


#save gene list by specie
write_gene_list <- function(orthologs_of_interest, filename){
  write.table(orthologs_of_interest, col.names=FALSE, row.names=FALSE, quote=FALSE, file=filename)
}
write_gene_list(Efe,"~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Efe_gene_ids.txt")
write_gene_list(Eam,"~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eam_gene_ids.txt")
write_gene_list(Ecl,"~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Ecl_gene_ids.txt")
write_gene_list(Eel732,"~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eel732_gene_ids.txt")
write_gene_list(Ety,"~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Ety_gene_ids.txt")

#then grep out gene location with "grep_out_gene_location.sh" command in the terminal
