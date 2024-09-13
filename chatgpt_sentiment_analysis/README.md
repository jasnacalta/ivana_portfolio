# 📝 Sentiment Analysis of ChatGPT-related Tweets

## Overview
This project delves into the public's reaction to ChatGPT through sentiment analysis of over 47,000 tweets. We explored various models to classify the sentiments expressed in the tweets as **positive**, **neutral**, or **negative**. Our goal was to understand how the public perceives this revolutionary AI, including its applications and potential concerns.

## Purpose
We aimed to answer the question: **What are the primary sentiments expressed by the general public towards ChatGPT?** By applying both supervised and unsupervised learning techniques, this project provides insights into how the public views AI's impact on education, work, and daily life. We also explored the topics discussed in relation to ChatGPT, uncovering trends and concerns.

## Key Features
- **Data Scraping**: Tweets were scraped using the `snscrape` library over a span of four days (April 27-30, 2023).
- **Preprocessing**: We cleaned and preprocessed the tweets, including tokenization, lemmatization, and removal of irrelevant characters.
- **Sentiment Analysis Models**:
  - **VADER**: A lexicon-based sentiment analyzer.
  - **Naïve Bayes & Logistic Regression**: Supervised models to classify sentiments.
  - **RoBERTa**: A pre-trained transformer model fine-tuned for Twitter data.
- **Topic Modeling**: We used **Latent Dirichlet Allocation (LDA)** to discover prominent topics, including **AI and Prompt Usage** and **AI Tools and Writing**.

## Technologies Used
- **Python**: For data scraping, preprocessing, and model implementation.
- **Libraries**: `snscrape`, `VADER`, `sklearn`, `RoBERTa`, `gensim` (for LDA).
- **Visualization**: WordClouds and confusion matrices to visually analyze results.

## Key Insights
- **Naïve Bayes** achieved an accuracy of **74%**, outperforming Logistic Regression in sentiment classification.
- **RoBERTa** revealed a higher percentage of negative sentiment compared to VADER, showing more nuance in sentiment differentiation.
- The most discussed topics were related to **AI tools**, **writing aids**, and **education**, with a mix of excitement and concern.

## Why This Matters
With the rapid rise of AI technologies like ChatGPT, understanding public sentiment is crucial for addressing concerns about data privacy, job displacement, and the ethical implications of AI. This project sheds light on how people view the AI landscape and offers valuable insights for companies and policymakers.

## Future Work
We plan to expand the analysis to include non-English tweets and explore sentiment trends over time. Fine-tuning the sentiment models and applying deep learning approaches like **CNNs** could further enhance accuracy and reveal more intricate patterns in public opinion.

## Authors
Ivana Jasna Caltagirone, Arianna Sammarchi, Luca Boscolo Camiletto
