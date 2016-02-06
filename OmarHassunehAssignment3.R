## 0 
print("Omar Hassuneh")
print(1505101)
print("ohassune@ucsc.edu")

## 1
library(foreign)
df.ex<-read.dta(
  "https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta"
)
class(df.ex)

## 2
require(dplyr)
df.ex2<-dplyr::filter(
  df.ex, 
  year == 2013 & month == 12
)
print(nrow(df.ex2))

df.ex2<-dplyr::filter(
  df.ex,   
  year == 2013 & (month == 7 | month == 8 | month == 9)
)
print(nrow(df.ex2))

## 3
df.ex.3a <- df.ex %>% dplyr::arrange(year, month)
head(df.ex.3a) 

## 4
df.ex.4a<- df.ex %>% dplyr::select(year:age)
head(df.ex.4a)                                 

df.ex.4b<- df.ex %>% dplyr::select(year,month,starts_with("i"))
head(df.ex.4b)

print(distinct(select(df.ex,state)))
                                  
## 5
stndz<-function(x){
  (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)
}
nrmlz<-function(x){
  (x - min(x, na.rm = TRUE))/(max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

df.ex.5a <- dplyr::mutate(df.ex,rw.stndz=stndz(rw), rw_nrmlz=nrmlz(rw)) %>% 
  select(rw.stndz,rw_nrmlz)
  
df.ex.5b <- df.ex %>% group_by(year,month) %>% 
  mutate(rw.stndz = stndz(rw), rw_nrmlz = nrmlz(rw),count = n()) %>%
  select(rw.stndz, rw_nrmlz,count)

## 6
df.ex.6 <- df.ex %>%
  dplyr::group_by(year, month, state) %>%
  dplyr::summarise(
    rw_min = min(rw, na.rm = TRUE),
    rw_1stq = quantile(rw, 0.25, na.rm = TRUE),
    rw_mean = mean(rw, na.rm = TRUE),
    rw_median = median(rw, na.rm = TRUE),
    rw_3rdq = quantile(rw, 0.75, na.rm = TRUE),
    rw_max = max(rw, na.rm = TRUE),
    count = n()
    )

print(nrow(df.ex.6))


print(df.ex.6 %>% 
        ungroup() %>% 
        arrange(desc(rw_mean)) %>% 
        select(year,month,state)%>%head(1)
      )

