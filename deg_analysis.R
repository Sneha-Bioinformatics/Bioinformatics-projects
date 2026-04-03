# Simple DEG-style workflow (demo)

genes <- paste0("Gene", 1:100)
control <- rnorm(100, mean=5, sd=1)
treated <- rnorm(100, mean=6, sd=1)

data <- data.frame(genes, control, treated)

data$logFC <- log2(data$treated / data$control)

head(data)

plot(data$logFC, main="Log Fold Change", ylab="logFC")
