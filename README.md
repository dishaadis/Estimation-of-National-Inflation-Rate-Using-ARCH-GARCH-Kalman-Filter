# Estimation of National Inflation Rate Using ARCH-GARCH Kalman Filter

<p align="center">
Undergraduate Final Project on behalf of Radisha Fanni Sianti
</p>

## Abstract
<p align="justify">
The national inflation rate is an important indicator in analyzing a country's economic growth. Inflation rates that are managed properly can prevent a country's economy from declining. In the national inflation rate data, the ARIMA (Autoregressive Integrated Moving Average) model was used, and heteroscedasticity was detected, so the ARCH-GARCH (Autoregressive Conditional Heteroskedasticity-Generalized Conditional Heteroskedasticity) time series model was used. The appropriate model is ARCH(1), with a very large MAPE (Mean Absolute Percentage Error) value of 34.662%. Therefore, error correction is carried out using the Kalman Filter to get a smaller error value. The final results show that the Kalman Filter can improve the estimation results marked by the MAPE ARCH-Kalman Filter value being smaller than the ARCH model. The best estimation result on the national inflation rate data is the Kalman Filter polynomial of degree 2 with a value of Q=R=0.01, with the smallest MAPE value of 1.0035%.
</p>

## Dataset
<p align="justify">
The data used is national inflation rate secondary data from the official website of Bank Indonesia from January 2011 to December 2020. The data is divided into 2, namely in-sample data and out-sample data. The in-sample data used is 108 (January 2011 – December 2019), while the out-sample data is 12 (January 2020 – December 2020). In-sample data is used to construct the model, and out-sample data is used to check the model's accuracy. In this study, the national inflation rate data is represented by $X_t$.
</p>

## Visualization of National Inflation Data
<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/1c1c4d90-4639-4ef6-8a62-02e5701e01cc)

</div>
<p align="justify">
Visually it can be seen that the time series plot of the national inflation rate data has an irregular and fluctuating pattern so that the data can be categorized into data that is not stationary concerning the mean. In addition, it can be seen that the data does not fluctuate around the median value, and the trend does not follow the horizontal axis. So it can be concluded that the national inflation rate data is not stationary.
</p>

## Analysis Results
### 1. Stasionarity
<p align="justify">
Stationarity of time series data can be done by carrying out the Augmented Dickey-Fuller (ADF) test. The Augmented Dickey-Fuller test is a formal concept introduced by David Dickey and Wayne Fuller to determine whether data has a unit root. Based on the time series plot, it can be seen that the national inflation rate is not stationary concerning the mean, so it is necessary to do differencing on the national inflation rate data. Differentencing can be done with the following formula:
<p align="center">
  $Z_t = Y_t - Y_{t-1}$ 
</p>

</p>




















<p align="justify">
</p>
<p align="justify">
</p>
<p align="justify">
</p>



