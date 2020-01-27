# Amelie 15/11/19

# grep out gene location from GFF file

grep -f ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Eam_gene.txt ~/fungalgene/genome_data/E.amarillans_NFe708/annotation/Epichloe_amarillans.gff3 | grep gene >> ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/all_specie_gff_location_1.gff
grep -f ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Eel732_gene.txt ~/fungalgene/genome_data/E.elymi_NFe732/annotation/Epichloe_elymi.gff3 | grep gene >> ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/all_specie_gff_location_1.gff
grep -f ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Eel728_gene.txt ~/fungalgene/genome_data/E.elymi_NFe728/annotation/Epichloe_elymi_728.gff3 | grep gene >> ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/all_specie_gff_location_1.gff
grep -f ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Ety_gene.txt ~/fungalgene/genome_data/E.typhina_1756/annotation/Epichloe_typhina_Dg.gff3 | grep gene >> ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/all_specie_gff_location_1.gff
grep -f ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Ecl_gene.txt ~/fungalgene/genome_data/E.clarkii_1605_22/annotation/Epichloe_clarkii_Hl.gff3 | grep gene >> ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/all_specie_gff_location_1.gff
grep -f ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Efe_gene.txt ~/fungalgene/genome_data/E.festucae_Fl1/EfeFl1_v2.gff3 | grep gene >> ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/all_specie_gff_location_1.gff



grep -f ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_select/Efe_gene.txt ~/fungalgene/genome_data/E.festucae_Fl1/EfFl1_proteins_annotation_gff_column_name.txt  > ~/fungalgene/gene_synteny/Ety_cluster/specie_gene_location_gff/Efe_1.tsv
