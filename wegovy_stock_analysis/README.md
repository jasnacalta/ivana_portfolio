# 📊 The Wegovy Effect: Assessing News Impact on Novo Nordisk's Stock Prices

## Overview
This project analyzes how news coverage related to Novo Nordisk's groundbreaking weight-loss drug, **Wegovy**, influences the company’s **stock prices**. We collected and examined news articles and financial data to identify patterns in the relationship between **public sentiment** and **market performance**. By combining **sentiment analysis** and **financial data visualization**, we explored how positive and negative media coverage impacts investor behavior. 
Please conslut Project_Dashboards.pbix to visualize the PowerBI Dashboards.

## Purpose
With Wegovy receiving both acclaim and controversy due to its efficacy in obesity treatment, this project aims to answer the research question:  
**"How does Wegovy-related news impact Novo Nordisk’s stock prices?"**  
This project provides insights into how public sentiment drives **short-term stock price fluctuations**.

## Key Features
- **Data Collection**: Extracted over 1,700 news articles from November to December 2023 using `NewsApi` and retrieved stock price data from Yahoo Finance covering 2018-2023.
- **Sentiment Analysis**: Performed sentiment analysis on the news articles using **VADER** to classify them as **positive**, **neutral**, or **negative**.
- **Topic Modeling**: Applied **Latent Dirichlet Allocation (LDA)** to identify key topics discussed in the news, such as **Wegovy’s impact on obesity treatment** and **Novo Nordisk’s financial performance**.
- **Financial Analysis**: Visualized financial trends using **PowerBI**, including stock price changes, volume trends, and moving averages.

## Main Findings
- **Correlation Between News and Stock Prices**: Positive news about Wegovy led to noticeable increases in Novo Nordisk’s stock price, while negative sentiment had a stronger downward impact on stock value.
- **257% Stock Price Growth**: From 2018 to 2023, Novo Nordisk's stock price increased by 257%, largely driven by Wegovy-related news and clinical trials.
- **Impact of Negative News**: Despite positive sentiment being dominant, negative news (such as the introduction of a competitor drug) had a more significant impact on reducing stock prices.

## Technologies Used
- **Python**: For data cleaning, sentiment analysis, and topic modeling.
- **PowerBI**: For data visualization, including sentiment and stock price dashboards.
- **VADER**: For sentiment classification.
- **LDA**: For topic modeling of the news articles.


## Future Work
- Extend the analysis to cover a longer period of time and include multilingual news sources.
- Incorporate additional macroeconomic factors and competitor data to better understand stock fluctuations.


## Authors
- Ivana Jasna Caltagirone, Arianna Sammarchi, Ilaria Uras
