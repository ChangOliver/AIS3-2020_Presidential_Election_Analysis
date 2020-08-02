library(readr)
library(dplyr)
library(jiebaR)
library(tidyr)
library(tidytext)
library(igraph)
library(topicmodels)
library(stringr)
library(ggplot2)
library(tibble)

args <- commandArgs(trailingOnly = TRUE)
date <- args[[1]]

#這邊改input file
posts <- read_csv(paste0("./data/hatePolictic_csv/2019-12/2019-12-", date, ".jsonl.csv"))
#posts <- posts[, colSums(is.na(posts)) != nrow(posts)]
#posts <- posts[rowSums(is.na(posts)) != ncol(posts), ]

comments <- posts[ , grepl( "comments." , names( posts ))  ]
comments <- cbind(comments, posts$canonical_url)
comments <- cbind(comments, posts$title)
col_num <- ncol(comments)
row_num <- nrow(comments)
colnames(comments)[col_num] <- "title"
colnames(comments)[col_num-1] <- "canonical_url"

#empty_col <- NA
#comments <- cbind(comments, empty_col)
#colnames(comments)[col_num+1] <- "comments.724.text"
#comments <- comments[, c(1:4175, 4639, 4176:4638) ]

content <- posts[ , !grepl( "comment" , names( posts ))  ]
content <- content[ , !grepl( "urls" , names( content ))  ]

header <- c("title", "canonical_url", "author", "connect_from", "id", "published_at", "reaction", "text")
comments_reconstruct <- comments[1, c(col_num, col_num-1, 1:6)]
names(comments_reconstruct) <- header

for (j in 1:row_num){
  for (i in seq(1, col_num-2, 6)){
    print(j)
    print(i)
    print(names(comments[j, (i):(i+5)]))
    if (rowSums( is.na( comments[j, c( (i):(i+5)) ] ) ) == 6){
      next
    }
    matrix <- unname( comments[j, c(col_num, col_num-1, (i):(i+5) ) ] )
    names(matrix) <- header
    comments_reconstruct <- rbind(comments_reconstruct, matrix)
  } 
}

comments_reconstructt <- comments_reconstruct[2:nrow(comments_reconstruct), ]

#這邊改output file
write.csv(comments_reconstructt, file=past0("./data/2019-12/2019-12-", date, "_comment.csv"))
write.csv(content, file=paste0("./data/2019-12/2019-12-", date, "_content.csv"))

