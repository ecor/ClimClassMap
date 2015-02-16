\name{climRaster2List}
\alias{climRaster2List}
\title{"climRaster2List" coercion of a RasterStack to a list}
\usage{
climRaster2List(r)
}
\arguments{
  \item{r}{\code{RasterStack-class} or a
  \code{RasterBrick-class} object}
}
\description{
This function transforms a \code{RasterStack-class} or a
\code{RasterBrick-class} object into a list of XY elements
}
\examples{
library(ClimClassMap)
wpath <- system.file("raster_maps/1981-2010",package="ClimClassMap")
prec_map  <- "p/p1981-2010\%02d.tif"


fact <- 5

prec <- aggregate(stack(paste(wpath,sprintf(prec_map,1:12),sep="/")),fact=fact) ## 1000 m resolution
}

