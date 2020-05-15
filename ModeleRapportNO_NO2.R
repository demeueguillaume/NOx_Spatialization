RapportNO_NO2 <- cbind(format(NO2_BE$time, "%H"),NO_BE[,-1]/NO2_BE[,-1])

M <- tapply(RapportNO_NO2[,11],RapportNO_NO2[,1],mean,na.rm=TRUE)

jkl <- matrix(rep(0,24*11),ncol = 11)
for (i in 2:dim(RapportNO_NO2)[2]){
  jkl[,i-1] = tapply(RapportNO_NO2[,i],RapportNO_NO2[,1],mean,na.rm=TRUE)
}


## nlm

f <- function(fc,M,mesure){
  
  rmse = sqrt(mean((mesure-M*fc)^2, na.rm = TRUE))
  return(rmse)
}

# rmse
f(1.41,M,jkl[,9])

# recherche fc(proche de 1) qui minimise rmse
# à faire pour les colonnes de jkl de 1 à 9
nlm(f,1,M,jkl[,1])



## facteurs correctifs entre 7h et 10h et 16h à 19h
nlm(f,1,M[c(7,8,9,10,16,17,18,19)],jkl[c(7,8,9,10,16,17,18,19),7])

nlm(f,1,M[c(11,12,13,14,15)],jkl[c(11,12,13,14,15),7])

## facteurs correctifs entre 7h et 10h et 16h à 19h 
mno_moy_5_10 <- matrix(rep(0,11),ncol = 11)
for (i in 1:11){
  mno_moy_5_10[i]=mean(jkl[5:10,i]/M[5:10])
}

