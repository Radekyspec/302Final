# Load necessary libraries
library(ggplot2)

# Read the dataset
data <- read.csv("~/302Final/AmesHousing.csv")

# Fit the linear model
model <- lm(Sale_Price ~ Lot_Frontage + Lot_Area + Year_Sold + Longitude + Latitude, data=data)

# Plot residuals
residuals_plot <- ggplot(model, aes(.fitted, .resid)) + 
  geom_point() + 
  geom_smooth(method='lm', col='red') +
  labs(title='Residual Plot', x='Fitted values', y='Residuals')

# Create QQ plot for normality of residuals
qq_plot <- ggplot(model, aes(sample = .stdresid)) +
  stat_qq() +
  stat_qq_line() +
  labs(title='QQ Plot', x='Theoretical Quantiles', y='Standardized Residuals')

# Print the plots
print(residuals_plot)
print(qq_plot)
