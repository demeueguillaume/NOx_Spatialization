library(stringr)

path <- 'C:\\Users\\demo\\OneDrive - UCL\\PROJET NOx\\data'
setwd(path)

ls <- list.files(path) # Get all the file names in the selected folder
ls <- ls[grepl(".avr", ls)] # Select on the .avr files

Data_trait <- function(f)
{
  DF <- read.table(f,header = TRUE, sep = '', dec = ".")
  
  # Convert Date from integer to factor
  DF$Date=as.factor(DF$Date)
  
  # Manage Date and hours as time
  DF$Date <- as.Date(DF$Date, format="%Y%m%d")
  DF$time <- paste(DF$Date,DF$hours)
  DF$time <- strptime(DF$time, format="%Y-%m-%d %H:%M:%S")
  
  # time as first column of the DF and remove Date and hours
  DF <- DF[,c(dim(DF)[2],3:(dim(DF)[2]-1))]
  
  # replace -9999 by NA
  DF <- replace(DF,DF==-9999,NA)
}

# Apply the data traitment to the .avr files
list_DF <- lapply(ls, Data_trait)

# names of the dataframes
n <- NULL
for (i in 1:length(ls)){
  n[i] <- str_replace(ls[i],".avr","")
}

# Extract and name all the DF from the list of DF
for (i in 1:length(list_DF)){
  assign(n[i], list_DF[[i]])
}