spat <- read.csv(file="C:/Users/demo/OneDrive - UCL/PROJET NOx/BC.csv",header=TRUE,sep = ";", dec = ",")
spat$NOx_peak <- exp(0.625*3.690717+0.375*3.9799+0.625*0.8195521*log(spat$BULK)+0.375*0.8796*log(spat$BULK)+0.5*(0.625*0.5733075^2 + 0.375*0.8739936^2))
spat$NOx_bulk <- exp(3.690717+0.8195521*log(spat$BULK)+0.5*0.4775868^2)
spat$W_peak <- 0.3001+0.3255*spat$PEAK
spat$W_bulk <- 0.3001+0.3255*spat$BULK
spat$rap_NO_NO2_peak <- spat$W_peak*0.5116179
spat$rap_NO_NO2_bulk <- spat$W_bulk*0.4739803
spat$NO2_peak <- spat$NOx_peak/(1+(1.912/1.247)*spat$rap_NO_NO2_peak)
spat$NO2_bulk <- spat$NOx_bulk/(1+(1.912/1.247)*spat$rap_NO_NO2_bulk)
spat$NO_peak <- spat$rap_NO_NO2_peak*spat$NO2_peak
spat$NO_bulk <- spat$rap_NO_NO2_bulk*spat$NO2_bulk
spat$probNO2_peak <- 1-pnorm(40,mean=spat$NO2_peak,sd=13.31994)
spat$probNO2_bulk <- 1-pnorm(40,mean=spat$NO2_bulk,sd=11.415134)

setwd('C:/Users/demo/OneDrive - UCL/PROJET NOx/generate')
write.table(spat,"SPATbxl.dbf",row.names = FALSE,quote = FALSE, sep = "\t", dec = ",")
