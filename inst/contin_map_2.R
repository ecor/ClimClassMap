# caricare le funzioni di ClimClassMap: climApply e listClimApply
# qui in versione semplificata

library(ClimClassMap)
data(Trent_climate)



# caricare ClimClass e chiamare data (Trent_climate)
# questa funzione applica una funzione del pacchetto ai dati forniti come singoli vettori:

#climApply(Tm=clima_81_10[[1]]$Tm, latitude=46, P=clima_81_10[[1]]$P, elevation=1000, clim_fun=contin)

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
listClimApply(Tm=Tm_list, P=P_list, latitude=46,  elevation=1000,indices=4)
#listClimApply(Tm=Tm_list, P=P_list, latitude=latitude_list,  elevation=elevation_list)
#listClimApply(Tm=Tm_list[[1]], P=P_list[[1]], latitude=46,  elevation=1000)
#listClimApply(Tm=Tm_list[1], P=P_list[1], latitude=list(46),  elevation=list(1000))

# qui escludo le variabili latitude ed elevation, impostando l'indice = 4, che non usa queste variabili
# ottengo l'errore seguente: 
# Error in mapply(P = P, Tm = Tm, latitude = latitude, elevation = elevation,  : 
# zero-length inputs cannot be mixed with those of non-zero length

#listClimApply(Tm=Tm_list, P=P_list, indices=4)
#listClimApply(Tm=Tm_list[[1]], P=P_list[[1]], indices=4)
#listClimApply(Tm=Tm_list[1], P=P_list[1], indices=4)



