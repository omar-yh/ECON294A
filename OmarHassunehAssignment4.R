## 0 
print("Omar Hassuneh")
print(1505101)
print("ohassune@ucsc.edu")


## 1
flights <- 
  read.csv(
    "https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/flights.csv",
                    stringsAsFactors=F, header=T)
planes <- 
  read.csv("https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/planes.csv",
                   stringsAsFactors=F, header=T)
weather<-
  read.csv("https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/weather.csv",
                  stringsAsFactors=F, header=T)
airports<-
  read.csv("https://raw.githubusercontent.com/EconomiCurtis/econ294_2015/master/data/airports.csv",
                   stringsAsFactors =F, header=T)
## 2 

weather$date<-as.Date(weather$date)
flights$date<-as.Date(flights$date)

## 3

flights.2a <- subset(flights, dest == "SFO" | dest == "OAK")
nrow(flights.2a) # 3508
flights.2b <- subset(flights, dep_delay >= 60)
nrow(flights.2b) # 10474
flights.2c <- subset(flights, arr_delay > 2*dep_delay)
nrow(flights.2c) # 70772

## 4

#install.packages("dplyr")
library(dplyr)
?dplyr::select 

s1<-select(flights, contains("delay"))
s2<-select(flights, ends_with("delay"))
s<-c("arr_delay", "dep_delay")
s3<-select(flights, one_of(s3))

## 5

# a

arr<-arrange(flights, -dep_delay)
head(arr$dep_delay,n=5)

# b

flights$caught_up <- (abs(flights$dep_delay - flights$arr_delay))
arr.b<-arrange(flights, -caught_up)
head(arr.b,n=5)

## 6

flights <- mutate(flights, mph=dist/(time/60)) # %>%head(5)
flights <- mutate(flights, delta=abs(dep_delay-arr_delay))
flights <- mutate(flights, lost.time=(arr_delay-dep_delay))

# a
flights <- flights[order(-flights$mph) , ]
head(flights$speed,n=5)

# b
flights <- flights[order(flights$delta) , ]
head(abs(flights$delta),n=5)

# c
flights <- flights[order(flights$lost.time) , ]
head(abs(flights$delta),n=5)

## 7 
library(dplyr)

flights.7a<-delta %>% group_by(carrier) %>%

  summarise(
    cancelled.flights = sum(cancelled, na.rm=T),
    total.flight = n(),
    percent.cancelled=((cancelled.flights/total.flight)*100),
    min = min(delta,na.rm=T),
    max = max(delta,na.rm=T),
    q1 = quantile(delta,0.25,na.rm=T),
    q3 = quantile(delta,0.75,na.rm=T),
    q90 = quantile(delta,0.90,na.rm=T),
    median = median(delta,na.rm=T),
    mean = mean(delta,na.rm=T)
  )

flights.7a<-flights.7a%>%arrange(desc(percent.cancelled))
print(flights.7a)

day_delay <- dplyr::filter(flights, !is.na(dep_delay))%>%
  group_by(date)%>%
  summarise(
    delay = mean(dep_delay),
    n=n()
  )%>%filter(n>10)


## 8

day_delay <- day_delay %>% arrange((date))

for(i in 2:nrow(day_delay)) {
  day_delay$lag[i-1]<-day_delay$delay[i]-day_delay$delay[i-1]
}
day_delay <- day_delay %>% arrange(desc(lag)) 
for(i in 1:5) {
  print(day_delay[i,])
}

## 9



## 10



## 11






