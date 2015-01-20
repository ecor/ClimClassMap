# TODO: Add comment
# 
# Author: ecor
###############################################################################

NULL
#' Extension of  "ClimApply" to a list 
#' 
#' Function "ClimApply" applied to a list
#' 
#' @param P monthly precipitation (list)
#' @param Tx monthly mean daily maximium temparature (list)
#' @param Tm monthly mean daily average temparature (list) 
#' @param Tn monthly mean daily minimum temparature (list)
#' @param month a list with a vector or vectors indicating each month. Default is \code{list(1:12)}.
#' @param clim_fun character string containing the name of the applied "ClimClass" package function
#' @param ... further arguments for \code{clim_fun} function 
#' 
#' 
#' @note 'month' can be replecad by 'layer'
#' 
#' @seealso \code{\link{climApply}}
#' 
#' 
#' @export
#' 
#' @examples
#' library(ClimClassMap)
#' 
#' data(Trent_climate)
#' clim <- melt(clima_81_10,id="month")
#' 
#' names(clim)[names(clim)=="L1"] <- "station"
#' 
#' station <- unique(clim$station)[4:6]
#' names(station) <- station
#' P <- lapply(X=station,FUN=function(it,df,variable) {df$value[df$station==it & df$variable==variable]},df=clim,variable="P")
#' Tx <- lapply(X=station,FUN=function(it,df,variable) {df$value[df$station==it & df$variable==variable]},df=clim,variable="Tx")
#' Tn <- lapply(X=station,FUN=function(it,df,variable) {df$value[df$station==it & df$variable==variable]},df=clim,variable="Tn")
#' Tm <- lapply(X=station,FUN=function(it,df,variable) {df$value[df$station==it & df$variable==variable]},df=clim,variable="Tm")
#' 
#' c <- listClimApply(P=P,Tx=Tx,Tn=Tn,Tm=Tm,clim_fun="contin",indices=4)
#' 
#
# 




listClimApply <- function(P=NA,Tx=NA,Tm=NA,Tn=NA,month=list(1:12),clim_fun="contin",...)   {
	
	
	
	### Elevation, Latitude, Longitude , Coeff_rad were actually removed!!!!! 
	

	out <- mapply(month=month,P=P,Tx=Tx,Tm=Tm,Tn=Tn,clim_fun=clim_fun,FUN=climApply,...)
	
	
	names(out) <- names(P)
	
	
	
	
	
	return(out)
	
}


