NULL
#'
#' 
#' 
#' @note 'month' can be replecad by 'layer'
#' 
#' 
#' @export
#' 


climApply <- function(P=NA,Tx=NA,Tm=NA,Tn=NA,month=1:12,clim_fun=contin,...)   {
	
	
	
	
	
	###contin(clim_norm, latitude = NULL, elevation = NULL,
    ###Michalet_correction = FALSE, indices = 1:4)
	
	clim <- data.frame(month=month,P=P,Tx=Tx,Tm=Tm,Tn=Tn)
	
	
	
	out <- clim_fun(clim,...)
	
	
	
	
	return(out)
	
}