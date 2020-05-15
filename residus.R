# Besoin de data_traitment et modeleNOxPond
#**********************************************************************************************

totalJours <- rep(Ixelles$Jour,5)
totalHeures <- rep(Ixelles$Heure,5)
totalStation <- c(rep("Haren",244560/5),rep("Molenbeek",244560/5),rep("Ixelles",244560/5),
                  rep("Uccle",244560/5),rep("Woluwe",244560/5))


totalNO2obs <- c(NO2_BE$X41N043,NO2_BE$X41R001,NO2_BE$X41R002,NO2_BE$X41R012,NO2_BE$X41WOL1)
totalNO2pred <- c(Haren$NO2,Molenbeek$NO2,Ixelles$NO2,Uccle$NO2,Woluwe$NO2)

totalNOobs <- c(NO_BE$X41N043,NO_BE$X41R001,NO_BE$X41R002,NO_BE$X41R012,NO_BE$X41WOL1)
totalNOpred <- c(Haren$NO,Molenbeek$NO,Ixelles$NO,Uccle$NO,Woluwe$NO)

totalNOxobs <- c(1.912*(NO2_BE$X41N043/1.912+NO_BE$X41N043/1.247),
                 1.912*(NO2_BE$X41R001/1.912+NO_BE$X41R001/1.247),
                 1.912*(NO2_BE$X41R002/1.912+NO_BE$X41R002/1.247),
                 1.912*(NO2_BE$X41R012/1.912+NO_BE$X41R012/1.247),
                 1.912*(NO2_BE$X41WOL1/1.912+NO_BE$X41WOL1/1.247))
totalNOxpred <- c(1.912*(Haren$NO2/1.912+Haren$NO/1.247),
                  1.912*(Molenbeek$NO2/1.912+Molenbeek$NO/1.247),
                  1.912*(Ixelles$NO2/1.912+Ixelles$NO/1.247),
                  1.912*(Uccle$NO2/1.912+Uccle$NO/1.247),
                  1.912*(Woluwe$NO2/1.912+Woluwe$NO/1.247))

resNO2 <- totalNO2obs-totalNO2pred
resNO <- totalNOobs-totalNOpred
resNOx <- totalNOxobs-totalNOxpred

residus <- data.frame(totalStation)
residus$Jour <- totalJours
residus$Heure <- totalHeures
residus$NO2obs <- totalNO2obs
residus$NO2pred <- totalNO2pred
residus$NOobs <- totalNOobs
residus$NOpred <- totalNOpred
residus$NOxobs <- totalNOxobs
residus$NOxpred <- totalNOxpred
residus$resNO2 <- resNO2
residus$resNO <- resNO
residus$resNOx <- resNOx

setwd('C:/Users/demo/OneDrive - UCL/PROJET NOx/generate')
write.csv(residus,"residus.csv",row.names = FALSE, quote = FALSE)
