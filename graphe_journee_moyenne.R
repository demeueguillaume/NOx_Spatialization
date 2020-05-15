Haren_sans_we <- Haren[-1*which(Haren$Jour == "samedi" | Haren$Jour == "dimanche"),]
mod <- tapply(Haren_sans_we$NO2,Haren_sans_we$Heure,mean,na.rm=TRUE)

NO2_BE_sans_we <- NO2_BE[-1*which(Haren$Jour == "samedi" | Haren$Jour == "dimanche"),]
NO_BE_sans_we <- NO_BE[-1*which(Haren$Jour == "samedi" | Haren$Jour == "dimanche"),]


obs <- tapply(NO2_BE_sans_we$X41N043,Haren_sans_we$Heure,mean,na.rm=TRUE)

# NO2
plot(0:23,mod,"l",col="red",xlab = "Heure",ylab = "NO2",ylim = c(0,100))
par(new=TRUE)
plot(0:23,obs,"l",col="blue",xlab = "",ylab = "",ylim = c(0,100))

# NO
plot(0:23,tapply(Haren_sans_we$NO,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NO",ylim = c(0,100))
par(new=TRUE)
plot(0:23,tapply(NO_BE_sans_we$X41N043,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,100))

# NOx
plot(0:23,tapply(Haren_sans_we$NOx,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NOx",ylim = c(0,230))
par(new=TRUE)
plot(0:23,tapply(1.912*(NO2_BE_sans_we$X41N043/1.912+NO_BE_sans_we$X41N043/1.247),Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,230))

# BC
par(new=T)
plot(0:23,tapply(Haren_sans_we$BC,Haren_sans_we$Heure,mean,na.rm=TRUE),"l")


#*********
# Ixelles
#*********

Ixelles_sans_we <- Ixelles[-1*which(Haren$Jour == "samedi" | Haren$Jour == "dimanche"),]

#NO2
plot(0:23,tapply(Ixelles_sans_we$NO2,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NO2",ylim = c(0,80))
par(new=TRUE)
plot(0:23,tapply(NO2_BE_sans_we$X41R002,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,80))

#NO
plot(0:23,tapply(Ixelles_sans_we$NO,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NO",ylim = c(0,80))
par(new=TRUE)
plot(0:23,tapply(NO_BE_sans_we$X41R002,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,80))

#NOx
plot(0:23,tapply(Ixelles_sans_we$NOx,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NOx",ylim = c(0,200))
par(new=TRUE)
plot(0:23,tapply(1.912*(NO2_BE_sans_we$X41R002/1.912+NO_BE_sans_we$X41R002/1.247),Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,200))


#*********
# Molenbeek
#*********

Molenbeek_sans_we <- Molenbeek[-1*which(Haren$Jour == "samedi" | Haren$Jour == "dimanche"),]

#NO2
plot(0:23,tapply(Molenbeek_sans_we$NO2,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NO2",ylim = c(0,60))
par(new=TRUE)
plot(0:23,tapply(NO2_BE_sans_we$X41R001,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,60))

#NO
plot(0:23,tapply(Molenbeek_sans_we$NO,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NO",ylim = c(0,60))
par(new=TRUE)
plot(0:23,tapply(NO_BE_sans_we$X41R001,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,60))

#NOx
plot(0:23,tapply(Molenbeek_sans_we$NOx,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NOx",ylim = c(0,150))
par(new=TRUE)
plot(0:23,tapply(1.912*(NO2_BE_sans_we$X41R001/1.912+NO_BE_sans_we$X41R001/1.247),Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,150))

#*********
# Uccle
#*********

Uccle_sans_we <- Uccle[-1*which(Haren$Jour == "samedi" | Haren$Jour == "dimanche"),]

#NO2
plot(0:23,tapply(Uccle_sans_we$NO2,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NO2",ylim = c(0,40))
par(new=TRUE)
plot(0:23,tapply(NO2_BE_sans_we$X41R012,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,40))

#NO
plot(0:23,tapply(Uccle_sans_we$NO,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NO",ylim = c(0,40))
par(new=TRUE)
plot(0:23,tapply(NO_BE_sans_we$X41R012,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,40))

#NOx
plot(0:23,tapply(Uccle_sans_we$NOx,Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="red",xlab = "Heure",ylab = "NOx",ylim = c(0,80))
par(new=TRUE)
plot(0:23,tapply(1.912*(NO2_BE_sans_we$X41R012/1.912+NO_BE_sans_we$X41R012/1.247),Haren_sans_we$Heure,mean,na.rm=TRUE),
     "l",col="blue",xlab = "",ylab = "",ylim = c(0,80))

