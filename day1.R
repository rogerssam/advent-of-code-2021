# 2021 Advent of Code
# Problem 1

input <- read.table("input1.txt")
increasing <- 0
for(i in 2:nrow(input)) {
    if(input$V1[i] > input$V1[i-1]) {
        increasing <- increasing + 1
    }
}
sum(increasing)
