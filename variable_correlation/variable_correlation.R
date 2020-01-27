# Amelie 07/01/2020

library(ape)
library(nlme)
library(geiger)
library(phylogram)

# read variable/species table
dataa <- read.csv("~/fungalgene/variable_correlation/data_tab/variable_table.csv", header=TRUE, row.names=1)

# read tree in Newick format
tree <-read.tree("~/fungalgene/variable_correlation/guide_tree_1.tr")

# HACK SOLUTION FOR NOW, FIX THIS BEFORE FINISHING
# astral trees have undefined terminal branch lengths, which breaks gls
# for now, replace missing lengths with very small non-zero number
# REAL SOLUTION: get tree with terminal branch lengths estimated from sequence
# data (David's job)
tree$edge.length[is.nan(tree$edge.length)] <- 1e-10


# in tree, in row 1 :
# strain = strain
# Atgene = number of gene in AT-rich regions
# genome_len = genome length (Mb)
# genes_len = genes length (Mb)
# AT_len = AT-rich regions length (Mb)
# GC_len = GC rest (Mb)
# Effector = number of gene efffectorP=Effector
# MEROPS = number of gene with annotation in MEROPS
# SMCOG = number of gene with annotation in SMCOG
# CAZy = number of gene with annotation in CAZy

# check tree and matrix information match
check <- name.check(tree, dataa)
check                #return "OK", validate for next steps

# Atgene VS genome_len
lambda <- corPagel(1, tree)
model1 <- gls(Atgene~genome_len, data=dataa, correlation=lambda)
summary(model1)

# Atgene VS genes_len
lambda <- corPagel(1, tree)
model2 <- gls(Atgene~genes_len, data=dataa, correlation=lambda)
summary(model2)

# Atgene VS AT_len
lambda <- corPagel(1, tree)
model3 <- gls(Atgene~AT_len, data=dataa, correlation=lambda)
summary(model3)

# Atgene VS GC_len
lambda <- corPagel(1, tree)
model4 <- gls(Atgene~GC_len, data=dataa, correlation=lambda)
summary(model4)

# Atgene VS Effector
lambda <- corPagel(1, tree)
model5 <- gls(Atgene~Effector, data=dataa, correlation=lambda)
summary(model5)

# Atgene VS MEROPS
lambda <- corPagel(1, tree)
model6 <- gls(Atgene~MEROPS, data=dataa, correlation=lambda)
summary(model6)

# Atgene VS SMCOG
lambda <- corPagel(1, tree)
model7 <- gls(Atgene~SMCOG, data=dataa, correlation=lambda)
summary(model7)

# Atgene VS CAZy
lambda <- corPagel(1, tree)
model8 <- gls(Atgene~CAZy, data=dataa, correlation=lambda)
summary(model8)








# with only full variables (without annotation values)
library(ape)
library(nlme)
library(geiger)
library(phylogram)
dataa <- read.csv("~/fungalgene/variable_correlation/data_tab/full_variable_table.csv", header=TRUE, row.names=1)
tree <-read.tree("~/fungalgene/variable_correlation/guide_tree_1.tr")
tree$edge.length[is.nan(tree$edge.length)] <- 1e-10
check <- name.check(tree, dataa)
check

# Atgene VS genome_len
lambda <- corPagel(1, tree)
model1 <- gls(Atgene~genome_len, data=dataa, correlation=lambda)
summary(model1)

# Atgene VS genes_len
lambda <- corPagel(1, tree)
model2 <- gls(Atgene~genes_len, data=dataa, correlation=lambda)
summary(model2)

# Atgene VS AT_len
lambda <- corPagel(1, tree)
model3 <- gls(Atgene~AT_len, data=dataa, correlation=lambda)
summary(model3)

# Atgene VS GC_len
lambda <- corPagel(1, tree)
model4 <- gls(Atgene~GC_len, data=dataa, correlation=lambda)
summary(model4)

# genome_len VS genes_len
lambda <- corPagel(1, tree)
model5 <- gls(genome_len~genes_len, data=dataa, correlation=lambda)
summary(model5)

# genome_len VS AT_len
lambda <- corPagel(1, tree)
model6 <- gls(genome_len~AT_len, data=dataa, correlation=lambda)
summary(model6)

# genome_len VS GC_len
lambda <- corPagel(1, tree)
model7 <- gls(genome_len~GC_len, data=dataa, correlation=lambda)
summary(model7)

# genes_len VS AT_len
lambda <- corPagel(1, tree)
model8 <- gls(genes_len~AT_len, data=dataa, correlation=lambda)
summary(model8)

# genes_len VS GC_len
lambda <- corPagel(1, tree)
model9 <- gls(genes_len~GC_len, data=dataa, correlation=lambda)
summary(model9)

# AT_len VS GC_len
lambda ,_ corPagel(1, tree)
model10 <- gls(AT_len~GC_len, data=dataa, correlation=lambda)
summary(model10)
