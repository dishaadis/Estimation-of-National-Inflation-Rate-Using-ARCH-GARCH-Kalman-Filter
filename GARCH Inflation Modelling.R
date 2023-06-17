data2010 = data2010[,c(-1)]

Dates= seq(as.Date("2010-01-01"), as.Date("2018-12-01"), "month")
inflasi = xts(data2010, order.by = Dates)
View(inflasi)

#Membuat plot tingkat inflasi
plot(inflasi, main = "Tingkat Inflasi Nasional")

#Uji stasioner menggunakan test Augmented Dickey-Fuller
adf.test(inflasi)
adf.test(diff(inflasi)[-1])

#Model ARIMA (1,1,0)
modelARIMA = arima(inflasi, order=c(1,1,0))
coeftest(modelARIMA)

#Tes efek ARCH
arch.test(modelARIMA)

#Membuat variabel data tingkat inflasi yang telah stasioner
dinflasi = diff(inflasi)[-1]
plot(dinflasi)

#Ovefitting model ARCH-GARCH
#Model ARCH(1)
garch10 = garchFit(~ arma(1,0)+garch(1,0), data = dinflasi, trace=F)
summary(garch10)

#Model GARCH(1,1)
garch11 = garchFit(~ arma(1,0)+garch(1,1), data = dinflasi, trace=F)
summary(garch11)

#Data Simpangan Baku
garch10@sigma.t

#Plot Simpangan Baku
Dates2 = seq(as.Date("2011-02-01"), as.Date("2019-12-01"), "month")
stdev = xts(garch10@sigma.t, order.by = Dates2)
plot(stdev, main = "Simpangan Baku")

#Forecast ARCH(1) 
predict(garch10, n.ahead=12, plot=T, nx=108)

#Forecast ARCH(1) Manual Bulan 2
addmean = -0.01322485
addstdev = 0.07799082
DatesF1 = as.Date("2019-01-01")
meanf = xts(addmean, order.by = DatesF1)
stdevf = xts(addstdev, order.by = DatesF1)
dinflasif=rbind(dinflasi, meanf)
stdevfc=rbind(stdev, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=109)

#Forecast ARCH(1) Manual Bulan 3
addmean = -0.01240995
addstdev = 0.07229929
DatesF2 = as.Date("2019-02-01")
meanf = xts(addmean, order.by = DatesF2)
stdevf = xts(addstdev, order.by = DatesF2)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=110)

#Forecast ARCH(1) Manual Bulan 4
addmean = -0.01366662
addstdev = 0.06104923
DatesF3 = as.Date("2019-03-01")
meanf = xts(addmean, order.by = DatesF3)
stdevf = xts(addstdev, order.by = DatesF3)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=111)

#Forecast ARCH(1) Manual Bulan 5
addmean = -0.01371548
addstdev = 0.06031467
DatesF4 = as.Date("2019-04-01")
meanf = xts(addmean, order.by = DatesF4)
stdevf = xts(addstdev, order.by = DatesF4)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=112)

#Forecast ARCH(1) Manual Bulan 6
addmean = -0.01376067
addstdev = 0.05959187 
DatesF5 = as.Date("2019-05-01")
meanf = xts(addmean, order.by = DatesF5)
stdevf = xts(addstdev, order.by = DatesF5)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=113)

#Forecast ARCH(1) Manual Bulan 7
addmean = -0.01380245
addstdev = 0.05888069
DatesF6 = as.Date("2019-06-01")
meanf = xts(addmean, order.by = DatesF6)
stdevf = xts(addstdev, order.by = DatesF6)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=114)

#Forecast ARCH(1) Manual Bulan 8
addmean = -0.01384066
addstdev = 0.05818074
DatesF7 = as.Date("2019-07-01")
meanf = xts(addmean, order.by = DatesF7)
stdevf = xts(addstdev, order.by = DatesF7)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=115)

#Forecast ARCH(1) Manual Bulan 9
addmean = -0.01387557
addstdev =  0.05749177
DatesF8 = as.Date("2019-08-01")
meanf = xts(addmean, order.by = DatesF8)
stdevf = xts(addstdev, order.by = DatesF8)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=116)

#Forecast ARCH(1) Manual Bulan 10
addmean = -0.0139068
addstdev =  0.05681349
DatesF9 = as.Date("2019-09-01")
meanf = xts(addmean, order.by = DatesF9)
stdevf = xts(addstdev, order.by = DatesF9)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=117)

#Forecast ARCH(1) Manual Bulan 11
addmean = -0.01393484
addstdev =  0.05614564 
DatesF10 = as.Date("2019-10-01")
meanf = xts(addmean, order.by = DatesF10)
stdevf = xts(addstdev, order.by = DatesF10)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=118)

#Forecast ARCH(1) Manual Bulan 12
addmean = -0.01398064
addstdev =   0.05483994
DatesF11 = as.Date("2019-11-01")
meanf = xts(addmean, order.by = DatesF11)
stdevf = xts(addstdev, order.by = DatesF11)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=119)

#Forecast ARCH(1) Manual Bulan 13
addmean = -0.01401362
addstdev = 0.05357218
DatesF12 = as.Date("2019-12-01")
meanf = xts(addmean, order.by = DatesF12)
stdevf = xts(addstdev, order.by = DatesF12)
dinflasif=rbind(dinflasif, meanf)
stdevf=rbind(stdevfc, stdevf)

garch10f = garchFit(~ arma(1,0)+garch(1,0), data = dinflasif, trace=F)
predict(garch10f, n.ahead=1, plot=T, nx=120)

#Menampilkan Hasil Ramalan ARCH(1) Tahun 2020
dinflasif