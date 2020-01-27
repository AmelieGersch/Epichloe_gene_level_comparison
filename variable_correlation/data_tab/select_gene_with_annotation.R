# Amelie 10/12/19

# read the annotation table
annot_tab <- read.table("~/fungalgene/genome_data/E.clarkii_1605_22/annotation/Epichloe_clarkii_Hl.complete_annot.txt",sep="\t", quote='""', header=TRUE)

# check head of data fame : head(annot_tab)
# have the names of column of the data frame : names(annot_tab)

# how many genes have "effector" in the effectorP column
effector_nb <- sum(annot_tab$effectorP=="Effector")
effector_nb

# how many genes have anything other than a blank entry in each of the "MEROPS" "SMCOG" and "CAZy" columns

MEROPS <- sum(annot_tab$MEROPS!="")
MEROPS
SMCOG <- sum(annot_tab$SMCOG!="")
SMCOG
CAZy <- sum(annot_tab$CAZy!="")
CAZy

# same process with :

# annot_tab <- read.table("~/fungalgene/genome_data/E.amarillans_NFe708/annotation/Epichloe_amarillans.annotations.txt",sep="\t", quote='""', header=TRUE)
# annot_tab <- read.table("~/fungalgene/genome_data/E.elymi_NFe732/annotation/Epichloe_elymi.annotations.txt",sep="\t", quote='""', header=TRUE)
annot_tab <- read.table("~/fungalgene/genome_data/E.typhina_1756/annotation/Epichloe_typhina_Dg.complete_annot.txt",sep="\t", quote='""', header=TRUE)
# annot_tab <- read.table("~/fungalgene/genome_data/E.festucae_Fl1/EfFl1_proteins_annotation_gff_column_name.txt",sep="\t", quote='""', header=TRUE)
