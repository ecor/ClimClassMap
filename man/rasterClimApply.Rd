\name{rasterClimApply}
\alias{rasterClimApply}
\title{Extension of  "ClimApply" to a Raster}
\usage{
rasterClimApply(P = NULL, Tx = NULL, Tm = NULL, Tn = NA, month = NA,
  clim_fun = "contin", ...)
}
\description{
Function "ClimApply" to ...
}
\examples{
library(ClimClassMap)
wpath <- system.file("raster_maps/1981-2010",package="ClimClassMap")
temp_map  <- "t/t1981-2010\%02d.tif"
prec_map  <- "p/p1981-2010\%02d.tif"


fact <- 5

prec <- aggregate(stack(paste(wpath,sprintf(prec_map,1:12),sep="/")),fact=fact) ## 1000 m resolution
Tm <- aggregate(stack(paste(wpath,sprintf(temp_map,1:12),sep="/")),fact=fact)

names(prec) <- sprintf("M\%02d",1:12)
names(Tm) <- sprintf("M\%02d",1:12)

# Actally no info for daily maximum and minimum temeparature

Tn <- stack(Tm-5)
Tx <- stack(Tm+5)




indexMap <- rasterClimApply(P=prec,Tx=Tx,Tn=Tn,Tm=Tm,clim_fun="contin",indices=4)
}
\seealso{
\code{\link{ClimApply}},\code{\link{listClimApply}}
}

