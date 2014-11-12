

library(breastCancerMAINZ)
data(mainz)
library(Biobase)



dim(mainz)



colnames(pData(mainz))



row = 21399
plot(exprs(mainz)[row,])



mainz.class <- (pData(mainz)$e.dmfs & pData(mainz)$t.dmfs < 5*365)
mainz.fac <- factor(mainz.class, labels= c("CLEAR","DM"))
sum(mainz.class)



stripchart(exprs(mainz)[row,] ~ mainz.fac, method="jitter")



library(limma)
?limma



plotMA(mainz)



design <- model.matrix(~0 + mainz.fac)
colnames(design) <- c("CLEAR", "DM")
fit <- lmFit(exprs(mainz), design)
cont.matrix <- makeContrasts(DMvsCLEAR = DM - CLEAR, levels = design)
fit2 <- contrasts.fit(fit, cont.matrix)
fit.b <- eBayes(fit2)



plotMA(fit.b)



volcanoplot(fit.b)



topTable(fit.b, adjust = "BH")



library(hgu133a.db)



ls("package:hgu133a.db")



x <- hgu133aPATH2PROBE
# Get the probe identifiers that are mapped to a KEGG pathway
mapped_probes <- mappedkeys(x)
# Convert to a list
xx <- as.list(x[mapped_probes])
# build a list for mroast
indices <- ids2indices(xx, rownames(mainz))



res <- mroast(mainz, indices, design)
head(res)



x <- hgu133aENTREZID
# Convert to a list
xx <- as.list(x)
entrezid <- sapply(rownames(fit.b), function(x) xx[x], USE.NAMES=FALSE)



library(pathview)



gene.data <- fit.b$coefficients
rownames(gene.data) <- entrezid



pv.out <- pathview(gene.data = gene.data, pathway.id = "04010", 
                   species = "hsa", out.suffix = "dmvsclear", 
                   kegg.native = T, same.layer = F)


