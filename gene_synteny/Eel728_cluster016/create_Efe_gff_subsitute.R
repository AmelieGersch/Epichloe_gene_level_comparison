#Amelie 06/11/19

# use EfFl1_proteins_annotation.txt for Efe
# because we don't have a gff file for Efe
#same in information in this file


Efe_prot <- read.table("~/fungalgene/genome_data/E.festucae_Fl1/EfFl1_proteins_annotation.txt", sep="\t", quote="'", header=1)

# change Efe_prot column name
# for have the same column name as in other gff file

library("dplyr")

Efe_prot_good_name <- Efe_prot %>%
  rename(
    phase = Strand,
    ID = GeneID
    )


# save this table for use latter with grep
write.table(Efe_prot_good_name, file="~/fungalgene/genome_data/E.festucae_Fl1/EfFl1_proteins_annotation_gff_column_name.txt")


# sub command fail
# Efe_prot <- sub(Strand, phase, Efe_prot)
# Efe_prot <- sub(GeneID, ID, Efe_prot)
