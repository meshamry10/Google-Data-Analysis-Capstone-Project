## installing the necessary packages
install.packages("tidyverse")
install.packages("lubridate")

## loading the packages
library(tidyverse)
library(lubridate)
library(ggplot2)

## importing the data sets
january <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202101-divvy-tripdata.csv")
february <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202102-divvy-tripdata.csv")
march <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202103-divvy-tripdata.csv")
april <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202104-divvy-tripdata.csv")
may <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202105-divvy-tripdata.csv")
june <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202106-divvy-tripdata.csv")
july <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202107-divvy-tripdata.csv")
august <- read.csv("C:/Usersy/Desktop/Excerciess/Data_analiysis_Project/2021/202108-divvy-tripdata.csv")
september <- read.csv("C:/UsersDesktop/Excerciess/Data_analiysis_Project/2021/202109-divvy-tripdata.csv")
october <- read.csv("C:/UsersDesktop/Excerciess/Data_analiysis_Project/2021/202110-divvy-tripdata.csv")
november <- read.csv("C:/UsersDesktop/Excerciess/Data_analiysis_Project/2021/202111-divvy-tripdata.csv")
december <- read.csv("C:/Users/Desktop/Excerciess/Data_analiysis_Project/2021/202112-divvy-tripdata.csv")

## Discovering the columns in each data sets
colnames(january)
colnames(february)
colnames(march)
colnames(april)
colnames(may)
colnames(june)
colnames(july)
colnames(august)
colnames(september)
colnames(october)
colnames(november)
colnames(december)

## round up to two decimal
options(digits = 2)

## reading to my PC performance combined the data sets into 3 sets that are q_1,q_2,q_3 

## combining the data sets into one data set 
q_1 <- rbind(january,february,march,april)
## to identify the column type
str(q_1)
## Removing the following column 
q_1 <- q_1 %>% 
  select(-c(start_station_name,start_station_id,start_station_id,end_station_name, end_station_id,start_lat,start_lng,end_lat,end_lng))
## calculating the ride_length
q_1 <- q_1 %>% 
  mutate("ride_length"=(difftime(ended_at,started_at, units = "mins")))
## finding the day
q_1 <- q_1 %>% 
  mutate("day_of_week"= format(as.Date(started_at), "%A"))

##q_2
## combining the data sets into one data set 
q_2 <- rbind(may,june,july,august)
## to identify the column type
str(q_2)
## Removing the following column 
q_2 <- q_2 %>% 
  select(-c(start_station_name,start_station_id,start_station_id,end_station_name, end_station_id,start_lat,start_lng,end_lat,end_lng))
## calculating the ride_length
q_2 <- q_2 %>% 
  mutate("ride_length"=(difftime(ended_at,started_at, units = "mins")))
## finding the day 
q_2 <- q_2 %>% 
  mutate("day_of_week"= format(as.Date(started_at), "%A"))

##q_3
## combining the data sets into one data set 
q_3 <- rbind(september,october,november,december)
## to identify the column type
str(q_3)
## Removing the following column 
q_3 <- q_3 %>% 
  select(-c(start_station_name,start_station_id,start_station_id,end_station_name, end_station_id,start_lat,start_lng,end_lat,end_lng))
## calculating the ride_length
q_3 <- q_3 %>% 
  mutate("ride_length"=(difftime(ended_at,started_at, units = "mins")))
## finding the day 
q_3 <- q_3 %>% 
  mutate("day_of_week"= format(as.Date(started_at), "%A"))

## removing the individual data sets
remove(january,february,march,april,may,june,july,august,september,october,november,december)

##binding the All data
annual_data <- rbind(q_1,q_2,q_3)

## Removing the old data sets 
remove(q_1,q_2,q_3)

## removing NA 
annual_data <- annual_data %>% 
  na.omit() 
## Removing Duplicates 
annual_data <- annual_data %>%
  distinct()

## removing the ride_length less than or equal to zero
annual_data <- annual_data [!(annual_data$ride_length <= 0),]

## Exporting the data set analysis in Excel & Tableau
write.csv(annual_data, file = "annual_data", row.names = FALSE)






