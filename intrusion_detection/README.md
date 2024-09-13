# 🔐 Statistical Machine Learning for Network Intrusion Detection: UNSW-NB15 Dataset

## Overview
This project investigates the effectiveness of statistical **Machine Learning models** for **Intrusion Detection Systems (IDS)**, specifically focusing on the **UNSW-NB15 dataset**. We utilized **Random Forest** and **XGBoost** algorithms for both **binary** and **multi-class classification** to detect network anomalies and identify potential cybersecurity threats.

## Purpose
The project aims to explore how **Machine Learning models** can improve **network intrusion detection** by classifying traffic as normal or malicious. We sought to answer:  
**"How can Machine Learning models contribute to the prediction and identification of anomalies within a network?"**

## Key Features
- **Data Preprocessing**: Cleaned and prepared the UNSW-NB15 dataset, applied **one-hot encoding** for categorical variables, and scaled numerical features for model accuracy.
- **Binary Classification**: We implemented **Logistic Regression**, **Random Forest**, and **XGBoost** to classify network traffic as normal or attack.
- **Multi-class Classification**: Extended the analysis to predict different types of attacks, including **DoS**, **Exploits**, **Reconnaissance**, and **Worms**.
- **Exploratory Data Analysis (EDA)**: Examined key features such as **Time-To-Live (TTL)** and **Source-to-Destination Bytes**, which were identified as highly relevant for predicting attacks.

## Key Findings
- **Binary Classification**: Logistic Regression achieved an **F1-score of 97%**, while Random Forest and XGBoost provided comparable performance, with **Random Forest** being slightly more robust.
- **Multi-class Classification**: XGBoost achieved a **weighted average F1-score of 95%**, though certain underrepresented attack types like **Backdoor** and **Worms** were more difficult to classify.
- **Feature Importance**: **TTL** and **Source-to-Destination Bytes** were the most important features across models, highlighting their role in network anomaly detection.

## Technologies Used
- **Python**: For data preprocessing, model training, and evaluation.
- **Libraries**: `pandas`, `scikit-learn`, `XGBoost`, `matplotlib`, `seaborn`.
- **Machine Learning Models**: Logistic Regression, Random Forest, XGBoost.

## Future Work
- Addressing **class imbalance** by using advanced techniques such as **SMOTE**.
- Testing models on real-world data instead of synthetic datasets like UNSW-NB15 to better understand real-time performance.
- Incorporating **ensemble methods** to further improve model robustness.

## Authors
- **Ivana Jasna Caltagirone**
- **Piotr Drapinski**
- **Nikolaj Viktor Brøchner Pettersson**
- **Arianna Sammarchi**
