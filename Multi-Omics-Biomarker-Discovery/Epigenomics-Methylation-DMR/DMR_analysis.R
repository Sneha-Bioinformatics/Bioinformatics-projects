# Install packages (run once)
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("limma", "edgeR"))

# Load libraries
library(limma)

# Load data (example placeholder)
# Replace with your methylation dataset
data <- read.csv("methylation_data.csv", row.names = 1)

# Create groups (EDIT according to your data)
group <- factor(c(rep("Control", 10), rep("Disease", 10)))
design <- model.matrix(~group)

# Normalize data
data <- normalizeBetweenArrays(data)

# Fit linear model
fit <- lmFit(data, design)
fit <- eBayes(fit)

# Get DMR results
results <- topTable(fit, coef=2, number=Inf)

# Save results
write.csv(results, "DMR_results.csv")

# Volcano plot
png("methylation_volcano.png")

with(results, plot(logFC, -log10(P.Value),
     pch=20,
     main="Methylation Volcano Plot",
     xlab="logFC",
     ylab="-log10(p-value)"))

dev.off()

# Print top results
head(results)
