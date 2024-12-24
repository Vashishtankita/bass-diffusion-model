# Bass Diffusion Model for Sales Forecasting

# Overview
This repository contains an R script implementing the Bass Diffusion Model, a widely used technique for modeling and forecasting the adoption of new products. The analysis predicts sales growth over time based on parameters like innovation and imitation.

# Key Features of the Analysis
- Data Preparation:
Computes cumulative sales and lagged variables for model inputs.

- Bass Diffusion Model:
Fits a linear regression model to estimate key parameters (N, p, q).
 - N: Total market size.
 - p: Innovation coefficient.
 - q: Imitation coefficient.

- Sales Forecasting:
Predicts sales and cumulative sales for future time periods.

# Output:
 - cumulative_sales_data.csv: Contains cumulative and lagged sales data.
 - sales_forecasts.csv: Forecasted sales and cumulative sales for 50 periods.

# Applications
This analysis can be applied to:
 - Predicting adoption of new products or technologies.
 - Estimating market potential for innovative products.
 - Strategic planning for product launches.
