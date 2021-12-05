# 2021 Advent of Code
# Day 3

input <- read.fwf("input3.txt", widths = rep(1, 12))

# Problem 1
# Initial solution
gamma <- strtoi(paste0(round(colMeans(input), 0), collapse = ""), base = 2)
epsilon <- strtoi(paste0(as.numeric(!round(colMeans(input), 0)), collapse = ""), base = 2)
gamma*epsilon

# Part 2
# For each column, determine the most common value
# Filter to those values
# If one value remaining, stop
# Else move to next column, repeat

O_values <- input
C_values <- input

for(i in 1:12) {
    n_1 <- sum(O_values[,i]==1)
    n_0 <- sum(O_values[,i]==0)
    mc <- ifelse(n_1>=n_0, 1, 0)
    if(nrow(O_values)>1) {
        O_values <- subset(O_values, O_values[,i]==mc)
    }
}
oxygen <- strtoi(paste0(O_values[1,], collapse = ""), base = 2)

for(i in 1:12) {
    n_1 <- sum(C_values[,i]==1)
    n_0 <- sum(C_values[,i]==0)
    lc <- ifelse(n_1>=n_0, 0, 1)
    if(nrow(C_values)>1) {
        C_values <- subset(C_values, C_values[,i]==lc)
    }
}

co2 <- strtoi(paste0(C_values[1,], collapse = ""), base = 2)
oxygen*co2
