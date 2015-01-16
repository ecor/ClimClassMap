\name{listClimApply}
\alias{listClimApply}
\title{Extension of  "ClimApply" to a list}
\usage{
listClimApply(P = NA, Tx = NA, Tm = NA, Tn = NA, month = 1:12,
  clim_fun = contin, latitude, longitude, elevation, coeff_rad = NA, ...)
}
\description{
Function "ClimApply" to ...
}
\note{
'month' can be replecad by 'layer'
}
\examples{
library(ClimClassMap)

data(Trent_climate)
for (it in names(clima_81_10)) { clima_81_10[[it]]$station <- it }
clim <- do.call(clima_81_10,rbind)
}
\seealso{
\code{\link{ClimApply}}
}

