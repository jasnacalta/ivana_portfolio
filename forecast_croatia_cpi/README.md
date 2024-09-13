# 📈 Forecasting the Croatian Restaurants and Hotels Harmonized Index of Consumer Prices (HCPI)

## Overview
In this project, we forecasted the **Harmonized Consumer Price Index (HCPI)** for Croatian **Restaurants and Hotels** from 2022 to 2025, using advanced time series models. Given the significant role of tourism in Croatia’s economy, this project aims to provide a tool for **price optimization, revenue estimation**, and **resource allocation** for the hospitality industry.

## Purpose
As Croatia's tourism sector bounced back strongly post-COVID and with the country joining the Eurozone, the **HCPI for Hotels and Restaurants** has become a key metric. The goal of this project was to develop a predictive model that forecasts future price trends to help stakeholders make **informed pricing decisions** and **optimize costs**.

## Key Features
- **Dataset**: Monthly HCPI data from **1998 to 2022** obtained from the Federal Reserve Economic Data (FRED).
- **Modeling**: The project used both **Seasonal ARIMA (SARIMA)** and **Exponential Smoothing (ETS)** models to capture the seasonal and trend components of the time series.
- **Time Series Analysis**:
  - **Stationarity testing**: We used **Augmented Dickey-Fuller (ADF)** and **KPSS** tests to check stationarity.
  - **Structural Breaks**: We applied the **QLR** and **OLS-CUSUM** tests to check for structural breaks.
  - **Decomposition**: Time series decomposition into trend, seasonal, and residual components using **STL Decomposition**.
- **Forecast Evaluation**: Models were evaluated using accuracy metrics such as **RMSE**, **MAE**, **MAPE**, and **MASE**. The **SARIMA** model slightly outperformed the ETS model.

## Technologies Used
- **Python**: For data preprocessing and model implementation.
- **Libraries**: `pandas`, `statsmodels`, `sklearn`, `matplotlib`.
- **Modeling Techniques**: SARIMA and ETS models for time series forecasting.

## Key Insights
- The **SARIMA model** achieved lower error metrics than ETS, making it the better fit for the forecast.
- The forecast indicates a **steady rise in the HCPI** for Croatian Hotels and Restaurants post COVID-19, with clear seasonal spikes during the summer months.

## Future Work
- Incorporating external economic variables to improve forecast accuracy.
- Extending the analysis to include more granular regional data within Croatia.


