#### This is the code for checking data taken from CEO####
nfi<-read.csv( "ceo-NFI-ART-TREES-Data-Collection-2012-2021-sample-data-2023-08-03.csv",header=T)
names(nfi)
# 9-7 points Intact forest
# 6-4 points Degraded Forest
# 1-3 points Very Degraded Forest
nfi_leaf<-nfi[,c(1,2,3,4,12,20,21,36,46,48)]
nfi_leaf$status<-ifelse(nfi_leaf$Number.of.tree.covered.samples..2021.>6,"Intact",
                        ifelse(nfi_leaf$Number.of.tree.covered.samples..2021.>3,"Degraded","Very Degraded"))
library(dplyr)
dat<-nfi_leaf %>% distinct(plotid, .keep_all = TRUE)
dat1<-dat %>% group_by(status)%>% 
  summarise(biomasa_ad= mean(pl_total_biom_ad_ton_ha),
            count=n())
table(dat$State.of.forest.in.year.of.date_measurement)
dat2<-dat %>% group_by(pl_phy_name) %>% 
  summarise(biomasa_ad= mean(pl_total_biom_ad_ton_ha),
            count=n())
sum(dat2$count)
