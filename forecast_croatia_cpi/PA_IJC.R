
library(fpp3)
library(tsibble)
library(forecast)
library(timetk)
library(ggplot2)
library(tidyverse)
library(cowplot)
library(dplyr)
library(urca)
library(strucchange)
library(readxl)
library(readr)
library(AER)
library(tseries)
library(fpp2)
library(stargazer)
library(xts)
library(gets)


#-------------IMPORT DATA, EDA AND TIME SERIES PLOT

tourism_croatia <- read_excel("tourism_croatia2.xls") %>%
  mutate(Date = yearmonth(Date)) %>%
  as_tsibble()

#create time series and specify monthly data
cpi_ts <- ts(tourism_croatia$CPI, start = c(1998,1), end = c(2022,1), frequency = 12)

# time series plot
autoplot(cpi_ts) + 
  ylab("CPI: Hotels and Restaurants") +
  xlab("Year") +
  ggtitle('Hotels and Restaurants CPI in Croatia from 1998-2022')

##seasonal plot
cpi_ts %>%
  as_tsibble() %>%  #converting to tibble
  gg_season() +
  ggtitle("Seasonal Plot of CPI")

#investigating seasonality
cpi_ts %>%
  as_tsibble() %>%  #converting to tibble
  gg_subseries() +
  ggtitle("")

#################METHODOLOGY
#boxcox.lambda minimizes the coefficient of variation for subseries 

#------------TRANSFORMATIONS: BOX COX: lambda = -0.9999
lambda <- BoxCox.lambda(cpi_ts, method = c("guerrero"))
print(lambda)
cpi_ts_bc <- BoxCox(cpi_ts, lambda)
autoplot(cpi_ts_bc) + ggtitle('Box-Cox transformation for CPI, lambda = -0.99')



#------------TRANSFORMATIONS: LOG

cpi_ts_log <- log(cpi_ts)

autoplot(cpi_ts_log)+
  xlab("Year") + 
  ylab("log CPI")

# add column for box-cox transformed data to tourism_croatia

lambda <- BoxCox.lambda(tourism_croatia$CPI)
tourism_croatia <- tourism_croatia %>%
  mutate(cpi_bc = BoxCox(CPI, lambda))

# add column for log transformed data to tourism_croatia
tourism_croatia$log_cpi <- cpi_ts_log


# Decomposition - classical
#cdecomp<- decompose(cpi_ts_bc, type = "additive")
#autoplot(cdecomp) +
#  labs(title = "Additive decomposition")

# Decomposition - STL

stldecomp <- stl(cpi_ts_bc, s.window = "periodic", robust = TRUE)

# Plot the components
autoplot(stldecomp) + 
  labs(title = "STL decomposition")

# Decomposition - SEATS
#tourism_croatia %>%
#  model(seats = X_13ARIMA_SEATS(cpi_bc ~ seats())) %>%
#  components() %>%
#  autoplot()


#ACF & PACF plots --> applied to bc transformed data
#examining autocorrelations

# ACF - all lags significant, slowly decaying --> trend, decreasing correlation btw series and past values
tourism_croatia %>%
  ACF(cpi_bc) %>%
  autoplot() + labs(title = "ACF")


tourism_croatia %>%
  PACF(cpi_bc) %>%
  autoplot() + labs(title = "PACF")


# Box pierce test for autocorrelation
tourism_croatia %>%
  features(cpi_bc, box_pierce, lag=24, dof=0)


#p-value is 0, which indicates strong evidence against the null hypothesis of no autocorrelation 
#in the residuals. This suggests that there is significant autocorrelation 
#present in the residuals of the time series model. Therefore, the model may not adequately capture 
#the temporal dependencies in the data


###################


#investigating stationarity 
#Data presents clear trend and seasonality, hence the right model for the KPSS and ADF test
#is a random walk with drift and trend (type “tau” in KPSS and “trend” in ADF). To have a more
#conservative ADF test, the lags have been selected with the Akaike Information Criterion.

#KPSS test
summary(ur.kpss(tourism_croatia$cpi_bc, type = "tau"))
#ts=1 > cvs 
#Reject H0, data is not stationary


#ADF test
summary(ur.df(tourism_croatia$cpi_bc, type = "trend", selectlags = "AIC", lags = 24))


#The first value of t-statistic is larger than the critical value 
#for tau3, hence accept the null hypothesis (time series has a unit root).
#The second t-stat-value is larger than the critical value for phi2, we cannot reject null hypothesis (data has a unit root, but no drift and no trend)
#The last t-stat-value was larger than the value for phi3, 
#therefore the null hypothesis (data has a unit root but no trend) is not rejected.


#This suggests that at the time series can be described by a random walk with absent drift and absent trend.


#############DIFFERENCING


#nr differenciations needed: 1
unitroot_ndiffs(tourism_croatia$cpi_bc)
# no need of seasonal differencing
unitroot_nsdiffs(tourism_croatia$cpi_bc)

