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


#### Functopns and contro;l structures Assessment.
cpgtFilePath=system.file("extdata",
                         "CpGi.table.hg18.txt",
                         package="compGenomRData")
cpgi=read.table(cpgtFilePath,header=TRUE,sep="\t")
head(cpgi)
## Check values in the perGc column using a histogram. The ‘perGc’ column in the data stands for GC percent => percentage of C+G nucleotides.
hist(cpgi$perGc)
## Make a boxplot for the ‘perGc’ column.
boxplot(cpgi$perGc,main="Boxplot of perGc column",ylab="perGc")
## Use if/else structure to decide if the given GC percent is high, low or medium. If it is low, high, or medium: low < 60, high>75, medium is between 60 and 75; use greater or less than operators, < or >.
GCper=65

if(GCper < 60){
  result = "low"
  cat("The given GC percent is:",result,"\n")
} else if(GCper > 75){
  result = "high"
  cat("The given GC percent is:",result,"\n")
} else{
  result = "medium"
  cat("The given GC percent is:",result,"\n")
}

## Write a function that takes a value of GC percent and decides if it is low, high, or medium: low < 60, high>75, medium is between 60 and 75.
GCclass <- function(gc){
  if(gc < 60){
    result = "low"
    cat("The given GC percent is:",result,"\n")
  } else if(gc > 75){
    result = "high"
    cat("The given GC percent is:",result,"\n")
  } else{
    result = "medium"
    cat("The given GC percent is:",result,"\n")
  }
  
  return(result)
}
GCclass(80)
GCclass(10)
GCclass(70)

## Use a for loop to get GC percentage classes for gcValues below. Use the function you wrote above
gcValues=c(10,50,70,65,90)
for( i in gcValues){
  GCclass(i)
}

## Use lapply to get GC percentage classes for gcValues.
lapply(gcValues,GCclass)

## Use sapply to get GC percentage classes for gcValues.
sapply(gcValues,GCclass)

## Is there a way to decide on the GC percentage class of a given vector of GCpercentages without using if/else structure and loops ? if so, how can you do it? HINT: Subsetting using < and > operators.
gcValues=c(10,50,70,65,90)
gcValues[gcValues < 60]  # low
gcValues[gcValues > 75]  # high
gcValues[gcValues >= 60 & gcValues <= 75]  # medium
