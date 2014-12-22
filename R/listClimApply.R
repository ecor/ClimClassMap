# TODO: Add comment
# 
# Author: ecor
###############################################################################

NULL
#'
#' 
#' 
#' @note 'month' can be replecad by 'layer'
#' 
#' 
#' @export
#' 
#' @
#' 



listClimApply <- function(P=NA,Tx=NA,Tm=NA,Tn=NA,month=1:12,clim_fun=contin,
		latitude,longitude,elevation,coeff_rad=NA,...)   {
	
	##### 
	is.raster <- FALSE  
	if (class(P)=="RasterStack" | class(P)=="RasterBrick") is.raster <- TRUE
	if (class(Tx)=="RasterStack" | class(Tx)=="RasterBrick" | is.na(Tx)) is.raster <- is.raster & TRUE
	if (class(Tm)=="RasterStack" | class(Tm)=="RasterBrick" | is.na(Tm)) is.raster <- is.raster & TRUE
	if (class(Tn)=="RasterStack" | class(Tn)=="RasterBrick" | is.na(Tn)) is.raster <- is.raster & TRUE	
	
	if (class(P)=="RasterStack" | class(P)=="RasterBrick" & is.raster=)
	
	

	out <- mapply(month=month,P=P,Tx=Tx,Tm=Tm,Tn=Tn,latitude=latitude,
			longitude=longitude,elevation=elevation,coeff_rad=coeff_rad,clim_fun=clim_fun,FUN=climApply,...)
	
	
	
	
	
	
	
	
	return(out)
	
}


