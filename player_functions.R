#This function creates the URL that points to each player's data
createPlayerURL <- function(id){
  base <- "http://fantasy.premierleague.com/web/api/elements/"
  
  return(str_c(base,id,"/",sep=""))
  
}