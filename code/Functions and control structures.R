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

