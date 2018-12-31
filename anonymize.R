# -------------------------------------------------------------
# -------Method to anonymize data for analysis + sharing-------
# -------------------------------------------------------------

# define function to generate random alphanumeric strings
getRandomString <- function(n) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

# set file location and name
filepath <- './'
filename <- 'appended_data.csv'

# set wd to filepath so output writes there
setwd(filepath)

# read in data
data <- read.csv(paste(filepath,filename,sep=''),header=TRUE)

# get unique sona ids (or whatever)
sonaids <- unique(data$sonaid)

# create random alphanumeric identifiers of same length
ss_codes <- getRandomString(length(sonaids))

# insert random sscodes
for (row in 1:nrow(data)){
  data$sonaid[row] <- ss_codes[match(data$sonaid[row],sonaids)]
}

# rename column
names(data)[names(data) == "sonaid"] <- "ss_code"

# delete identifying information from file
#anonymized <- data[,!names(data) %in% c("sonaid")]
  
# save
write.csv(data, file = "appended_data_anonymized.csv",row.names=FALSE)

