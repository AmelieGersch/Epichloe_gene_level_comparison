#Amelie 09/10/19

#change protein ortho file format : not 3 columns but one line per gene
#David's command from gitub

library(stringr)

flatten_ortho <- function(spp_col, ortho_col, spp_name){
    keepers <- !grepl("\\*", spp_col) # asterisk means no gene for this spp
    genes <- spp_col[keepers]
    og <- ortho_col[keepers]
    n <- str_count(genes, ",") + 1
    if (any(n > 1)){ #some orthos with more than one copy
        genes <- unlist(str_split(genes, ","))
        og <- rep(og,n)
    }
    data.frame( ortho_group = og, gene_id = genes, spp = spp_name)
}

process_ortho_file <- function(ortho_df){
    group <- sprintf("og_%04d", 1:nrow(ortho_df))
    spp_cols <- 4:ncol(ortho_df)
    spp_names <- sapply(str_split(ortho_df[1,spp_cols], "_"), "[[", 1) #hard-coded as locus tag!
    per_gene <- lapply(4:ncol(ortho_df), function(i) {
          flatten_ortho(ortho_df[,i], ortho_col = group, spp_name = spp_names[[i-3]])
    })
    do.call(rbind.data.frame, per_gene)
}

ortho_table <- read.table("Eam_Ecl_Efe_Ety_Eel728_Eel732.proteinortho", stringsAsFactors=FALSE)


# OLD WAY THAT DIDN"T WORK
#
# knitr::kable is a function for pritning tables nicely. Was used in wiki example to print the
# but we really want only the reslts of "process_ortho_file(ortho_table)", not the other function
# applied to it.
#tab <- knitr::kable(head(process_ortho_file(ortho_table)))

ortho_long <- process_ortho_file(ortho_table)

#can be written out with write.table, readr::write_file or similar.

#tab <- knitr::kable(process_ortho_file(ortho_table))
