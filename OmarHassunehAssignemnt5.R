## 0 
print("Omar Hassuneh")
print(1505101)
print("ohassune@ucsc.edu")


## Problem 1

library(ggplot2)

# (a)

d <- ggplot(data = diamonds,aes(x = x*y*z, y = price))

d + geom_point(aes(size = carat), alpha = 0.1) +
  geom_point(aes(colour = clarity, size = carat)) +
  scale_y_log10() + scale_x_log10()

# (b)

p <- ggplot(diamonds, aes(x=carat, y= ..density..))

p + geom_histogram(aes(fill = clarity), bins = 30) + facet_grid(cut ~ .)

# (c) 

p <- ggplot(diamonds, aes(x=cut, y=price))

p + geom_violin() +
  geom_jitter(alpha=0.05)

## Problem 2

library(foreign)
org<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")

# (a)

library(dplyr)
org_ex <- org %>% 
  mutate(
    date = paste(year, month, "01", sep = "-"),
    date = as.Date(date, format = "%Y-%m-%d")
  ) %>%
  filter(!is.na(rw)) %>%
  dplyr::group_by(date) %>%
  mutate(
    Median.RW = median(rw),
    rw_1stquant = quantile(rw, 0.25),
    rw_3rdquant = quantile(rw, 0.75),
    rw_1stdecile = quantile(rw, 0.1),
    rw_9thdecile = quantile(rw, 0.9)
  ) %>%
  tbl_df()

p <- ggplot(org_ex, aes(x=date, y=Median.RW))

p + geom_line(aes(y=Median.RW))+
  lims(y=c(0,50))+
  geom_ribbon(aes(ymin = rw_1stquant, ymax = rw_3rdquant), alpha = 0.5 )+
  geom_ribbon(aes(ymin = rw_1stdecile, ymax = rw_9thdecile), alpha = 0.1)

# (b)

library(dplyr)
org_ex <- org %>% 
  mutate(
    date = paste(year, month, "01", sep = "-"),
    date = as.Date(date, format = "%Y-%m-%d")
  ) %>%
  filter(!is.na(rw)) %>%
  dplyr::group_by(date, educ) %>%
  mutate(Median.RW = median(rw)) %>%
  tbl_df()

p <- ggplot(org_ex, aes(x=date, y=Median.RW, group = educ))
p + geom_line(aes(color = educ))+
  lims(y=c(0,35))

