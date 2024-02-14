# make list of core packages for r
# author sam
#date: feb 9th 2024

```
Core_CRAN <- c("tidyverse", "data.table", "dtplyr", "ggfortify", "ggpubr", "ggrepel", "janitor", "matrixStats", "optparse", "pheatmap", "pryr", "GGally", "viridis", "yaml")
Bioconductor_core <- c("DESeq2", "EnhancedVolcano", "plyranges", "msigdbr", "clusterProfiler", "BiocParallel", "GenomicFeatures", "AnnotationDbi")


# Original vectors
Core_CRAN <- c("tidyverse", "data.table", "dtplyr", "ggfortify", "ggpubr", "ggrepel", "janitor", "matrixStats", "optparse", "pheatmap", "pryr", "GGally", "viridis", "yaml")
Bioconductor_core <- c("DESeq2", "EnhancedVolcano", "plyranges", "msigdbr", "clusterProfiler", "BiocParallel", "GenomicFeatures", "AnnotationDbi")

# Make the length of Bioconductor_core equal to Core_CRAN by filling with NA
length(Bioconductor_core) <- length(Core_CRAN)

# Create the data frame
dtf <- data.frame(Core_CRAN, Bioconductor_core)


write.csv(dtf, "R_packages_to_install.csv", row.names = FALSE)
```



