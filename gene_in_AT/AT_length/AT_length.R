# Amelie 21/11/19

# obtain the total length of AT rich region, so the size, for each specie

full_AT_length <- function(gff_file){
  row_nb <-nrow(gff_file)
  AT_length <- 0
  for (row in 1:row_nb) {
      start <- gff_file[row,"V4"]
      end <- gff_file[row,"V5"]
      part <- end - start
      message(start,end,part)
      AT_length <- AT_length + part
      }
      print(paste("The total AT-rich length is", AT_length/1e6, "megabase"))
}

# other possibility apply to gff case
# sum(Ecl_gff$V5-Ecl_gff$V4)

Ecl_gff <- read.table("~/fungalgene/genome_data/E.clarkii_1605_22/annotation/Ec_AT_rich.gff")
full_AT_length(Ecl_gff)

Eel728_gff <- read.table("~/fungalgene/genome_data/E.elymi_NFe728/annotation/Eel728_AT_rich.gff")
full_AT_length(Eel728_gff)

Eel732_gff <- read.table("~/fungalgene/genome_data/E.elymi_NFe732/annotation/Eel732_AT_rich.gff")
full_AT_length(Eel732_gff)

Ety_gff <- read.table("~/fungalgene/genome_data/E.typhina_1756/annotation/Ety_AT_rich.gff")
full_AT_length(Ety_gff)

Efe_gff <- read.table("~/fungalgene/genome_data/E.festucae_Fl1/EfeFl1_AT_rich.gff")
full_AT_length(Efe_gff)

Eam_gff <- read.table("~/fungalgene/genome_data/E.amarillans_NFe708/annotation/Eam_AT_rich.gff")
full_AT_length(Eam_gff)
