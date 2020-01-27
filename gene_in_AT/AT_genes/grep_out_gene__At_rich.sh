# Amelie 20/11/19

# extract, from gene gff file, genes wich are in AT rich (grom AT rich gff file)
cd ~/fungalgene/genome_data/E.clarkii_1605_22/annotation
bedtools intersect -a Epichloe_clarkii_Hl.gff3 -b Ec_AT_rich.gff | less > ~/fungalgene/gene_in_AT/AT_genes/Ecl/AT_gene_gff_combined_Ecl.tsv

cd ~/fungalgene/gene_in_AT/AT_genes/Ecl

# select only line for gene, count these lines
# it gives the number of gene present in At-rich regions
grep -w "gene" AT_gene_gff_combined_Ecl.tsv | wc -l > number_gene_in_AT_Ecl.txt

# same process for other species
cd ~/fungalgene/genome_data/E.elymi_NFe728/annotation
bedtools intersect -a Epichloe_elymi_728.gff3 -b Eel728_AT_rich.gff | less > ~/fungalgene/gene_in_AT/AT_genes/Eel728/AT_gene_gff_combined_Eel728.tsv
cd ~/fungalgene/gene_in_AT/AT_genes/Eel728
grep -w "gene" AT_gene_gff_combined_Eel728.tsv | wc -l > number_gene_in_AT_Eel728.txt

cd ~/fungalgene/genome_data/E.elymi_NFe732/annotation
bedtools intersect -a Epichloe_elymi.gff3 -b Eel732_AT_rich.gff | less > ~/fungalgene/gene_in_AT/AT_genes/Eel732/AT_gene_gff_combined_Eel732.tsv
cd ~/fungalgene/gene_in_AT/AT_genes/Eel732
grep -w "gene" AT_gene_gff_combined_Eel732.tsv | wc -l > number_gene_in_AT_Eel732.txt

cd ~/fungalgene/genome_data/E.typhina_1756/annotation
bedtools intersect -a Epichloe_typhina_Dg.gff3 -b Ety_AT_rich.gff | less > ~/fungalgene/gene_in_AT/AT_genes/Ety/AT_gene_gff_combined_Ety.tsv
cd ~/fungalgene/gene_in_AT/AT_genes/Ety
grep -w "gene" AT_gene_gff_combined_Ety.tsv | wc -l > number_gene_in_AT_Ety.txt

cd ~/fungalgene/genome_data/E.amarillans_NFe708/annotation
bedtools intersect -a Epichloe_amarillans.gff3 -b Eam_AT_rich.gff | less > ~/fungalgene/gene_in_AT/AT_genes/Eam/AT_gene_gff_combined_Eam.tsv
cd ~/fungalgene/gene_in_AT/AT_genes/Eam
grep -w "gene" AT_gene_gff_combined_Eam.tsv | wc -l > number_gene_in_AT_Eam.txt

cd ~/fungalgene/genome_data/E.festucae_Fl1
bedtools intersect -a EfeFl1_v3.gff -b EfeFl1_AT_rich.gff | less > ~/fungalgene/gene_in_AT/AT_genes/Efe/AT_gene_gff_combined_Efe.tsv
cd ~/fungalgene/gene_in_AT/AT_genes/Efe
grep -w "gene" AT_gene_gff_combined_Efe.tsv | wc -l > number_gene_in_AT_Efe.txt
