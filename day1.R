# 2021 Advent of Code
# Problem 1

input <- read.table("input1.txt")

# First solution
increasing <- 0
for(i in 2:nrow(input)) {
    if(input$V1[i] > input$V1[i-1]) {
        increasing <- increasing + 1
    }
}

# Vectorised solution
sum(c(input$V1, NA) > c(NA, input$V1), na.rm = T)

# First solution
increasing <- 0
for(i in 4:nrow(input)) {
    s1 <- sum(input$V1[(i-1):(i-3)])
    s2 <- sum(input$V1[i:(i-2)])
    if(s2 > s1) {
        increasing <- increasing + 1
    }
}

# Vectorised solution
sums <- rowSums(data.frame(c(NA, NA, input$V1), c(NA, input$V1, NA), c(input$V1, NA, NA)))
sum(c(sums, NA) > c(NA, sums), na.rm = T)
