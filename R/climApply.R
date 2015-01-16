NULL
#' climApply
#' 
#' Extantsions of 'climClass' function 
#' 
#' @note 'month' can be replecad by 'layer'
#' 
#' 
#' @export
#' 
#' @examples
#' 
#' library(ClimClassMap)
#' 
#' data(Trent_climate)
#'  
#' clim <- clima_81_10$T0083
#' 
#' c <- climApply(P=clim$P,Tx=clim$Tx,Tn=clim$Tn,Tm=clim$Tm,clim_fun=contin,indices=4)
#' 
#' 
#' 
#' 





climApply <- function(P=NA,Tx=NA,Tm=NA,Tn=NA,month=1:12,clim_fun=contin,...)   {
	
	
	
	
	
	###contin(clim_norm, latitude = NULL, elevation = NULL,
    ###Michalet_correction = FALSE, indices = 1:4)
	
	clim <- data.frame(month=month,P=P,Tx=Tx,Tm=Tm,Tn=Tn)
	
	
	
	out <- clim_fun(clim,...)
	
	
	
	
	return(out)
	
}