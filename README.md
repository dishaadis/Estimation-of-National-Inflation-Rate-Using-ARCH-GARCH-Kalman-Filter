<p align="center">
<h1>Estimation of National Inflation Rate Using ARCH-GARCH Kalman Filter</h1>
</p>
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
  
  ![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/f0189a17-8354-4558-8928-a83586245284)

</div>
<p align="justify">
Visually it can be seen that the time series plot of national inflation rate data has an irregular and fluctuating pattern so that the data can be categorized into data that is not stationary concerning the mean. In addition, it can be seen that the data does not fluctuate around the median value, and the trend does not follow the horizontal axis. So the national inflation rate data is not stationary concerning the mean.
</p>
<div align="center">
  
  ![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/f258cf31-3954-4bd2-9728-ea5aebd3073a)

</div>
<p align="justify">
The Box-Cox plot shows the value of λ with a 95% confidence value between -0.43 and 0.62 with an estimated value of 0.07 and a rounded value of 0. This shows that the national inflation rate data is not stationary concerning the variance because the rounded value is not equal to 1. To overcome this problem, a Box-Cox Transformation can be performed to obtain a rounded value equal to 1.
</p>

## Analysis Results
### 1. Stasionarity
#### 1.1 Stationarity of Variance
<p align="justify">
It is known that the national inflation rate is not stationary with respect to the variance, it is necessary to carry out a transformation using the following formula:
<p align="center">
  $Y_t = ln(X_t)$ 
</p>
</p>

#### 1.2 Stationarity of Mean
<p align="justify">
Stationarity of time series data can be done by carrying out the Augmented Dickey-Fuller (ADF) test. The Augmented Dickey-Fuller test is a formal concept introduced by David Dickey and Wayne Fuller to determine whether data has a unit root. Based on the time series plot, it can be seen that the national inflation rate is not stationary concerning the mean, so it is necessary to do differencing on the national inflation rate data. Differentencing can be done with the following formula:
<p align="center">
  $Z_t = Y_t - Y_{t-1}$ 
</p>
After transformation and differencing, to prove the stationary national inflation rate data, it is necessary to carry out the Augmented Dickey-Fuller (ADF) test with the following results:

<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/19e554a6-d57c-435d-ad67-8af4a853e622)

</div>

Based on the second Augmented Dickey-Fuller (ADF) test, it is proven that the national inflation rate data is stationary concerning the variance and the mean, so the inflation rate data can be continued by identifying the ARIMA model by checking the ACF (Autocorrelation Function) plot and PACF (Partial Autocorrelation Function).
</p>

### 2. ARIMA Model Identification
<p align="justify">
In determining the model, the lag that comes out on the PACF plot determines the AR model, while the lag that comes out on the ACF plot determines the MA model. It can be seen that the PACF plot exits at lags 1 and 12, while the ACF plot exits at lags 1 and 12.
<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/6213e3c8-186f-41ee-9fac-071d8bcef305) ![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/4fb71d76-f36a-436a-9d2a-09ee624279e1)

</div>  
Based on the significant lag in the PACF plot and ACF plot, several ARIMA models can be identified, including the following:
<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/52febe3c-387d-484d-939b-d779a2e5ab34)

</div>
<p align="justify">
Based on the table above, it can be seen that the ARIMA model (1,1,0) meets the assumptions of the significance test and the white noise test. However, of the significant ARIMA models, none of the ARIMA models satisfies the normality test. Abnormalities from these residuals may indicate a condition of heteroscedasticity which indicates an ARCH-GARCH process. So, of the four significant ARIMA models, the ARIMA model (1,1,0) was chosen to be the best ARIMA model. Because the ARIMA(1,1,0) model contains abnormalities, a heteroscedasticity test is performed using the Ljung-Box formula from the square of the residual. The heteroscedasticity test on the ARIMA(1,1,0) model is carried out as follows:
</p>
<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/a1076db2-be1d-43d7-ac67-0421d2f35850)

</div>
<p align="justify">
Because the residual square of the ARIMA model (1,1,0) is heteroscedastic, it is less efficient to predict national inflation rate data using the ARIMA model. To get better prediction results, it is necessary to do time series modeling that considers the presence of heteroscedasticity, namely the ARCH-GARCH model.
</p>

