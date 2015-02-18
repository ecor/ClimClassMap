
NULL
#' Extension of  "ClimApply" to a Raster
#' 
#' Function "ClimApply" to ...
#' 
#'
#' @seealso \code{\link{ClimApply}},\code{\link{listClimApply}}
#' 
#' 
#' @export
#' 
#' 
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
#' prec <- aggregate(stack(paste(wpath,sprintf(prec_map,1:12),sep="/")),fact=fact) ## 1000 m resolution 
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
		month <- list(1:nlayers(P))
		
		
		
	} 
	if (class(Tx)=="RasterStack" | class(Tx)=="RasterBrick" & is.raster==TRUE) {
		month <- list(1:nlayers(Tx))
	} 
	if (class(Tm)=="RasterStack" | class(Tm)=="RasterBrick" & is.raster==TRUE) {	
		month <- list(1:nlayers(Tm))
	} 
	if (class(Tn)=="RasterStack" | class(Tn)=="RasterBrick" & is.raster==TRUE) {
		month <- list(1:nlayers(Tn))
	}
	
	if (is.raster!=TRUE) {
		
		stop("rasterClimAppl: input weather data frame are not correct rasters!")
		
	}
	### Elevation, Latitude, Longitude , Coeff_rad were actually removed!!!!! 
	
	### TO DO 
	Txl <- climStack2List(Tx)
	Tml <- climStack2List(Tm)
	Tnl <- climStack2List(Tx)
	Pl <- climStack2List(P)
	
	out <- listClimApply(P=Pl,Tx=Txl,Tm=Tml,Tn=Tnl,month=month,clim_fun=clim_fun,,...)
	
	## CREATE THE EXAMPLE!!!!
	
	##out <- NULL
	
	
	
	
	return(out)
	
}