#FIRST DIFFERENCING
tourism_croatia %>%
  mutate(cpi_bc_diff = difference(cpi_bc)) -> tourism_croatia_diff

tourism_croatia_diff <- subset(tourism_croatia_diff, cpi_bc_diff!="NA")
#test with KPSS and ADF again to check for stationarity

summary(ur.df(tourism_croatia_diff$cpi_bc_diff, type = "trend"))
#ts < cv:reject, stationary

summary(ur.df(tourism_croatia_diff$cpi_bc_diff, type = "drift"))
#ts<cv:reject, stationary

summary(ur.kpss(tourism_croatia_diff$cpi_bc_diff, type = "tau"))
#ts < cv: stationary

summary(ur.kpss(tourism_croatia_diff$cpi_bc_diff, type = "mu"))
#ts < cv: stationary

unitroot_ndiffs(tourism_croatia_diff$cpi_bc_diff)


#STRUCTURAL BREAKS: QLR-test and MOSUM, CUSUM tests
# In this case we are going to use an AR(1) regression model 

# QLR test 
tourism_croatia_diff <- tourism_croatia_diff %>% 
  mutate(l1.cpi_bc = lag(cpi_bc))

qlr <- Fstats(cpi_bc ~ l1.cpi_bc, data = tourism_croatia_diff, from = 0.15)
test <- sctest(qlr, type = "supF")
test
breakpoints(qlr, alhpa = 0.05)
plot(qlr, alpha = 0.1, main = "F Statistics")
lines(breakpoints(qlr))



#seems like there are no structural breaks
#CUSUM

cusum <- efp(cpi_bc ~ l1.cpi_bc, type="OLS-CUSUM", data=tourism_croatia_diff)
plot(cusum)

#OLS-MOSUM
mosum <- efp(cpi_bc ~ l1.cpi_bc, type="OLS-MOSUM", data=tourism_croatia_diff)
plot(mosum)

#there seem to be no structural breaks


## AUTOCORRELATION PLOTS of DIFFERENCED DATA: ACF & PACF    

ACF_diff <- tourism_croatia_diff %>%
  ACF(cpi_bc_diff, lag_max = 48) %>%
  autoplot() + labs(title = "ACF first difference + box-cox")

PACF_diff <- tourism_croatia_diff %>%
  PACF(cpi_bc_diff, lag_max = 48) %>%
  autoplot() + labs(title = "PACF first difference + box-cox")

plot_grid(ACF_diff, PACF_diff, ncol=1)


#FORECAST ARIMA

# Selecting relevant columns
tourism_croatia_bc <- tourism_croatia %>%
  select(-CPI, -log_cpi)

tourism_croatia_bc_diff <- tourism_croatia_diff %>%
  select(-CPI, -log_cpi, -cpi_bc)

# Creating training and testing data
train <- tourism_croatia_bc %>%
  filter_index(~ "2018 mar") %>%
  as_tsibble()
test <- tourism_croatia_bc %>%
  filter_index("2018 apr" ~ .) %>%
  as_tsibble()

# Fitting ARIMA models
fit_arima <- tourism_croatia_bc_diff %>%
  model(
    auto = ARIMA(cpi_bc_diff, stepwise = TRUE, approx = FALSE),
    opt_1 = ARIMA(cpi_bc_diff ~ 0 + pdq(1, 0, 0) + PDQ(0, 1, 2))
  )

# Summarizing model results
fit_arima %>% pivot_longer(everything(), names_to = "Model name", values_to = "Orders")
glance(fit_arima) %>% arrange(AICc) %>% select(.model:BIC)


# Fitting the final ARIMA model
arima_model <- train %>%
  model(auto = ARIMA(cpi_bc ~ 0 + pdq(1, 0, 1) + PDQ(0, 1, 2)))

residualsarima <- arima_model %>%
  dplyr::select(auto) %>%
  augment()

ljung_box_testarima <- residualsarima %>%
  pull(.resid) %>%
  Box.test(lag = 24, type = "Ljung-Box")

# Print the Ljung-Box test results
print(ljung_box_testarima)


#test normality of residuals

# Perform Shapiro-Wilk test on the residuals
shapiro_test_resultarima <- residualsarima %>%
  pull(.resid) %>%
  shapiro.test()

# Print the Shapiro-Wilk test result
print(shapiro_test_resultarima)



#Visualize the time series of residuals and their ACF and PACF plots
arima_model %>%
  dplyr::select(auto) %>%
  gg_tsresiduals(type = "innovation") + 
  ggtitle("Auto ARIMA Residuals")

#forecast arima 

plot_arima <-arima_model %>%
  dplyr::select(auto) %>%
  forecast(test) %>%
  autoplot(tourism_croatia_bc) +
  labs(title = "Forecasts from ARIMA model")
print(plot_arima)


#######################ETS


ets <- train %>% 
  model(
    auto_ets = ETS(cpi_bc),
    opt1 = ETS(cpi_bc ~ error("M") + trend("A") + season("M")),
    opt2 = ETS(cpi_bc ~ error("M") + trend("Ad") + season("A")),
    
  )

