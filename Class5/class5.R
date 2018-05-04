#Bioinformatics Class 5
#Plots
# check code folding, rmarkdown.rstudio.com

#Generate dataset of random numbers in a normal distribution, with a particular mean and a particular sd.
x <- rnorm(1000, mean = 0, sd = 1)

#Visualyze data.
mean(x)
median(x)
summary(x)

#Create boxplot, histogram, etc.
boxplot(x)
hist(x)

#Section 1A from lab sheet
baby <- read.table("bggn213_05_rstats/weight_chart.txt", header = TRUE)
plot(baby, type = "o", pch = 15, cex = 1.5, lwd=2, lty = 5, ylim=c(2,10), xlab="Age (months)", ylab="Weight (kg)", main="Some title")

#Section 1B
feat <- read.table("bggn213_05_rstats/feature_counts.txt", sep = "\t", header = TRUE)
par(mar=c(5,12,4,2))
barplot(feat$Count, names.arg = feat$Feature, horiz=TRUE, ylab="Genomic region", main="Features of hg38", las=1)

#Section 1C
x_norm <- c(rnorm(10000), rnorm(10000)+4)
hist(x_norm, breaks = 20)

#Section 2A
#mfcount <- read.table("bggn213_05_rstats/male_female_counts.txt", sep = "\t", header = TRUE)
mfcount <- read.delim("bggn213_05_rstats/male_female_counts.txt")
barplot(mfcount$Count, col = 1:nrow(mfcount))

#Section 2B
geneexp <- read.delim("bggn213_05_rstats/up_down_expression.txt")
palette(c("red","green","blue"))
plot(geneexp$Condition1,geneexp$Condition2, col = geneexp$State)
palette()
levels(geneexp$State)

#Section 2C
map.colors <- function (value,high.low,palette) {
  proportion <- ((value-high.low[1])/(high.low[2]-high.low[1]))
  index <- round ((length(palette)-1)*proportion)+1
  return (palette[index])
}
methyl <- read.delim("bggn213_05_rstats/expression_methylation.txt")

high.low <- c(min(methyl$expression),max(methyl$expression)) #define the high.low param for the map.colors function
palette <- colorRampPalette(c("grey","red"))(1000) #define the palette param for the map.colors function
newcolors <- map.colors(methyl$expression,high.low,palette) #use map.colors and assign to new variable
plot(methyl$promoter.meth, methyl$gene.meth, col = newcolors) #plot using the new color palette

#Section 3A
chrompos <- read.delim("bggn213_05_rstats/chromosome_position_data.txt")
plot(chrompos$Position, chrompos$WT, type = "l", lines(chrompos$Position,chrompos$mut1),)

