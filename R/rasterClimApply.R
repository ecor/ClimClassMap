
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
#' @examples
#' 
#' ## TO DO 
#' 
#' 
#' 
#' 
#
# 




rasterClimApply <- function(P=NA,Tx=NA,Tm=NA,Tn=NA,month=list(1:12),clim_fun="contin",...)   {
	
	##### 
	is.raster <- FALSE  
	if (class(P)=="RasterStack" | class(P)=="RasterBrick") is.raster <- TRUE
	if (class(Tx)=="RasterStack" | class(Tx)=="RasterBrick" | is.na(Tx)) is.raster <- is.raster & TRUE
	if (class(Tm)=="RasterStack" | class(Tm)=="RasterBrick" | is.na(Tm)) is.raster <- is.raster & TRUE
	if (class(Tn)=="RasterStack" | class(Tn)=="RasterBrick" | is.na(Tn)) is.raster <- is.raster & TRUE	
	
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
	
	### Elevation, Latitude, Longitude , Coeff_rad were actually removed!!!!! 
	
	### TO DO 
	
	out <- NULL
	
	
	
	
	return(out)
	
}
