library(dplyr)
library(Seurat)
library(patchwork)

pbmc <- readRDS("./data/pbmc3k.rds")

DimPlot(pbmc, reduction = "umap")

# マーカー遺伝子 → 細胞種
# IL7R, CCR7	→ Naive CD4+ T
# IL7R, S100A4	→ Memory CD4+

FeaturePlot(pbmc, features = c("IL7R", "CCR7", "S100A4"))


new.cluster.ids <- c("Naive CD4+ T", "Memory CD4+", "2", "3", "4", "5",
                     "6", "7")
names(new.cluster.ids) <- levels(pbmc)
pbmc <- RenameIdents(pbmc, new.cluster.ids)
DimPlot(pbmc, reduction = "umap", label = TRUE, pt.size = 0.5) + NoLegend()
