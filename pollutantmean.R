pollutantmean  <- function( directory, pollutant, id=1:332)
{  
  poll_data <- NULL
  for ( i in seq_along(id))
  {     
    if ( length (id[i]) == 1)
      monitor_file <- paste( directory[1], "/", sprintf ("%03d", id[i] ), ".csv", sep=''  )
    else if ( length (id[i]) == 2)
      monitor_file <- paste( directory[1], "/", sprintf ("%03d", id[i] ), ".csv", sep=''  )
    else
      monitor_file <- paste( directory[1], "/", sprintf ("%03d", id[i] ), ".csv", sep=''  )
  
    input <- read.csv( monitor_file )  
    x  <-  input[, pollutant]   
    bad <- is.na(x)
    poll_data <- c( poll_data, x[!bad])
  }
  
  mean ( poll_data )
}




