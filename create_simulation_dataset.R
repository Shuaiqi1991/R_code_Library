#Set working environment
setwd('D:/Sean/H2O')

library("here")
library("data.table")
library("XLConnect")
library("dplyr")
library('ggplot2')
library('reshape2')
library('tweedie')

# Generate simulation dataset

set.seed(44124)
for(j in 0:20) { 
  assign(paste0('dtp',1.5+0.01*j), data.table())
    for(i in 0:20){
      get(paste0('dtp',1.5+0.01*j))[, paste0("phi",550+10*i):= rtweedie(300000, xi = 1.5+0.01*j, mu = 1, phi = 550+10*i)]
                  }
}

# Export data
for(j in 0:20){
  fwrite(get(paste0("dtp",1.5+0.01*j)),
         paste0("D:/Sean/H2O/Data/TEST_DATA/",paste0("dtp",1.5+0.01*j),".csv")
         )
}

# Generate phi around 2000 simulation dataset 

set.seed(44124)
dtp <- data.table()
  for(i in 0:15){
    dtp[, paste0("phi",1500+100*i) := rtweedie(300000, xi = 1.5, mu = 1, phi = 1500+100*i)]
  }

fwrite(dtp, paste0("D:/Sean/H2O/Data/TEST_DATA/","dtp1.5_phi_2k.csv")) 

# CREATE DATA IN SEPERATE STEP
# Create empty data table
for(j in 1:2){
  assign(paste0('tdt',j), data.table())}

# Generate column in every dataset
set.seed(44124)
for(i in 0:40){ 
  tdt1[, paste0("sim",i):= rtweedie(100, xi = 1.5, mu = 1, phi = 400+i*5)]
}
