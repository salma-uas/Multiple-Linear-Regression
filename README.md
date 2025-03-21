# Multiple Linear Regression Analysis on Cereal and Car DataSet

**Overview**

This repository contains R scripts for performing multiple linear regression analysis on two datasets:

  - Cereals: Analyzing nutritional ratings based on various factors such as sugar, fiber, and shelf placement.
  - Cars93: Investigating car prices based on multiple attributes and model selection techniques.

**Dataset Descriptions**
  
  - Cereals Dataset
    - Contains nutritional information for 77 breakfast cereals.
    - The goal is to estimate the nutritional rating using variables such as sugar content, fiber content, and shelf placement.

   - Cars93 Dataset (from the MASS library)
      - Contains information on 93 different car models.
      - The objective is to analyze how various factors influence the price of cars using regression models.

 **Model Comparison Method**
  - Akaike Information Criterion (AIC)
  - Schwarz-Bayes Information Criterion (SBC/BIC)
  - Mallows Cp Criterion
  
  **Variable Selection Method**

  - Backward Elimination
  - Forward Selection
  - Stepwise Selection

  **Requirements**
Ensure you have the necessary R packages installed:

    "install.packages("MASS")"
    "install.packages("rgl")"
