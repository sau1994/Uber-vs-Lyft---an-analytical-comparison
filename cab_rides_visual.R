library(tidyverse)
library(ggplot2)
library(dplyr)


cab_rides <- read.table("C:/Users/saura/Documents/statcomp_project/cab_rides.csv", header = TRUE, sep = ",")
scatterplot_cr <- ggplot(data = cab_rides) + 
  geom_point(mapping = aes(x = distance, y = price, color = cab_type)) + ggtitle("Cab Ride Price vs Distance") + xlab("Distance (in miles)") + ylab("Price (in USD)")

show(scatterplot_cr) 

str(cab_rides)
head(cab_rides)
summary(cab_rides)

is.null(cab_rides)

uber_df <- cab_rides %>% filter(cab_type == "Uber")
head(uber_df)

lyft_df <- cab_rides %>% filter(cab_type == "Lyft")
head(lyft_df)



lyft_surge <- lyft_df %>% filter(surge_multiplier>1)
head(lyft_surge)

uber_surge <- uber_df %>% filter(surge_multiplier)
head(uber_surge)

lyft_surge$weekdays <- factor(lyft_surge$weekdays,levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

ggplot(lyft_surge, aes(x = weekdays, y = ..count.., fill = factor(surge_multiplier))) + 
  geom_bar(position="dodge") + ggtitle("Lyft Surge across Weekdays") + xlab("Weekdays") + ylab("Count")

uber_df$weekdays <- factor(uber_df$weekdays,levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

ggplot(uber_df, aes(x = weekdays, y = ..count.., fill = factor(surge_multiplier))) + 
  geom_bar(position="dodge") + ggtitle("Uber Surge across Weekdays") + xlab("Weekdays") + ylab("Count")

ggplot(cab_rides, aes(x = hour))+
  geom_line(stat = 'count', aes(group = cab_type, color = cab_type)) + ggtitle("Effect of Time of the Day on Ride Booking Frequency") + xlab("Hour of the Day") + ylab("Number of Rides")


       