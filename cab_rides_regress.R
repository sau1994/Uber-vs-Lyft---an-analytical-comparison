library(tidyverse)
library(ggplot2)
library(dplyr)

cab_rides <- read.table("C:/Users/saura/Documents/statcomp_project/cab_rides.csv", header = TRUE, sep = ",")
head(cab_rides)

model_cab_weather <- lm(price ~ temp_avg + pressure_avg + humidity_avg, data = cab_rides)
summary(model_cab_weather)

uber_df <- cab_rides %>% filter(cab_type == "Uber")
head(uber_df)

model_uber_weather <- lm(price ~ temp_avg + pressure_avg + humidity_avg, data = uber_df)
summary(model_uber_weather)

lyft_df <- cab_rides %>% filter(cab_type == "Lyft")
head(lyft_df)

model_lyft_weather <- lm(price ~ temp_avg + pressure_avg + humidity_avg, data = lyft_df)
summary(model_lyft_weather)

#============== Price vs Distance ===================#

model_uber_distance <- lm(price ~ distance, data = uber_df)
summary(model_uber_distance )

model_lyft_distance <- lm(price ~ distance, data = lyft_df)
summary(model_lyft_distance )







