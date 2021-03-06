

par(mar = c(1, 1, 1, 1))

circos.par("default.track.height" = 0.1)
circos.initializeWithIdeogram(plotType = NULL)

# data frame with single value column
bed = generateRandomBed(nr = 100)
circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
})

circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
	i = getI(...)
	cell.xlim = get.cell.meta.data("cell.xlim")
	circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
})

bed1 = generateRandomBed(nr = 100)
bed2 = generateRandomBed(nr = 100)
bed_list = list(bed1, bed2)

# data frame list
circos.genomicTrackPlotRegion(bed_list, panel.fun = function(region, value, ...) {
	cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
	i = getI(...)
	circos.genomicPoints(region, value, cex = cex, pch = 16, col = i, ...)
})

circos.genomicTrackPlotRegion(bed_list, stack = TRUE, panel.fun = function(region, value, ...) {
	cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
	i = getI(...)
	circos.genomicPoints(region, value, cex = cex, pch = 16, col = i, ...)
	cell.xlim = get.cell.meta.data("cell.xlim")
	circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
})


bed = generateRandomBed(nr = 100, nc = 4)
circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
	cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
	circos.genomicPoints(region, value, cex = 0.5, pch = 16, col = 1:4, ...)
})

circos.genomicTrackPlotRegion(bed, stack = TRUE, panel.fun = function(region, value, ...) {
	cex = (value[[1]] - min(value[[1]]))/(max(value[[1]]) - min(value[[1]]))
	i = getI(...)
	circos.genomicPoints(region, value, cex = cex, pch = 16, col = i, ...)
	cell.xlim = get.cell.meta.data("cell.xlim")
	circos.lines(cell.xlim, c(i, i), lty = 2, col = "#00000040")
})

circos.clear()

##############################################################
### test numeric column
circos.par("default.track.height" = 0.1)
circos.initializeWithIdeogram(plotType = NULL)

bed = generateRandomBed(nr = 10)
circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
})

bed = generateRandomBed(nr = 100)
bed = cbind(bed[1:3], rep(1, nrow(bed)), bed[4])
circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
})
circos.genomicTrackPlotRegion(bed, numeric.column = 5, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
})
circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, numeric.column = 1, pch = 16, cex = 0.5, ...)
})
circos.clear()

#####################################################################
### test error situation
circos.par("default.track.height" = 0.1)
circos.initializeWithIdeogram(plotType = NULL)

bed = generateRandomBed(nr = 100, nc = 0)
circos.genomicTrackPlotRegion(bed, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
})

bed = cbind(bed, rep("text", nrow(bed)))
circos.genomicTrackPlotRegion(bed, numeric.column = 4, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
})

bed1 = generateRandomBed(nr = 100, nc = 1)
bed2 = generateRandomBed(nr = 100, nc = 1)
bed_list = list(bed1, bed2)
circos.genomicTrackPlotRegion(bed_list, panel.fun = function(region, value, ...) {
	circos.genomicPoints(region, value, pch = 16, cex = 0.5, ...)
})
circos.clear()


