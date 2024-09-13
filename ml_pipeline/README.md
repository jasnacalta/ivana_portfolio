# 🚗 Data-driven Cloud Solution for B2C Sales Optimization: CarComplements

## Overview
This project focuses on creating a scalable, Azure-based ETL and MLOps solution for **CarComplements**, a leader in automotive safety and accessories. The solution enhances sales prediction accuracy and supports strategic decisions for optimizing **shelf placement**, **pricing**, and **advertising**. The primary goal was to leverage **Machine Learning** and **cloud technologies** to boost revenue and improve operational efficiency across 30 countries.

## Purpose
CarComplements sought to transition from **on-premise data sources** (SAP and Oracle) to a **cloud-based solution** to enable data-driven sales optimization. This project aimed to answer the following key business questions:
1. **Which factors are most influential in predicting sales?**
2. **How can a scalable Azure Cloud be effectively designed for this purpose?**
3. **Which ML models are best suited for decision-making in sales optimization?**

## Key Features
- **Data Analysis & Preprocessing**: Conducted analysis on sales data, including **shelf placement**, **price**, and **advertising**. Feature correlations revealed that shelf location and price were the most influential factors in sales prediction.
- **Machine Learning Models**: Evaluated several models, including **Random Forest**, **Bagging**, **XGBoost**, and **Gradient Boosting**. XGBoost with limited features provided the best results, achieving an **RMSE of 1.34**.
- **Azure Cloud Integration**: Developed a scalable ETL and MLOps pipeline using **Azure Data Factory**, **Azure Synapse Analytics**, **Azure Databricks**, and **Azure Kubernetes** for continuous model training and deployment.

## Business Findings
- **XGBoost** performed the best, providing the most accurate predictions for sales based on **shelf placement**, **price**, and **advertising**.
- Optimizing shelf placement and prices, along with targeted advertising, could significantly boost sales and outperform competitors.
- The transition to a cloud-based **Azure solution** provides scalability, cost-efficiency, and real-time data-driven insights, streamlining sales operations across all departments.

## Technologies Used
- **Azure Cloud Services**: Data Factory, Synapse Analytics, Databricks, Kubernetes.
- **Python**: For data analysis and ML model development.
- **Power BI**: For data visualization and business insights.
- **Machine Learning Models**: XGBoost, Random Forest, Gradient Boosting, Bagging.

## Future Work
- Scale up the cloud infrastructure to support more departments and regions within CarComplements.
- Implement further **cost optimization** strategies within the Azure environment to reduce cloud service expenses by up to **30-40%**.
- Explore additional market segmentation strategies and advertising budget modeling to improve cost-effectiveness of marketing channels.

## Authors
- **Ivana Jasna Caltagirone**
- **Emma Marlene Döffinger**
- **Piotr Drapinski**
