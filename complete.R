complete <- function ( directory, id )
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
    good  <-  complete.cases(input )      
    nr <- nrow( input[good,][  , ]  )    
    poll_data <- c( poll_data, nr )
  } 
  x <- data.frame( id = id, nobs=poll_data )
  x
} 
