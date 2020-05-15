modele <- function(BC,time,M)
{
  modele <- NULL
  modele$date <- time
  modele$Heure <- format(modele$date, "%H")
  modele$Jour <- format(modele$date, "%A")
  modele$Mois <- format(modele$date, "%B")
  
  modele$BC <- BC
  modele <- data.frame(modele)
  
  NOx_moy <- exp(3.690717+0.8195521*log(modele$BC))
  NOx_pic <- exp(3.9799+0.8796*log(modele$BC))
  pondNOx <- rep(c(0,0,0,0,1/3,2/3,1,1,2/3,1/3,0,0,0,0,0,0,0,0,0,0,0,0,0,0),length(time)/24)
  modele$NOx <- NOx_moy*(1-pondNOx)+NOx_pic*pondNOx
  
  modele$W <- 0.3001+0.3255*modele$BC
  modele$M <- rep(c(M[-1],M[1]),length(BC)/24)
  modele$rap_NO_NO2 <- modele$M*modele$W
  modele$NO2 <- modele$NOx/(1+(1.912/1.247)*modele$rap_NO_NO2)
  modele$NO <- modele$rap_NO_NO2*modele$NO2
  return(modele)
}

RapportNO_NO2 <- cbind(format(NO2_BE$time, "%H"),NO_BE[,-1]/NO2_BE[,-1])

M <- tapply(RapportNO_NO2[,11],RapportNO_NO2[,1],mean,na.rm=TRUE)


Haren <- modele(BC_BE$X41N043,BC_BE$time,M)
Molenbeek <- modele(BC_BE$X41R001,BC_BE$time,M)
Ixelles <- modele(BC_BE$X41R002,BC_BE$time,M)
Uccle <- modele(BC_BE$X41R012,BC_BE$time,M)
Woluwe <- modele(BC_BE$X41WOL1,BC_BE$time,M)


#*****************
# Choix des dates
#*****************

debut <- "2016-04-25 00:00:00"
fin <- "2016-05-01 23:00:00"
debut <- which(BC_BE$time == debut)
fin <- which(BC_BE$time == fin)


#********
# Haren
#********

# NO2
plot(NO2_BE$time[debut:fin],Haren$NO2[debut:fin],"l",col="red",xlab = "",ylab = "NO2",ylim = c(0,150))
par(new=TRUE)
plot(NO2_BE$time[debut:fin],NO2_BE$X41N043[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,150))

#NO
plot(NO_BE$time[debut:fin],Haren$NO[debut:fin],"l",col="red",xlab = "",ylab = "NO",ylim = c(0,450))
par(new=TRUE)
plot(NO_BE$time[debut:fin],NO_BE$X41N043[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,450))

#NOx
plot(NO_BE$time[debut:fin],Haren$NOx[debut:fin],"l",col="red",xlab = "",ylab = "NOx",ylim = c(0,800))
par(new=TRUE)
plot(NO_BE$time[debut:fin],1.912*(NO2_BE$X41N043[debut:fin]/1.912 + NO_BE$X41N043[debut:fin]/1.247),"l",
     col="blue",xlab = "",ylab = "",ylim = c(0,800))


#************
# Molenbeek
#************

# NO2
plot(NO2_BE$time[debut:fin],Molenbeek$NO2[debut:fin],"l",col="red",xlab = "Date (2016)",ylab = "NO2",ylim = c(0,120))
par(new=TRUE)
plot(NO2_BE$time[debut:fin],NO2_BE$X41R001[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,120))

#NO
plot(NO_BE$time[debut:fin],Molenbeek$NO[debut:fin],"l",col="red",xlab = "Date (2016)",ylab = "NO",ylim = c(0,150))
par(new=TRUE)
plot(NO_BE$time[debut:fin],NO_BE$X41R001[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,150))

#NOx
plot(NO_BE$time[debut:fin],Molenbeek$NOx[debut:fin],"l",col="red",xlab = "Date (2016)",ylab = "NOx",ylim = c(0,320))
par(new=TRUE)
plot(NO_BE$time[debut:fin],1.912*(NO2_BE$X41R001[debut:fin]/1.912 + NO_BE$X41R001[debut:fin]/1.247),"l",col="blue",
     xlab = "",ylab = "",ylim = c(0,320))


#**********
# Ixelles
#**********
# NO2
plot(NO2_BE$time[debut:fin],Ixelles$NO2[debut:fin],"l",col="red",xlab = "Date (2016)",ylab = "NO2",ylim = c(0,120))
par(new=TRUE)
plot(NO2_BE$time[debut:fin],NO2_BE$X41R002[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,120))

#NO
plot(NO_BE$time[debut:fin],Ixelles$NO[debut:fin],"l",col="red",xlab = "Date (2016)",ylab = "NO",ylim = c(0,150))
par(new=TRUE)
plot(NO_BE$time[debut:fin],NO_BE$X41R002[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,150))

#NOx
plot(NO_BE$time[debut:fin],Ixelles$NOx[debut:fin],"l",col="red",xlab = "Date (2016)",ylab = "NOx",ylim = c(0,320))
par(new=TRUE)
plot(NO_BE$time[debut:fin],1.912*(NO2_BE$X41R002[debut:fin]/1.912 + NO_BE$X41R002[debut:fin]/1.247),"l",
     col="blue",xlab = "",ylab = "",ylim = c(0,320))


#**********
# Uccle
#**********
# NO2
plot(NO2_BE$time[debut:fin],Uccle$NO2[debut:fin],"l",col="red",xlab = "",ylab = "NO2",ylim = c(0,100))
par(new=TRUE)
plot(NO2_BE$time[debut:fin],NO2_BE$X41R012[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,100))

#NO
plot(NO_BE$time[debut:fin],Uccle$NO[debut:fin],"l",col="red",xlab = "",ylab = "NO",ylim = c(0,120))
par(new=TRUE)
plot(NO_BE$time[debut:fin],NO_BE$X41R012[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,120))

#NOx
plot(NO_BE$time[debut:fin],Uccle$NOx[debut:fin],"l",col="red",xlab = "",ylab = "NOx",ylim = c(0,250))
par(new=TRUE)
plot(NO_BE$time[debut:fin],1.912*(NO2_BE$X41R012[debut:fin]/1.912 + NO_BE$X41R012[debut:fin]/1.247),"l",
     col="blue",xlab = "",ylab = "",ylim = c(0,250))


#**********
# Woluwe
#**********
# NO2
plot(NO2_BE$time[debut:fin],Woluwe$NO2[debut:fin],"l",col="red",xlab = "",ylab = "NO2",ylim = c(0,100))
par(new=TRUE)
plot(NO2_BE$time[debut:fin],NO2_BE$X41WOL1[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,100))

#NO
plot(NO_BE$time[debut:fin],Woluwe$NO[debut:fin],"l",col="red",xlab = "",ylab = "NO",ylim = c(0,150))
par(new=TRUE)
plot(NO_BE$time[debut:fin],NO_BE$X41WOL1[debut:fin],"l",col="blue",xlab = "",ylab = "",ylim = c(0,150))

#NOx
plot(NO_BE$time[debut:fin],Woluwe$NOx[debut:fin],"l",col="red",xlab = "",ylab = "NOx",ylim = c(0,280))
par(new=TRUE)
plot(NO_BE$time[debut:fin],1.912*(NO2_BE$X41WOL1[debut:fin]/1.912 + NO_BE$X41WOL1[debut:fin]/1.247),"l",col="blue",xlab = "",ylab = "",ylim = c(0,280))
