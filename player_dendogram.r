library(readr)
library(dplyr)
library(ggplot2)
    

# 2009 - 2010, 300 players
Tp_player <- read_xlsx("QuantHockey_2009-2010.xlsx")
stats <- select(Tp_player, -1:-4)
rownames(stats) <- Tp_player$Name
#plot1 <- plot(Tp_player$`G/GP`, Tp_player$`A/GP`, col = "red", xlab = "Goals per Games Played", ylab = "Assists per Game Played")

#2022-2023, 300 players
up_player <- read_xlsx("QuantHockey_2022-2023.xlsx")
stats2 <- select(up_player, -1:-4)
rownames(stats2) <- up_player$Name
#plot2 <- plot(up_player$`G/GP`, up_player$`A/GP`, col = "green", xlab = "Goals per Games Played", ylab = "Assists per Game Played")


# top player dendrogram
dist_mat <- dist(stats)
hclust_result <- hclust(dist_mat, method = "ward.D")

plot(hclust_result, labels = Tp_player$Name, main = "Top Players Dendrogram")

clusters <- cutree(hclust_result, k = 5)
rect.hclust(hclust_result, k =5) # groups

Tp_player$Cluster <- clusters

print(Tp_player)  # shows new data set with cluster column

print_clusters <- function(data, groups, columns) {
  groupedD <- split(data, groups)
  lapply(groupedD, 
         function(df) df[, columns])
}
cols_to_print <- wrapr::qc(Name, G/GP, A/GP, P/GP)
print_clusters(Tp_player, clusters, cols_to_print)

#up coming player dendrogram
dist_mat2 <- dist(stats2)
hclust_result2 <- hclust(dist_mat, method = "ward.D")

plot(hclust_result2, labels = up_player$Name, main = "Upcoming Players Dendrogram")

clusters2 <- cutree(hclust_result2, k = 5)
rect.hclust(hclust_result2, k =5) #groups

up_player$Cluster <- clusters2

print(up_player) # shows new data set with cluster column

cols_to_print <- wrapr::qc(Name, G/GP, A/GP, P/GP)
print_clusters(up_player, clusters, cols_to_print)



