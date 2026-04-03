# Install packages (run once)
install.packages("BiocManager")
BiocManager::install(c("limma", "GEOquery", "pheatmap"))

# Load libraries
library(GEOquery)
library(limma)
library(pheatmap)

# Load dataset (example: GSE93272)
gset <- getGEO("GSE93272", GSEMatrix = TRUE)
expr <- exprs(gset[[1]])

# Create sample groups (EDIT based on dataset)
group <- factor(c(rep("Control", 10), rep("Disease", 10)))

design <- model.matrix(~group)

# Normalize data
expr <- normalizeBetweenArrays(expr)

# Fit model
fit <- lmFit(expr, design)
fit <- eBayes(fit)

# Get results
results <- topTable(fit, coef=2, number=Inf)

# Save results
write.csv(results, "DEG_results.csv")

# Volcano plot
logFC <- results$logFC
pval <- results$P.Value

plot(logFC, -log10(pval),
     pch=20, main="Volcano Plot",
     xlab="logFC", ylab="-log10(p-value)")

# Heatmap (top genes)
top_genes <- rownames(results)[1:50]
pheatmap(expr[top_genes, ])
