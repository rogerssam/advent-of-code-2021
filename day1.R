# 2021 Advent of Code
# Problem 1

input <- read.table("input1.txt")
increasing <- 0
for(i in 2:nrow(input)) {
    if(input$V1[i] > input$V1[i-1]) {
        increasing <- increasing + 1
    }
}


increasing <- 0
for(i in 4:nrow(input)) {
    s1 <- sum(input$V1[(i-1):(i-3)])
    s2 <- sum(input$V1[i:(i-2)])
    if(s2 > s1) {
        increasing <- increasing + 1
    }
}
