library(here)
library(tidyverse)
library(broom)
library(mosaicData)

# We will use the RailTrail data as an example for linear regression with a single predictor
glimpse(RailTrail)

# Visualizing the relationship between ridership (volume) and high temperature
ggplot(data = RailTrail, aes(x = hightemp, y = volume)) +
  geom_point() 

# Adding in the least squares regression line
ggplot(data = RailTrail, aes(x = hightemp, y = volume)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) # lm for linear model

# Calculate the least squares regression model
m_vol_htemp <- lm(volume ~ hightemp, data = RailTrail)
m_vol_htemp

# Summarizing the linear model
summary(m_vol_htemp)

# Making a prediction for a single new observation of high temperature
newtemp <- tibble(hightemp = 53)
predict(m_vol_htemp, newdata = newtemp)

# Making a prediction for multiple new observations
newtemps <- tibble(hightemp = c(50, 60, 70))
predict(m_vol_htemp, newdata = newtemps)

# Tidy the model's statistical findings:
tidy(m_vol_htemp)

# Use Glance to assess the model fit
glance(m_vol_htemp)

# Augment data with model results
augment(m_vol_htemp) %>%
  slice(1:5)

# Residual plot for the RailTrail model
m_vol_htemp_aug <- augment(m_vol_htemp)
ggplot(m_vol_htemp_aug, mapping = aes(x = .fitted, y = .resid)) +
  geom_point(alpha = 0.5) +
  geom_hline(yintercept = 0, color = "blue", lty = 2) +
  labs(x = "Predicted Volume", y = "Residuals")

# Histogram of the residuals
ggplot(m_vol_htemp_aug, mapping = aes(x = .resid)) +
  geom_histogram(binwidth = 50)

# Checking normality of the residuals
library(qqplotr)
ggplot(m_vol_htemp_aug, mapping = aes(sample = .resid)) +
  stat_qq_point(size = 2,color = "red") +
  stat_qq_line(color="green") +
  xlab("Theoretical Quantiles") + ylab("Sample Quantiles")

# Checking normality with the Shapiro Wilk Test
shapiro.test(m_vol_htemp_aug$.resid)

# Calculate a confidence interval for the slope of the regression line
confint(m_vol_htemp)

# Linear model to predict volume from day type:
m_vol_wday <- lm(volume ~ dayType, data = RailTrail)
tidy(m_vol_wday)

