# caricare le funzioni di ClimClassMap: climApply e listClimApply
# qui in versione semplificata

climApply <- function(P=NA,Tm=NA,clim_fun=contin,...)   {
  
    clim <- data.frame(P=P,Tm=Tm)
    out <- clim_fun(clim,...)
    
  return(out)
  
}

listClimApply <- function(P=NA,Tm=NA,clim_fun=contin,
                          latitude = NULL,elevation = NULL, ...)   {
  
  out <- mapply(P=P,Tm=Tm,latitude=latitude,
                elevation=elevation,clim_fun=clim_fun,FUN=climApply,...)
  
  return(out)
  
}


# caricare ClimClass e chiamare data (Trent_climate)
# questa funzione applica una funzione del pacchetto ai dati forniti come singoli vettori:

climApply(Tm=clima_81_10[[1]]$Tm, latitude=46, P=clima_81_10[[1]]$P, elevation=1000, clim_fun=contin)

# per applicare listClimApply devo creare le liste dei parametri di input: P, Tm, ...

clima<-clima_81_10
P_list<-NULL
Tm_list<-NULL
latitude_list<-NULL
elevation_list<-NULL
for(sta in 1:length(clima))
{
  P_list[[sta]]<-clima[[sta]]$P
  Tm_list[[sta]]<-clima[[sta]]$Tm
  latitude_list[[sta]]<-list(46)
  elevation_list[[sta]]<-list(1000)
  
}
 
# prove

# con queste varianti ottengo lo stesso errore:
# Error in dots[[5L]][[1L]] : object of type 'closure' is not subsettable
listClimApply(Tm=Tm_list, P=P_list, latitude=46,  elevation=1000)
listClimApply(Tm=Tm_list, P=P_list, latitude=latitude_list,  elevation=elevation_list)
listClimApply(Tm=Tm_list[[1]], P=P_list[[1]], latitude=46,  elevation=1000)
listClimApply(Tm=Tm_list[1], P=P_list[1], latitude=list(46),  elevation=list(1000))

# qui escludo le variabili latitude ed elevation, impostando l'indice = 4, che non usa queste variabili
# ottengo l'errore seguente: 
# Error in mapply(P = P, Tm = Tm, latitude = latitude, elevation = elevation,  : 
# zero-length inputs cannot be mixed with those of non-zero length
listClimApply(Tm=Tm_list, P=P_list, indices=4)
listClimApply(Tm=Tm_list[[1]], P=P_list[[1]], indices=4)
listClimApply(Tm=Tm_list[1], P=P_list[1], indices=4)



# DA QUI: VECCHIO TENTATIVO SUPERATO (SE TUTTO FUNZIONERA') DAL PACCHETTO IN FORMAZIONE ClimClassMap

contin_map<- function(index, Tm=NULL,P=NULL,  latitude=NULL, elevation=NULL, Michalet_correction=FALSE)
{
  
  K.G <- NA
  K.C <- NA
  alpha <- NA
  if(index==1) # Gorczynski 
  {
    if(!is.null(latitude)) 
      K.G <- round((1.7 * (max(Tm)  - min(Tm)) / sin(abs(latitude)*2*pi/360) - 20.4),2)
    continentality<-K.G
  }
    
  if(index==2)  # Conrad
  {
    if(!is.null(latitude)) 
      K.C <- round((1.7 * (max(Tm)  - min(Tm)) / sin(abs(latitude + 10)*2*pi/360) - 14),2)
    continentality<-K.C
  }
  
  if(index==3)  # Gams
  {
    if(!is.null(elevation)) 
      if(Michalet_correction==TRUE & elevation < 900)
        alpha <- round( atan(elevation / (sum(P) - (900 - elevation)/100 *sum(P)/10)) * 360 / (2*pi),2) else
          alpha <- round(    atan(elevation / sum(P))* 360 / (2*pi)  ,2)
    continentality<-alpha
  }
  
  if(index==4)  # Rivas-Martinez
  {
    Ic<-round((max(Tm) - min(Tm)),2)  
    continentality<-Ic
  }
  
  
  return(continentality)  
}
