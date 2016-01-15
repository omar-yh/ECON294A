# 0 #

first<-"Omar"
last<-"Hassuneh"
ID<- "1505101"

print(paste(first,last)) 
print(ID)

# 1 #

library(foreign)
df.dta<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta")

df.csv<-read.csv("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_CSV.csv")

df.td<-read.table("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt")

df.rdata<-load('~/Desktop/294/NHIS_2007_RData.RData')

# 2 #

#NHIS_2007_dta          34 KB     THE SMALLEST
#NHIS_2007_RData        46 KB
#NHIS_2007_TSV.txt      1100 KB
#NHIS_2007_CSV          1600 KB

#What Accounts for the variabliety is the data format. 

# 3 #

typeof(df.rdata)
class(df.rdata)
length(df.rdata)
dim(df.rdata)
nrow(df.rdata)
ncol(df.rdata)
summary(df.rdata)

# 4 # 

df<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")

str(df)
#data.frame':	1119754 obs. of  30 variables

summary(df$rw)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#1.8    10.7    15.9    19.8    24.4   354.8  521279 

# 5 #

v<-c(1,2,3,4,5,6,7,4,NULL,NA)
length(v)
#9 and it does not match b/c the NA is ignored

summary(v)
#mean is 4, droping na

# 6 # 

x <- matrix(c(1, 4, 7, 2, 5, 8, 3, 6, 9),nrow=3,ncol=3) 

t(x)
eigen(x)

y <- matrix (c(1,2,3,3,2,1,2,3,0),nrow=3,ncol=3)

inv<-solve(y)
y%*%inv
# we get the Identity matrix 

# 7 #

carat<-c(5,2,.5,1.5,5,0,3)
cut<-c("fair","good","very good","good","fair","ideal","fair")
clarity<-c("SI1","I1","VI1","VS1","IF","VVS2",NA)
price<-c(850,450,450,NA,750,980,420)
diamonds<-data.frame(carat, cut, clarity, price)

summary(diamonds$price)
#mean price 650

subfaircut<-subset(diamonds,(cut=="fair"))
mean(subfaircut$price)
#mean = 673.33

sub3<-subset(diamonds,(cut=="good" | cut=="very good"|cut=="ideal" ))

gdsub3<-subset(sub3,(cut=="good"))
summary(gdsub3)
# mean 450
vgdsub3<-subset(sub3,(cut=="very good"))
summary(vgdsub3)
# mean 450
isub3<-subset(sub3,(cut=="ideal"))
summary(isub3)
# mean 980

sub4<-subset(diamonds,carat>2,cut=="Ideal"||cut=="very good")
summary(sub4$price)
#NULL
