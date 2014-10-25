corr <- function ( directory, threshold =0 )
{ 
  poll_corr <- NULL  
  sulfa_data <- NULL
  nitro_data <- NULL
  
  data_files <- list.files( directory[1], pattern=".csv" )
  for ( mon_file in  data_files ) 
  {     
    fnam <- paste( directory[1], "/", mon_file, sep='')
    input <- read.csv( fnam )  
    good  <-  complete.cases(input )      
    sulfa_data <-  input[good,][  , "sulfate"] 
    nitro_data <-  input[good,][  , "nitrate" ]     
    s_nr <- length(sulfa_data) 
    if ( s_nr >= threshold )
    {
      x <- cor( sulfa_data, nitro_data )          
      poll_corr <- c( poll_corr ,x )
    }        
  }   
  poll_corr
} 
