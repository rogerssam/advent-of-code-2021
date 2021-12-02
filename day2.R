# 2021 Advent of Code
# Day 2

input <- read.delim("input2.txt", header = F, sep = " ")

# Problem 1
# Initial solution
horizontal <- 0
depth <- 0
for(i in 1:nrow(input)) {
    if(input$V1[i] == "forward") {
        horizontal <- horizontal + input$V2[i]
    }
    else if(input$V1[i] == "down") {
        depth <- depth + input$V2[i]
    }
    else if(input$V1[i] == "up") {
        depth <- depth - input$V2[i]
    }
}
horizontal * depth

# Vectorised solution
sum(input$V2[input$V1=="forward"]) * (sum(input$V2[input$V1=="down"])-sum(input$V2[input$V1=="up"]))

# Part 2
# Initial solution
horizontal <- 0
depth <- 0
aim <- 0
for(i in 1:nrow(input)) {
    if(input$V1[i] == "forward") {
        horizontal <- horizontal + input$V2[i]
        depth <- depth + aim*input$V2[i]
    }
    else if(input$V1[i] == "down") {
        aim <- aim + input$V2[i]
    }
    else if(input$V1[i] == "up") {
        aim <- aim - input$V2[i]
    }
}
horizontal * depth

# Vectorised solution
input$V2[input$V1=="up"] <- -1*input$V2[input$V1=="up"]
depth <- cumprod(cumsum(input$V2[input$V1=="up" | input$V1=="down"]) * input$V2[input$V1=="forward"])



