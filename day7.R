# 2021 Advent of Code
# Day 7

input <- scan("input7.txt", sep = ",")

# Part 1
sum(abs(input-median(input)))

# Part 2
m <- floor(mean(input))
cost <- rep(0, 1000)
for (i in 1:length(input)){
    dist <- abs(input[i] - m)
    cost[i] <- sum(seq(1:dist))
}
sum(cost)
