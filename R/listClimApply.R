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
	
	

	out <- mapply(month=month,P=P,Tx=Tx,Tm=Tm,Tn=Tn,latitude=latitude,
			longitude=longitude,elevation=elevation,coeff_rad=coeff_rad,clim_fun=clim_fun,FUN=climAppy,...)
	
	
	
	
	
	
	
	
	return(out)
	
}


