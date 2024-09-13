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
- **Data Preprocessing**: We used the **TrashNet dataset** ([https://www.kaggle.com/datasets/techsash/waste-classification-data](https://www.kaggle.com/datasets/feyzazkefe/trashnet)), with 2527 images in six categories, resized and augmented the data to ensure our models trained effectively.
- **Baseline Models**: We started with **Random Forest** and **SVM** as benchmarks but found that CNNs outperformed them on this dataset.
- **Convolutional Neural Networks**:
  - **AlexNet (M)**: Modified to include batch normalization and dropout layers, achieving a validation accuracy of **47%**.
  - **ResNet-50 (M)**: With transfer learning and regularization, ResNet-50 achieved an impressive **94% accuracy**, making it the best model for this task.

## Why This Matters 🌱
Improper waste classification is a significant bottleneck in the recycling process. By automating this task with AI, we can:
- Reduce the workload on manual sorting.
- Increase the efficiency of recycling plants.
- Support global sustainability initiatives by enabling cleaner waste management.

## Technologies Used:
- **Python**: For data processing and model training.
- **TensorFlow & Keras**: To implement and train the CNN models.
- **TrashNet Dataset**: For training and testing.
- **Data Augmentation**: To improve model generalization by introducing new variations of the waste images.

## Key Insights 📊
- **ResNet-50 (M)** clearly outperforms AlexNet (M), achieving a validation accuracy of **94%**, while AlexNet could only reach **47%**.
- The performance boost with ResNet-50 is attributed to its deeper architecture and the use of transfer learning. This made the model particularly effective in handling the various image categories.
- While CNNs performed well, traditional models like **SVM** and **Random Forest** struggled with this image classification task.

## Future Directions 🚀
- Expanding the dataset to include more waste categories and more images to improve accuracy.
- Optimizing models for deployment in **real-time sorting systems** at recycling plants.
- Exploring the ethical and environmental impacts of using AI at scale in waste management systems.

## Authors:
Ivana Jasna Caltagirone, Luca Boscolo Camiletto, Arianna Sammarchi, Theo Algoud

## Conclusion
This project demonstrates the potential of **deep learning** in revolutionizing waste management. By improving the accuracy of automatic garbage classification, we can significantly enhance the efficiency of recycling processes and contribute to a more sustainable future. 🌎
