# 2021 Advent of Code
# Day 4
library(tidyr)
calls <- scan("input4.txt", sep = ",", nlines = 1)
boards <- read.delim("input4.txt", header = F, skip = 2)
boards$V1 <- gsub("  ", " ", boards$V1)
boards <- separate(boards, 1, sep = " ", into = paste0("col", 1:5), convert = T)
boards$board <- rep(1:100, each = 5)
boards$row <- rep(1:5, times = 100)
boards <- boards %>% pivot_longer(cols = starts_with("col"), names_to = "col", names_prefix = "col", values_to = "number", values_transform = list(number = as.numeric))
boards2 <- boards

for(i in calls) {
    boards$number[boards$number==i] <- NA
    for(j in 1:100) {
        # board j
        m <- matrix(boards$number[boards$board == j], nrow = 5, byrow = T)
        rows <- apply(m, 1, FUN = function(x) {all(is.na(x))})
        columns <- apply(m, 2, FUN = function(x) {all(is.na(x))})
        if(any(rows) | any(columns)) {
            break
        }
    }
    if(any(rows) | any(columns)) {
        print(sum(m, na.rm = T)*i)
        break
    }
}


# Part 2
boards2 <- boards
for(i in 1:100) {
    boards2$number[boards2$number==calls[i]] <- NA
    for(j in 1:100) {
        # board j
        m <- matrix(boards2$number[boards2$board == j], nrow = 5, byrow = T)
        rows <- apply(m, 1, FUN = function(x) {all(is.na(x))})
        columns <- apply(m, 2, FUN = function(x) {all(is.na(x))})
        if(all(!rows) & all(!columns)) {
            hasnt_won <- j
            final_board <- m
            next_val <- calls[i+1]
            break
        }
    }
}
(sum(final_board, na.rm = T)-next_val)*next_val
