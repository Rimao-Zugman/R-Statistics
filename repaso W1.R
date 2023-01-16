#ejemplo de como añadir un argumento

divisbleBy5 <- function(n){
  if(n %% 5 == 0)
  {
    return("number is divisible by 5")
  }
  else 
  {
    return("number is not divisible by 5")
  }
}

# Function call
divisbleBy5(100)
divisbleBy5(4)
divisbleBy5(20.0)
#ejemplo de Select filter mutate y pipes
install.packages("tidyverse")
#UNLIST SE USA PARA TRANSFORMAR UN DATA FRAM EN UN NUMERICAL VECTOR
