# TODO: Add comment
# 
# Author: ecor
###############################################################################


NULL
#' "climStack2List" coercion of a RasterStack to a list 
#' 
#' This function transforms a \code{RasterStack-class} or a \code{RasterBrick-class} object into a list of XY elements
#' 
#' @param  r \code{RasterStack-class} or a \code{RasterBrick-class} object 
#' 
#' @export 
#' @importFrom raster as.data.frame 
#' 
#' @seealso \code{\link{resterClimApply}},\code{\link{listClimApply}} 
#' 
#' @examples 
#' 
#' library(ClimClassMap)
#' wpath <- system.file("raster_maps/1981-2010",package="ClimClassMap")
#' prec_map  <- "p/p1981-2010%02d.tif"
#' 
#' 
#' fact <- 5
#' 
#' prec <- aggregate(stack(paste(wpath,sprintf(prec_map,1:12),sep="/")),fact=fact) ## 1000 m resolution 
#' names(prec) <- sprintf("M%02d",1:12)
#' 
#' l <- climStack2List(prec)
#' 
#' 
#' 





climStack2List <- function(r) {
	
	obj <- as.data.frame(r,xy=TRUE)
	
	c <- which(!(names(obj) %in% c("x","y")))
	
	obj <- obj[!is.na(obj[,c[1]]),]
	
	out <- lapply(X=1:nrow(obj),FUN=function(v,data,c) {
				
				out <- unlist(data[v,c])
				
				attr(out,"x") <- data$x[v]
				attr(out,"y") <- data$y[v]
				
				return(out)
				
				},data=obj,c=c)
	
	
	
	return(out)
	
}
