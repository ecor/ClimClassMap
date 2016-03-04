
NULL
#' Extension of  "ClimApply" to a Raster
#' 
#' Function "ClimApply" to ...
#'
#' 
#' @param P,Tx,Tm,Tn daily precipitation, maximum, mean and minimum temperature.
#' @param month vectors of months. Default is \code{NA}
#' @param clim_fun climate function index of \code{ClimClass} package  
#' @param ... further arguments for \code{\link{listClimApply}}
#' 
#' 
#' @seealso \code{\link{climApply}},\code{\link{listClimApply}}
#' 
#' 
#' @export
#' 
#' @seealso \code{\link{climStack2List}},\code{\link{listClimApply}}
#' @examples 
#' 
#' library(ClimClassMap)
#' wpath <- system.file("raster_maps/1981-2010",package="ClimClassMap")
#' temp_map  <- "t/t1981-2010%02d.tif" 
#' prec_map  <- "p/p1981-2010%02d.tif"
#' 
#' 
#' fact <- 5
#' 
#' prec <- aggregate(stack(paste(wpath,
#' 			sprintf(prec_map,1:12),sep="/")),fact=fact) ## 1000 m resolution 
#' Tm <- aggregate(stack(paste(wpath,sprintf(temp_map,1:12),sep="/")),fact=fact)
#' 
#' names(prec) <- sprintf("M%02d",1:12)
#' names(Tm) <- sprintf("M%02d",1:12)
#' 
#' # Actally no info for daily maximum and minimum temeparature
#' 
#' Tn <- stack(Tm-5)
#' Tx <- stack(Tm+5)
#' 
#' 
#' 
#' 
#' indexMap <- rasterClimApply(P=prec,Tx=Tx,Tn=Tn,Tm=Tm,clim_fun="contin",indices=4)
#' 
#' 
#' 
#' 
#
# 




rasterClimApply <- function(P=NULL,Tx=NULL,Tm=NULL,Tn=NA,month=NA,clim_fun="contin",...)   {
	
	##### 
	
	if (is.null(month)) month <- NA
	is.raster <- FALSE  
	if (class(P)=="RasterStack" | class(P)=="RasterBrick") is.raster <- TRUE
	if (class(Tx)=="RasterStack" | class(Tx)=="RasterBrick" | is.null(Tx)) is.raster <- is.raster & TRUE
	if (class(Tm)=="RasterStack" | class(Tm)=="RasterBrick" | is.null(Tm)) is.raster <- is.raster & TRUE
	if (class(Tn)=="RasterStack" | class(Tn)=="RasterBrick" | is.null(Tn)) is.raster <- is.raster & TRUE	
	
	if (class(P)=="RasterStack" | class(P)=="RasterBrick" & is.raster==TRUE) {
		month <- list(1:raster::nlayers(P))
		out_extent <- P[[1]]*NA
		
		
	} 
	if (class(Tx)=="RasterStack" | class(Tx)=="RasterBrick" & is.raster==TRUE) {
		month <- list(1:raster::nlayers(Tx))
		out_extent <- Tx[[1]]*out_extent*NA
	} 
	if (class(Tm)=="RasterStack" | class(Tm)=="RasterBrick" & is.raster==TRUE) {	
		month <- list(1:raster::nlayers(Tm))
		out_extent <- Tm[[1]]*out_extent*NA
		
	} 
	if (class(Tn)=="RasterStack" | class(Tn)=="RasterBrick" & is.raster==TRUE) {
		month <- list(1:raster::nlayers(Tn))
		out_extent <- Tn[[1]]*out_extent*NA
	}
	
	if (is.raster!=TRUE) {
		
		stop("rasterClimApply: input weather data frame are not correct rasters!")
		
	}
	### Elevation, Latitude, Longitude , Coeff_rad were actually removed!!!!! 
	
	
	Txl <- climStack2List(Tx)
	Tml <- climStack2List(Tm)
	Tnl <- climStack2List(Tx)
	Pl <- climStack2List(P)
	
	xy <- array(NA,c(length(Pl),2))
	
	xy[,1] <- unlist(lapply(X=Pl,FUN=attr,which="x"))
	xy[,2] <- unlist(lapply(X=Pl,FUN=attr,which="y"))
	
	icell <- raster::cellFromXY(out_extent, xy)
	
	
	
	out_list <- listClimApply(P=Pl,Tx=Txl,Tm=Tml,Tn=Tnl,month=month,clim_fun=clim_fun,...)
	
	### Fill the map!
	
	out <- out_extent
	
	out[icell] <- unlist(out_list)
	
	
	return(out)
	
}
