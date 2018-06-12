#######NEURAL NET FORECAST
###https://cran.r-project.org/web/packages/nnfor/nnfor.pdf
####PACKAGES
install.packages("nnfor")
library(nnfor)


maize <- read.csv("Maize_R.csv")
wm1 <- maize$WM1
head(maize)
head(wm1)
maizets <- ts(maize, start=c(2015, 1), frequency=365.25)
wm1ts <- ts(wm1, start=c(2015, 1), frequency=365)

plot(wm1ts)

tr <- window(wm1ts, start=2015, end=c(2017, 365))
vl <- window(wm1ts, start=2018, end=c(2018,365))
plot(tr)
lines(vl)


#### Extreme Learning Machine neural network
fit <- elm(tr)
plot(fit)
summary(fit)
frc <-forecast(fit,h=59)
plot(frc)
lines(vl)
accuracy(frc,vl)
?elm


fit2 <- elm.thief(tr, allow.det.season = TRUE, h=30)
frc2 <-forecast(fit2,h=30)
plot(fit2)
plot(frc2)
lines(vl)
accuracy(frc2,vl)

fit3 <- elm(tr, allow.det.season = TRUE)
plot(fit3)
frc3 <-forecast(fit3,h=59)
plot(frc3)
lines(vl)
accuracy(frc3,vl)

fit4 <- mlp.thief(wm1ts, allow.det.season = TRUE, h=59)
plot(fit4)
frc4 <-forecast(fit4,h=59)
plot(frc4)
lines(vl)
accuracy(frc4,vl)

plot(fit4)
