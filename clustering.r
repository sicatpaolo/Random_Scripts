library(plyr)
library(dplyr)
library(ggplot2)
library(reshape2)
library(tidyverse)
setwd("/Users/juanpaolosicat/Desktop/Master/New_files/Clustering_Unknown/CLUSTERING_THE_UNKNOWN/clustering/Rscripts")
setwd("/rhome/seseal/bigdata/RepeatMasker/Finalset/CLEANED-04062019/CLUSTERING_THE_UNKNOWN/clustering/Rscripts")
Whitefly_Clusters <- read.csv(file="../Whitefly/Whitefly.cluster.uc", sep="\t", header = FALSE)
NonWhitefly_Clusters <- read.csv(file="../NonWhitefly/NonWhitefly.cluster.uc", sep="\t", header = FALSE)
colnames(Whitefly_Clusters) <- c("Record_Type", "Cluster_Number","Sequence_Length","per_identity","strand","ignore_1","ignore_2","Compressed_Alignement", "Query", "Target")
colnames(NonWhitefly_Clusters) <- c("Record_Type", "Cluster_Number","Sequence_Length","per_identity","strand","ignore_1","ignore_2","Compressed_Alignement", "Query", "Target")
Whitefly_Clusters_H <- Whitefly_Clusters %>% filter(Whitefly_Clusters$Record_Type == "H")
NonWhitefly_Clusters_H <- NonWhitefly_Clusters %>% filter(NonWhitefly_Clusters$Record_Type == "H")
Cluster_Count_Whitefly <- Whitefly_Clusters_H %>% group_by(Cluster_Number) %>% tally(sort = TRUE)
Cluster_Count_NonWhitefly <- NonWhitefly_Clusters_H %>% group_by(Cluster_Number) %>% tally(sort = TRUE)

Keep_this_column <- c("Cluster_Number","n","Sequence_Length","per_identity","strand", "Compressed_Alignement", "Query", "Target")
WF_worktable <- merge(Whitefly_Clusters_H,Cluster_Count_Whitefly, by.y = c("Cluster_Number"))
WF_worktable <- WF_worktable[Keep_this_column]
NonWF_worktable <- merge(NonWhitefly_Clusters_H,Cluster_Count_NonWhitefly, by.y = c("Cluster_Number"))
NonWF_worktable <- NonWF_worktable[Keep_this_column]

#Count number of times a central sequence appeared
search_result <- WF_worktable %>% group_by(WF_worktable$Target) %>% tally(sort = TRUE)
View(search_result)

ALL_EARL <- WF_worktable %>% filter(str_detect(WF_worktable$Target, "_EARL"))
ALL_SSA1 <- WF_worktable %>% filter(str_detect(WF_worktable$Target, "_SSA1"))
ALL_newSSA1 <- WF_worktable %>% filter(str_detect(WF_worktable$Target, "_newSSA1"))
ALL_MEAM <- WF_worktable %>% filter(str_detect(WF_worktable$Target, "_MEAM"))
ALL_MEDQ <- WF_worktable %>% filter(str_detect(WF_worktable$Target, "_MEDQ"))

#Helps to get a count of number of clusters that appeared while removing duplicates
search_result <- ALL_MEAM %>% group_by(Cluster_Number) %>% summarise(count=n())
search_result <- WF_worktable %>% group_by(Cluster_Number) %>% summarise(count=n())



Work_table <- merge(run,length_of_library, by.y = c("NAMEOFCLUSTER"))
Unique_Ids_RepeatType <- count(masterlist_nolessthan80, 'REPEATTYPE')
Unique_Ids_Cluster <- count(masterlist_unEDITED, 'NAMEOFCLUSTER') #Use to identify which specific cluster has the most number of hits
finer_search_result <- search_result %>% filter(search_result$REPEATTYPE == "DNA/EnSpm/CACTA", search_result$Origin == "MCIT02")
