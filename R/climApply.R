NULL
#' climApply
#' 
#' Extantsions of 'climClass' function 
#' 
#' @param P monthly precipitation 
#' @param Tx monthly mean daily maximium temparature
#' @param Tm monthly mean daily average temparature
#' @param Tn monthly mean daily minimum temparature 
#' @param month vector indicating each month. Default is \code{1:12}.
#' @param clim_fun function or function name of the applied "ClimClass" package function
#' @param ... further arguments for \code{clim_fun}
#'  
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
	
	
	
	
	if (is.character(clim_fun)) clim_fun <- get(clim_fun)
	###contin(clim_norm, latitude = NULL, elevation = NULL,
    ###Michalet_correction = FALSE, indices = 1:4)
	###if (is.month(NA) | length(month)==1) month <- 1:12
	
	clim <- data.frame(month=month,P=P,Tx=Tx,Tm=Tm,Tn=Tn)
	

	
	out <- clim_fun(clim,...)

	
	
	return(out)
	
}