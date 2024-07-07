
# Food Price Forecast

This project combines the power of regression analysis, data cleaning, and exploratory data analysis to develop predictive models for food prices. By employing these techniques, we aim to enhance our ability to forecast prices accurately, providing valuable insights for stakeholders in the dynamic food market.


## Documentation

[Documentation](https://drive.google.com/file/d/1wlaQlkhBv993_k-mU2zZoTBlEqFmXtVB/view?usp=sharing)


## Methodology
### Dataset link: 
https://data.humdata.org/dataset/wfp-food-prices-for-sri-lanka/resource/3638f0d6-9969-48cf-a919-1d879d037ec6

### Data Loading and Exploration:
•	The dataset[5] containing food prices in Sri Lanka was sourced from a CSV file. This involved using the read.csv() function in R to load the data into a data frame.

•	Initial exploration was conducted by examining the first few rows of the dataset using the head() function to get a sense of its structure and contents.

•	Missing values were identified by checking summary statistics or using functions like is.na() to detect any NA values present in the dataset.

### Data Preprocessing:
•	Preprocessing steps were implemented to ensure the dataset's quality and consistency.

•	Unnecessary rows, if any, were removed using techniques such as indexing or filtering.

•	Missing values were handled using the na.omit() function to remove rows with missing values or through imputation methods if appropriate.

•	Date strings were converted to date objects using functions like as.Date() to facilitate temporal analysis.

•	Year and month were extracted from dates using functions like year() and month() from the lubridate package.

•	Numeric columns were converted to appropriate data types using functions like as.numeric() to ensure consistency and facilitate numerical operations.

•	Feature Engineering: Categorical variables were one-hot encoded using the dummyVars() function from the caret package. This process transformed categorical variables into binary dummy variables, allowing them to be used as predictors in the model.

•	Train-Test Split: The dataset was divided into training and testing sets using a 50:50 ratio. This was achieved using random sampling techniques, such as the sample() function, to ensure that both sets were representative of the overall dataset.

### Model Training:

•	A linear regression model was trained using the lm() function from the stats package. This involved specifying the formula for the model, with food prices as the target variable and other features as predictors.

### Model Evaluation:

•	The trained model was evaluated on the test set to assess its predictive accuracy. This was done using the R-squared metric, which measures the proportion of variance in the target variable that is explained by the model.

•	Additionally, residual analysis was performed to check for overfitting. This involved plotting the residuals (the differences between observed and predicted values) against the predicted values to detect any patterns or outliers that may indicate overfitting.

### Result Interpretation:

•	The model achieved high accuracy on the test set, as evidenced by a high R-squared value, indicating its effectiveness in predicting food prices in Sri Lanka.

•	Overfitting analysis showed no significant concerns, indicating that the model's performance is likely to generalize well to new data.

•	These findings affirm the reliability of the model and suggest its potential utility in predicting food prices in Sri Lanka.
