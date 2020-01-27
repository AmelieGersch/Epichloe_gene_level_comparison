For two differents clusters

We confront the ortholgous data (protein proteinortho) with the gff file (position of all gene)
The goal is to obtains the position of each cluster genes in each stain

extract_gene_list.R and extract_cluster_gene_all_sp.R :
select gene from the cluster in all strains thanks to proteinotho result

grep_out_gene_location.sh and create_cluster_file.sh :
confront previous selected gene with gff file (genes positions in the genome)


