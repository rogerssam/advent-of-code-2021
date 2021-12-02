# 2021 Advent of Code
# Day 1

input <- scan("input1.txt")

# Problem 1
# First solution
increasing <- 0
for(i in 2:length(input)) {
    if(input[i] > input[i-1]) {
        increasing <- increasing + 1
    }
}

# Vectorised solution
sum(c(input, NA) > c(NA, input), na.rm = T)

# Problem 2
# First solution
increasing <- 0
for(i in 4:length(input)) {
    s1 <- sum(input[(i-1):(i-3)])
    s2 <- sum(input[i:(i-2)])
    if(s2 > s1) {
        increasing <- increasing + 1
    }
}

# Vectorised solution
sums <- rowSums(data.frame(c(NA, NA, input), c(NA, input, NA), c(input, NA, NA)))
sum(c(sums, NA) > c(NA, sums), na.rm = T)
