# Install required packages (run once)
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("limma")

# Load library
library(limma)

# Load proteomics data (replace with your file)
data <- read.csv("proteomics_data.csv", row.names = 1)

# Define groups (edit based on your dataset)
group <- factor(c(rep("Control", 10), rep("Disease", 10)))
design <- model.matrix(~group)

# Normalize data
data <- normalizeBetweenArrays(data)

# Fit model
fit <- lmFit(data, design)
fit <- eBayes(fit)

# Get DEP results
results <- topTable(fit, coef=2, number=Inf)

# Save results
write.csv(results, "DEP_results.csv")

# Volcano plot
png("proteomics_volcano.png")

with(results, plot(logFC, -log10(P.Value),
     pch=20,
     main="Proteomics Volcano Plot",
     xlab="logFC",
     ylab="-log10(p-value)"))

dev.off()

# Show top proteins
head(results)
