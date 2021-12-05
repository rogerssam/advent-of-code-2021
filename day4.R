# 2021 Advent of Code
# Day 4

calls <- scan("input4.txt", sep = ",", nlines = 1)
boards <- read.delim("input4.txt", header = F, skip = 2)
boards$V1 <- gsub("  ", " ", boards$V1)
boards <- tidyr::separate(boards, 1, sep = " ", into = paste0("V", 1:5))

i <- 1
while(length(x)>0) {
    boards[[i]] <- x[1:5]
    x <- x[-1:-6]
    i <- i+1
}
# boards <- read.delim("input4.txt", header = F, skip = 2)
# boards <- strsplit(boards$V1, split = " ")
# boards <- lapply(boards, as.numeric)
# boards <- lapply(boards, function(x) x[!is.na(x)])

# for(i in nrow(boards):1) {

}

# Problem 1

