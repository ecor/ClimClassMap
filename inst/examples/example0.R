# TODO: Add comment
# 
# Author: ecor
###############################################################################
library(raster)

wpath <- "/Users/ecor/Dropbox/R-packages/ClimClassMap/inst/raster_maps/1981-2010"

temp_map  <- "t/t1981-2010%02d.tif" 
prec_map  <- "p/p1981-2010%02d.tif"

temp <- stack(paste(wpath,sprintf(temp_map,1:12),sep="/"))
prec <- stack(paste(wpath,sprintf(prec_map,1:12),sep="/"))

new_crs=as.character("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")




