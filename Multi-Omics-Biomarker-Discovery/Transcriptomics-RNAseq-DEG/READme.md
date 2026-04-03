🧬 Transcriptomics – RNA-seq Differential Gene Expression Analysis (DEG)

Objective:

To identify differentially expressed genes between disease and control samples using RNA-seq data.

🔬 Workflow

Retrieved transcriptomics dataset from GEO
Performed data preprocessing and normalization
Applied differential gene expression analysis using limma
Identified significantly upregulated and downregulated genes
Visualized results using volcano plot 

🛠 Tools Used

R (limma, GEOquery, pheatmap)
Data visualization (ggplot2)

📊 Outputs

DEG_results.csv (list of differentially expressed genes)
Volcano plot (logFC vs significance)

💡 Key Insight

Identified genes with significant expression differences between conditions
Highlighted potential biomarkers associated with disease
Observed clear separation between upregulated and downregulated gene clusters

🔗 Relevance to Multi-Omics

Transcriptomics forms the core layer of the multi-omics framework, providing insight into gene expression changes that can be further interpreted alongside epigenomic and proteomic data.
