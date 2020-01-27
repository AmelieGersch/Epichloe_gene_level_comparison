#Amelie 01/10/19

#command structure :
#proteinortho [OPTION] FASTA1 FASTA2 [FASTA...]
#options :
#-project=  prefix for all result file names [default: myproject]
#-temp=temp_file   path to the temporary files

mkdir temp_file

#for all genomes in the same time
proteinortho5 -project=Eam_Ecl_Efe_Ety_Eel728_Eel732 ~/fungalgene/genome_data/E.amarillans_NFe708/annotation/Epichloe_amarillans.proteins.fa ~/fungalgene/genome_data/E.clarkii_1605_22/annotation/Epichloe_clarkii_Hl.proteins.fa ~/fungalgene/genome_data/E.festucae_Fl1/EfFl1_proteins.faa ~/fungalgene/genome_data/E.typhina_1756/annotation/Epichloe_typhina_Dg.proteins.fa ~/fungalgene/genome_data/E.elymi_NFe728/annotation/Epichloe_elymi_728.proteins.fa ~/fungalgene/genome_data/E.elymi_NFe732/annotation/Epichloe_elymi.proteins.fa

#change file format : not 3 columns but one line per gene
#David's command from gitub
Rscript proteinortho_file_gene_line.R
