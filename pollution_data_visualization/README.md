# Pollution Data Visualization on European Industries

## Overview
This project aims to visualize the environmental impact of various industries across Europe, focusing on metrics such as pollution, resource depletion, and sustainability. It uses **Tableau** to provide an interactive dashboard that helps policymakers, environmentalists, and businesses understand the environmental footprint of different sectors. The data covers industries' impact on key environmental areas such as water production, biodiversity, and human health.

## Purpose
The main goal is to offer a visual tool that enables stakeholders to analyze the pollution data of European industries. By comparing the environmental impact across industries and countries, this project aims to aid the **Environmental Council of the European Union** and other policymakers in developing informed policies for sustainability and resource management.

## Key Components
### Data Sources:
- **Corporate Environmental Impact**: Data from a comprehensive study by David Freiberg et al. (2021), which calculates environmental impacts across various domains like human health, biodiversity, and water production capacity.
- **Sustainalytics ESG Data**: Environmental risk scores based on each company's environmental footprint, providing a comparative analysis across firms.

### Data Preparation:
- **ETL Process**: Data cleaning, filtering, and feature engineering were done using Python and Jupyter Notebooks.
- **Revenue-based Scaling**: Environmental impact metrics were normalized against company revenues, providing a more accurate comparison across firms of varying sizes.

### Visualization:
- **Tableau Dashboard**: The interactive dashboard allows users to filter by country, industry, and environmental metrics. It offers:
  - A **trend analysis** of environmental impact over time.
  - A **geographic comparison** of environmental intensities.
  - Industry-level insights into specific areas like water usage and pollution.
  
### Key Insights:
- **Water Framework Directive**: The dashboard shows which industries and countries have the highest negative impact on water production, with sectors like Utilities and Fossil Fuels standing out for their detrimental effects.
- **Environmental Intensity**: Countries like Portugal, Italy, and Greece show the worst environmental intensity scores, particularly in areas related to water production and resource depletion.

## Technologies Used:
- **Python**: For data extraction, transformation, and loading (ETL).
- **Jupyter Notebooks**: For organizing and documenting the data preparation process.
- **Tableau**: For creating the interactive visualization dashboard.

## Limitations:
- The dataset is incomplete, with certain countries and industries underrepresented. This limits the granularity of the analysis in some cases.
- The project only includes **ESG data for 2019**, which restricts trend analysis for ESG metrics.

## Future Improvements:
- Expanding the dataset to include more countries and industries.
- Allowing the selection of multiple environmental impact areas in the dashboard for more complex analyses.
- Adding a filter to focus exclusively on **EU countries** for more specific policy-making insights.

## Links:
- **Interactive Tableau Dashboard**: [View the Dashboard](https://public.tableau.com/app/profile/freerik.g.tske/viz/PollutionDataonEuropeanIndustries_16729989409400/LandingPage)

## Contributors:
- Ivana Jasna Caltagirone
- Tommaso Ghisini
- Frederik Gøtske
- Arianna Sammarchi
