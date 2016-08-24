library(stringr)
library(rjson)
library(dplyr)

#This function creates the URL that points to each player's data
createPlayerURL <- function(id){
  base <- "https://fantasy.premierleague.com/drf/element-summary/"
  return(str_c(base,id,sep=""))
}

getPlayerStats <- function(url){
  jsonlite::fromJSON(url)
}

getAllPlayersInfo <- function(){
  as.tbl(jsonlite::fromJSON("https://fantasy.premierleague.com/drf/elements/"))
}

getPlayerInfoWithName <- function(name){
  players <- getAllPlayersInfo() %>% filter(web_name == name)
  
  if(nrow(player) == 0){
    stop("No player found")
  }else{
    return(player)
  }
} 

getPlayerInfoWithID <- function(id){
  players <- getAllPlayersInfo()

  if(id < 1 || id > nrow(players)){
    stop("Invalid index given")
  }else{
    return(players[id, ])
  }
}
