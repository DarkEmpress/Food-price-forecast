df = read.csv("F:\\vit\\YEAR 3\\SEM 6\\ess of data anal\\DA\\assignment\\wfp_food_prices_lka.csv")
head(df)
summary(df)
nrow(df)
ncol(df)
df=df[-1,]
print(nrow(df))
#install.packages("dplyr")
library(dplyr)
df=na.omit(df)
any(is.na(df))
if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
library(lubridate)
library(dplyr)
df$date <- as.Date(df$date)
df <- df %>%mutate(year = year(date),month = month(date))
df <- select(df, -date)
head(df)
unique_currencies=unique(df$currency)
unique_currencies #has 1 unique value
unique_pricetype=unique(df$pricetype)
unique_pricetype #has 2 unique values
unique_priceflag=unique(df$priceflag)
unique_priceflag

df$price=as.numeric(df$price)
df$usdprice=as.numeric(df$usdprice)
df$latitude=as.numeric(df$latitude)
df$longitude=as.numeric(df$longitude)

#finding correlation between all values and target variables
#create a dataset using numerical columns
library(corrplot)
num_df=select(df,price,usdprice,year,month)
head(num_df)
cor_df=cor(num_df)
cor_df
corrplot(cor_df, method="color")


#drop columns that have a lower correlation values 
df=df %>% select(-usdprice, -currency)
df=df %>% select(-priceflag)
df=df %>% rename(province=admin1, district=admin2)

class(df$province)
class(df$district)
class(df$market)
class(df$latitude)
class(df$longitude)
class(df$category)
class(df$commodity)
class(df$unit)
class(df$price)
class(df$year)
class(df$month)
head(df)
summary(df)
nrow(df)
ncol(df)
#one hot encoding all the categorical values since linear model requires numerical values
library(caret)
dummy <- dummyVars(" ~ .", data = df)
df2<- data.frame(predict(dummy, newdata = df))
head(df2)


#extract test and train
X <- select(df2, -price)
# Extract the target variable (Y)
Y <- df2$price
head(X)
head(Y)
dim(X)
# Set a random seed for reproducibility
set.seed(123)
# Create a train-test split (adjust the ratio as needed)
train_indices <- sample(1:nrow(df2), 0.5 * nrow(df2))
test_indices <- setdiff(1:nrow(df2), train_indices)
# Create train and test datasets
train_X <- X[train_indices, ]
train_Y <- Y[train_indices]
test_X <- X[test_indices, ]
test_Y <- Y[test_indices]

#linear model
library(stats)
model <- lm(train_Y ~ ., data = train_X)

#predictions
test_predictions <- predict(model, newdata = test_X)

#checking for accuracy
test_Y=as.numeric(test_Y)
actual_mean <- mean(test_Y)
total_variance <- sum((test_Y - actual_mean)^2)
model_variance <- sum((test_predictions - actual_mean)^2)
r_squared <- model_variance / total_variance
# Convert R-squared to percentage
accuracy_percentage <- r_squared * 100
accuracy_percentage

#since the accuracy is too high let us check for over fitting 
#get list of residuals 
res <- resid(model)
#produce residual vs. fitted plot
plot(fitted(model), res, pch=20, cex=0.5)
#add a horizontal line at 0 
abline(0,0)

train_predictions <- predict(model, newdata = train_X) 
#checking for accuracy
train_Y=as.numeric(train_Y)
actual_mean <- mean(train_Y)
total_variance <- sum((train_Y - actual_mean)^2)
model_variance <- sum((train_predictions - actual_mean)^2)
r_squared <- model_variance / total_variance
# Convert R-squared to percentage
accuracy_percentage <- r_squared * 100
accuracy_percentage