### 3. ARCH-GARCH Model Identification
<p align="justify">
The first ARCH-GARCH model was developed by plotting the ACF and PACF squared residuals. The ACF plot shows cuts off at lags 1 and 12, and the PACF plot shows cuts off at lags 1 and 12.
</p>
<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/ef26deb9-1f5c-4898-9c8a-3ad5ece909df)

</div>
<p align="justify">
Based on the significant lag in the PACF plot and the squared residual ACF plot, several GARCH models, including the ARCH(1) and GARCH(1,1) models, can be identified. The best model is the model that has significant parameters and the smallest AIC value.
</p>
<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/084675c0-82a4-41f8-b64a-b54828a7e603)

</div>
<p align="justify">
The results of the analysis show that the best models for national inflation rate data are the ARIMA (1,1,0) model and the ARCH (1) model. The national inflation rate model can be written as follows:

ARIMA (1,1,0) Model:
<p align="center">
  $Z_t = 0,107501 Z_t + u_t$  with $Z_t = Y_t + Y_{t-1}$ and $Y_t = ln(X_t)$
</p>
ARCH (1) Model :
<p align="center">
  $σ_t^2 = 0,004993 + 0,928125 u_{t-1}^2$ 
</p>
</p>

### 4. Application of Kalman Filters for Error Correction
<p align="justify">
In forecasting the national inflation rate using the ARCH(1) model, the MAPE value is 34.662%. From the MAPE calculation results, it can be concluded that the ARCH(1) model needs to be better because the MAPE value is > 10%. The application of the Kalman Filter is an estimate with a prediction step one step ahead and then corrected with actual data so that the error value can be estimated using the magnitude of the covariance value, namely system noise and measurement noise. With the assumed covariance value, it is expected that there will be an influence on the estimation of the national inflation rate. The error-degree polynomial equation is used to correct the MAPE value in the forecasting results of the ARCH(1) model by using partial data $u_i$, namely the difference between the forecast data and the actual data $m_i$. In the national inflation rate data, a Kalman filter with a degree 1 polynomial is applied, and a Kalman filter with a degree 2 polynomial. Kalman Filter stages can be written as follows:
</p>

Prediction Stage :
<p align="center">
$x ̂_{t ̅+1}   =A_t x ̂_t$
</p>

<p align="center">
$P_{t ̅+1}=A_t P_t A_t^T+Q_t$
</p>

Correction Stage :
<p align="center">
$K_{t+1}=P_{t ̅+1} H_{t+1}^T (H_{t+1}  P_{t ̅+1}  H_{t+1}^T +R_{t+1} )^{-1}$
</p>

<p align="center">
$x ̂_{t+1}=x ̂_{t ̅+1}+K_{t+1} [z_{t+1}-H_{t+1} x ̂_{t ̅+1}]$
</p>

<p align="center">
$P_{t+1}=[I-K_{t+1} H_{t+1}] P_{t ̅+1}$  
</p>
</p>

### 5. Comparison of the Kalman ARCH and ARCH Filter Models
<p align="justify">
At this stage, the ARCH model has been tested, and the forecasting results improved by using the Kalman filter for degree 1 and 2 polynomials. Based on the simulations performed, each model has its own estimated error value. Therefore, it is necessary to carry out an evaluation stage to determine the best model by comparing the MAPE values ​​of each model. MAPE is a measure of error that can be calculated by finding the mean percentage absolute error ratio with the actual data. Following are the results of the MAPE values ​​of each model.
</p>
<div align="center">
  
![image](https://github.com/dishaadis/Estimation-of-National-Inflation-Rate-Using-ARCH-GARCH-Kalman-Filter/assets/82490582/fca4baad-17bc-496e-9f3e-7d9eba67e5ee)

</div>
<p align="justify">
The table above shows that the best MAPE value results are obtained after applying the Kalman Filter which is marked by the MAPE value which is small and close to the actual data. In addition, it can be seen that for each Q value and R value taken in the application of the Kalman Filter the MAPE value becomes smaller when the degree of the polynomial increases.
</p>
