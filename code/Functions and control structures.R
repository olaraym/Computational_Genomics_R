## Functions and control structures (for, if/else etc.)

#User-defined functions
sqSum <- function(x,y){
  
  results=x^2 + y^2
  cat("here is the result:",results,"\n")
  return(results)
}

sqSum(3,4)

cpgiFilePath=system.file("extdata",
                         "subset.cpgi.hg18.bed",
                         package="compGenomRData")

## If, else if, else statements

cpgi.df <- read.table(cpgiFilePath, header = FALSE) 
head(cpgi.df)

largeCpGi <- function(bed){
  cpglen=bed[3]-bed[2]+1
  if(cpglen>1500){
    cat("This is a large CpG island with length:",as.numeric(cpglen),"\n")
  } 
  else if(cpglen<=1500 & cpglen>700){
    cat("This is a normal CpG island with length:",as.numeric(cpglen),"\n")
  }
  else{
    cat("This is a small CpG island with length:",as.numeric(cpglen),"\n")
  }
}

largeCpGi(cpgi.df[10,])
largeCpGi(cpgi.df[100,])
largeCpGi(cpgi.df[1000,])


### Loops and looping structures in R
for(i in 1:5){
  cat("This is iteration number:",i,"\n")
}

## You can use an already created function in a loop
for(i in 1:nrow(cpgi.df)){
  largeCpGi(cpgi.df[i,])
}

result=c()

for(i in 1:100){
  len=cpgi.df[3]-cpgi.df[2]+1
  result=c(result,len)
}

head(result)


#Apply family of functions
#lapply, sapply, apply, tapply, mapply
#apply - works on matrices and data frames and applies the function on each row or column of the data structure
mat=matrix(1:20,nrow=5)
mat
apply(mat,1,sum) #row-wise sum
apply(mat,2,sum) #column-wise sum

#lapply - works on a list or vector and returns a list
lst=list(a=1:10,b=11:20,c=21:30)
lapply(lst,mean)

#sapply - works on a list or vector and returns a vector or matrix if possible
sapply(lst,mean) #returns a vector or matrix if possible

#tapply - works on a vector and applies a function over subsets of the vector. It can handle multiple vectors as arguments
vec=c(1,2,3,4,5,6,7,8,9,10)
fac=gl(2,5,labels=c("A","B"))
tapply(vec,fac,mean)

##mapply - works on multiple vectors or lists and applies a function in parallel over the elements of the vectors or lists
vec1=1:5
vec2=6:10
mapply(sum,vec1,vec2) #sums the elements of vec1 and vec2 in parallel
mapply(rep,1:4,4:1) #repeats the elements of 1:4 for 4:1 times respectively
#rep(1,4) rep(2,3) rep(3,2) rep(4,1)


#### Functopns and contro;l structures Assessment.
cpgtFilePath=system.file("extdata",
                         "CpGi.table.hg18.txt",
                         package="compGenomRData")
cpgi=read.table(cpgtFilePath,header=TRUE,sep="\t")
head(cpgi)
## Check values in the perGc column using a histogram. The ‘perGc’ column in the data stands for GC percent => percentage of C+G nucleotides.
hist(cpgi$perGc)
