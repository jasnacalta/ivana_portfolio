# ♻️ Intelligent Waste Classification with Deep Learning 🧠

## Overview
This project tackles a growing environmental issue: waste management. 🌍 By leveraging machine learning and deep learning techniques, we developed an automatic garbage classification system to help improve front-end waste sorting. The ultimate goal is to automate and optimize the recycling process, making it faster and more efficient. 🚮

Our model takes images of various waste items and classifies them into six categories: **Cardboard, Glass, Metal, Paper, Plastic, and Trash**. To do this, we explored different **Convolutional Neural Networks (CNN)**, such as **AlexNet** and **ResNet-50**, and compared their performance with baseline models like **Random Forest** and **Support Vector Machine (SVM)**.

## Purpose
🛠️ This project aims to:
- Automate the **garbage classification process** to improve recycling rates.
- Develop a highly accurate model for sorting waste into categories.
- Contribute to environmental efforts by providing tools to achieve **sustainable waste management** practices in line with the EU’s Waste Framework Directive.

## Key Features:
- **Data Preprocessing**: We used the **TrashNet dataset**, with 2527 images in six categories, resized and augmented the data to ensure our models trained effectively.
- **Baseline Models**: We started with **Random Forest** and **SVM** as benchmarks but found that CNNs outperformed them on this dataset.
- **Convolutional Neural Networks**:
  - **AlexNet (M)**: Modified to include batch normalization and dropout layers, achieving a validation accuracy of **47%**.
  - **ResNet-50 (M)**: With transfer learning and regularization, ResNet-50 achieved an

