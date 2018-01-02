# Reading data;

mos.2013 <- read.csv("moscow.2013.csv", h=TRUE)

# Checking dataset dimensions and variable names;

dim(mos.2013)
# [1] 3597   35

colnames(mos.2013)
#  [1] "UIK"                   "UIK.NO"                "VOTERS"               
#  [4] "BALL.RECEIVED"         "BALL.ISS.STATION"      "BALL.ISS.EXTRA"       
#  [7] "BALL.CANCELLED"        "BALL.PORTABLE_BOXES"   "BALL.STATIONARY_BOXES"
# [10] "BALL.INVALID"          "BALL.VALID"            "ABSENT.RECEIVED"      
# [13] "ABSENT.ISS.UIK.BEFORE" "VOTED_WITH_ABSENT"     "ABSENT.UNUSED"        
# [16] "ABSENT.ISS.TIK"        "ABSENT.LOST"           "BALL.LOST"            
# [19] "BALL.NOT_RECORDED"     "DEGTIAREV"             "DEGTIAREV.pct"        
# [22] "LEVICHEV"              "LEVICHEV.pct"          "MELNIKOV"             
# [25] "MELNIKOV.pct"          "MITROKHIN"             "MITROKHIN.pct"        
# [28] "NAVALNYI"              "NAVALNYI.pct"          "SOBIANIN"             
# [31] "SOBIANIN.pct"          "URL"                   "DISTRICT.NO"          
# [34] "DISTRICT.01"           "DISTRICT"             

# Adding calculable variables;

mos.2013$TURNOUT <- (mos.2013$BALL.VALID + mos.2013$BALL.INVALID)/mos.2013$VOTERS
mos.2013$SOBIANIN.sh <- mos.2013$SOBIANIN/(mos.2013$BALL.VALID + mos.2013$BALL.INVALID)

# Comtrol plots;

# Basic Sobianin-Sukhovolskii plot for the winner;

png("ss.moscow.2013.png", height=500, width=500)
plot(mos.2013$TURNOUT, mos.2013$SOBIANIN.sh,
xlim=c(0,1), ylim=c(0,1),
pch=20, cex=sqrt(mos.2013$BALL.VALID + mos.2013$BALL.INVALID)/25, col=rgb(0,0,0,.3),
main="Выборы мэра Москвы, 8 сентября 2013 г.", xlab="Явка на участке", ylab="Доля голосов за С.С.Собянина")
abline(v=seq(0,1,.1), lty=3, col="grey")
abline(h=seq(0,1,.1), lty=3, col="grey")
dev.off()

# Voters' turnout histograms;

# 0.1% bin;

png("th.moscow.2013.001.png", height=500, width=500)
hist(mos.2013$TURNOUT, 
xlim=c(0,1), 
breaks=seq(-.0005, 1.0005, .001),
main="Выборы мэра Москвы, 8 сентября 2013 г.", xlab="Явка на участке", ylab=paste("Количество участков (N=",nrow(mos.2013),") с такой явкой", sep=""))
dev.off()

# 1% bin;

png("th.moscow.2013.01.png", height=500, width=500)
hist(mos.2013$TURNOUT, 
xlim=c(0,1), 
breaks=seq(-.005, 1.005, .01),
col="grey",
main="Выборы мэра Москвы, 8 сентября 2013 г.", xlab="Явка на участке", ylab=paste("Количество участков (N=",nrow(mos.2013),") с такой явкой", sep=""))
dev.off()