# residuals
ets %>% 
  dplyr::select(auto_ets) %>%
  gg_tsresiduals(type = "innovation") + ggtitle("Auto ETS")


#ets %>% 
#  dplyr::select(opt1) %>%
#  gg_tsresiduals(type = "innovation") + ggtitle("ETS(M,A,M)")


#ets %>% 
#  dplyr::select(opt2) %>%
#  gg_tsresiduals(type = "innovation") + ggtitle("ETS(M,Ad,A)")


#ets %>%
#  dplyr::select(opt1) %>%
#  residuals() %>%
#  features(.resid, ljung_box, lag=12, dof=7)

#ets %>%
#  dplyr::select(opt2) %>%
#  residuals() %>%
#  features(.resid, ljung_box, lag=12, dof=7)

#residuals are autocorrelated in all cases


# report auto ets: BEST MODEL
report(ets%>%dplyr::select(auto_ets)) 

# ETS(A,A,A) 
#Alpha (α): The estimated value of alpha is 0.160853. Alpha represents the smoothing parameter for the level component of the ETS model. It determines the weight given to the most recent observation when updating the level. A smaller alpha value implies a slower adaptation to changes and more persistence in the level component.
#Beta (β): The estimated value of beta is 0.007809405. Beta represents the smoothing parameter for the trend component of the ETS model. It controls the weight given to the most recent trend estimate when updating the trend. A smaller beta value indicates a slower adaptation to changes and more persistence in the trend component.
#Gamma (γ): The estimated value of gamma is 0.4747733. Gamma represents the smoothing parameter for the seasonal component of the ETS model. It determines the weight given to the most recent seasonal estimate when updating the seasonal component. A smaller gamma value implies a slower adaptation to seasonal changes and more persistence in the seasonal component.

##################################
#AIC      AICc       BIC        ##
#-2858.389 -2855.669 -2799.006  ##
##################################

##report opt1
#report(ets%>%dplyr::select(opt1)) 

##################################
#AIC      AICc       BIC        ##
#-2795.434 -2792.714 -2736.052  ##
##################################

##report opt2
#report(ets%>%dplyr::select(opt2))

##################################
#AIC      AICc       BIC        ##
#-2805.863 -2802.809 -2742.988 ##
##################################




# forecasting on the test set with the best ETS model(A,A,A)
ets_model <- train %>%
  model(
    ets_final = ETS(cpi_bc ~ error("A") + trend("A") + season("A"))
  )


residualsets <- ets_model %>%
  dplyr::select(ets_final) %>%
  augment()


ljung_box_testets <- residualsets %>%
  pull(.resid) %>%
  Box.test(lag = 24, type = "Ljung-Box")

# Print the Ljung-Box test results
print(ljung_box_testets)


#test normality of residuals

# Perform Shapiro-Wilk test on the residuals
shapiro_test_resultets <- residualsets %>%
  pull(.resid) %>%
  shapiro.test()

# Print the Shapiro-Wilk test result
print(shapiro_test_resultets)


plot_ets <- ets_model %>%
  select(ets_final) %>%
  forecast(test) %>%
  autoplot(tourism_croatia_bc) +
  labs(title = "Forecasts from ETS model")

print(plot_ets)




###PLOT all models
fit_all <- train %>%
  model(
    'ETS(A,A,A)' = ETS(cpi_bc ~ error("A") + trend("A") + season("A")),
    'ARIMA(1,0,1)(0,1,2)' = ARIMA(cpi_bc ~ 0 + pdq(1,0,1) + PDQ(0,1,2))
  )


fc_all <- fit_all %>% forecast(test)

fc_all %>%
  autoplot(tourism_croatia_bc,level = NULL) +
  guides(colour = guide_legend(title = "Forecast")) +
  labs(title = "ARIMA vs ETS", y = "CPI", x = "Time")

##PLOT ARIMA FORECAST 4 YEARS

tourism_croatia <- subset(tourism_croatia, select = -c(cpi_bc, log_cpi))

forecast_arima <- tourism_croatia %>%
  model(auto = ARIMA(CPI ~ 0 + pdq(1, 0, 1) + PDQ(0, 1, 2)))

forecast_arima %>%
  dplyr::select(auto) %>%
  forecast(h = 48) %>%
  autoplot(tourism_croatia)+
  labs(title = 'Forecast of Restaurants and Hotels HCPI: Croatia', x = 'Time', y = 'Value')

######################Comparison of ARIMA to ETS
# accuracy of the best ARIMA model
accuracy_arima <- arima_model %>%
  dplyr::select(auto) %>%
  forecast(test) %>%
  accuracy(tourism_croatia_bc)

# accuracy of the best ETS model
accuracy_ets <- ets_model %>% 
  dplyr::select(ets_final) %>%
  forecast(test) %>%
  accuracy(tourism_croatia_bc)

accuracy_arima
accuracy_ets



