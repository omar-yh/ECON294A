
#' ---
# title: Assignment 2 script. 
# author: "Omar Hassuneh"
# date: "Winter 2016"
# assignment: https://github.com/EconomiCurtis/econ294_2015/blob/master/Assignments/Econ_294_Assignment_2.pdf
# ---

# 0 #

OmarHassunehAssignment2 <- list(
  firstName = "Omar",
  lastName  = "Hassuneh",
  email     = "ohassune@ucsc.edu",
  studentID = 1505101
)

# 1 #

diamonds <- get(  
  load(
    file = url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/diamonds.RData")
  )
)

OmarHassunehAssignment2$s1a <- nrow(diamonds)
OmarHassunehAssignment2$s1b <- ncol(diamonds)
OmarHassunehAssignment2$s1c <- names(diamonds)
OmarHassunehAssignment2$s1d <- summary(diamonds$price)

# 2 #

NHIS<-read.table("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt",header = TRUE)


OmarHassunehAssignment2$s2a <- nrow(NHIS)
OmarHassunehAssignment2$s2b <- ncol(NHIS)
OmarHassunehAssignment2$s2c <- names(NHIS)
OmarHassunehAssignment2$s2d <- mean(NHIS$weight)
OmarHassunehAssignment2$s2e <- median(NHIS$weight)

#hist(NHIS$weight,right = FALSE)
#table(NHIS$weight)

NHIS.weight<- ifelse(test = NHIS$weight<996 | NHIS$weight>999, yes = NHIS$weight, no = NA )
table(NHIS.weight)
hist(NHIS.weight,right = FALSE)

OmarHassunehAssignment2$s2f <- mean(NHIS.weight,na.rm = T)
OmarHassunehAssignment2$s2g <- median(NHIS.weight, na.rm = T)

NHIS.sex.male<-subset(NHIS,(SEX==1))
NHIS.sex.female<-subset(NHIS,(SEX==2))

OmarHassunehAssignment2$s2h <- summary(NHIS.sex.male$weight)
OmarHassunehAssignment2$s2i <- summary(NHIS.sex.female$weight)

# 3 #

vec <- c(letters,LETTERS)

OmarHassunehAssignment2$s3a <- vec[1:26*2]
OmarHassunehAssignment2$s3b <- paste(vec[c(41,13,1,18)], collapse="...")

arr<-array(c(letters,LETTERS), dim = c(3,3,3))

arr
arr1<-arr[, , 1]
arr2<-arr[, , 2]
arr3<-arr[, , 3]

OmarHassunehAssignment2$s3c <- arr2[,1]
OmarHassunehAssignment2$s3d <- c(arr[2,2,1],arr[2,2,2],arr[2,2,3])
OmarHassunehAssignment2$s3e <- paste(arr[3,2,2],arr[1,2,2],arr[1,1,1],arr[3,3,2], sep = "")  

save(OmarHassunehAssignment2,file = "~/ECON294A/OmarHassunehAssignment2.RData")
