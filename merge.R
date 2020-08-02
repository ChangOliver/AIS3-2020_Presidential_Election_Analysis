library(data.table)
file_list <- list.files("./data/", pattern = "*_content.csv")

content <- read_csv(file_list[1])
content$date <- substr(file_list[1], 1, 10)

for (i in 2:length(file_list)){
  tempf <- read_csv(file_list[i])
  tempf$date <- substr(file_list[i], 1, 10)
  content <- rbind(content, tempf)
}

file_list <- list.files("./data/", pattern = "*_comment.csv")

comment <- read_csv(file_list[1])
comment$date <- substr(file_list[1], 1, 10)

for (i in 2:length(file_list)){
  tempf <- read_csv(file_list[i])
  tempf$date <- substr(file_list[i], 1, 10)
  comment <- rbind(comment, tempf)
}

content <- content[, 2:length(content)]
comment <- comment[, 2:length(comment)]
names(content)[names(content) == "author"] <- "poster"
names(comment)[names(comment) == "author"] <- "commenter"

write.csv(comment, file="./data/12_comment.csv")
write.csv(content, file="./data/12_content.csv")
