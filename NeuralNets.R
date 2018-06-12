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



####
fit <- elm(wm1ts)
print(fit)
plot(fit)
frc <-forecast(fit,h=90)
plot(frc)

fit2 <- elm.thief(wm1ts)
frc2 <-forecast(fit2,h=45)
plot(frc2)

fit3 <- elm(wm1ts, allow.det.season = TRUE)
frc3 <-forecast(fit3,h=365)
plot(frc3)

fit4 <- mlp(wm1ts, allow.det.season = TRUE)
frc4 <-forecast(fit4,h=365)
plot(frc4)
plot(fit4)
