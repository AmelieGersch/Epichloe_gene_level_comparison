#Amelie 22/10/19

# grep out gene location from GFF file

mkdir final_genome_gff


# command structure grep -f [spp]gene_ids.txt ../genome_data/[spp]/annotation/[s]].gff3  | grep gene > spp.gff

grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eam_gene_ids.txt ~/fungalgene/genome_data/E.amarillans_NFe708/annotation/Epichloe_amarillans.gff3 | grep gene > ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/Eam.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eel732_gene_ids.txt ~/fungalgene/genome_data/E.elymi_NFe732/annotation/Epichloe_elymi.gff3 | grep gene > ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/Eel732.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eel728_gene_ids.txt ~/fungalgene/genome_data/E.elymi_NFe728/annotation/Epichloe_elymi_728.gff3 | grep gene > ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/Eel728.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Ety_gene_ids.txt ~/fungalgene/genome_data/E.typhina_1756/annotation/Epichloe_typhina_Dg.gff3 | grep gene > ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/Ety.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Ecl_gene_ids.txt ~/fungalgene/genome_data/E.clarkii_1605_22/annotation/Epichloe_clarkii_Hl.gff3 | grep gene > ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/Ecl.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Efe_gene_ids.txt ~/fungalgene/genome_data/E.festucae_Fl1/EfFl1_proteins_annotation_gff_column_name.txt  > ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/Efe.tsv





# create one file with all with, for all specie
# good for the table concatenation
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Efe_gene_ids.txt ~/fungalgene/genome_data/E.festucae_Fl1/EfeFl1_v2.gff3 | grep gene >> ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/all_specie_gff_location.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eam_gene_ids.txt ~/fungalgene/genome_data/E.amarillans_NFe708/annotation/Epichloe_amarillans.gff3 | grep gene >> ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/all_specie_gff_location.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eel728_gene_ids.txt ~/fungalgene/genome_data/E.elymi_NFe728/annotation/Epichloe_elymi_728.gff3 | grep gene >> ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/all_specie_gff_location.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Eel732_gene_ids.txt ~/fungalgene/genome_data/E.elymi_NFe732/annotation/Epichloe_elymi.gff3 | grep gene >> ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/all_specie_gff_location.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Ety_gene_ids.txt ~/fungalgene/genome_data/E.typhina_1756/annotation/Epichloe_typhina_Dg.gff3 | grep gene >> ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/all_specie_gff_location.gff
grep -f ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_select/Ecl_gene_ids.txt ~/fungalgene/genome_data/E.clarkii_1605_22/annotation/Epichloe_clarkii_Hl.gff3 | grep gene >> ~/fungalgene/gene_synteny/Eel728_cluster016/specie_gene_location_gff/all_specie_gff_location.gff
