
library(mongolite)
library(yaml)

# validate token
validate_token <- function(token){
  
  token == readLines(".secret.txt")
  
}

write_to_db <- function(dat){

  mg <- est_mongo_conn("Mongo")

  mg$insert(dat)

  rm(mg)
}

est_mongo_conn <- function(conn) {

  # make sure file exists
  if (!file.exists("dbconfig.yaml")) {
    stop("Database credential not found.")
  }

  # read config
  d <- yaml::read_yaml("dbconfig.yaml")

  # check if db is specified
  if( "db" %in% names(d[[conn]]) ){
    db = d[[conn]][['db']]
  }else{
    db = conn
  }

  # check if the credentials are specified
  if(!all(c("host", "port", "collection") %in% names(d[[conn]]))){
    stop("One or more database parameters is incorrect.")
  }

  # est conn
  c <- mongo(
    collection = d[[conn]][["collection"]],
    url = with(d[[conn]],
               # mongodb://username:password@host:port
               sprintf("mongodb://%s:%s@%s:%d/", user, password, host, port)),
    db = d[[conn]][["db"]]
  )

  # return connection
  c

}

#' @post /test_docker
function(req, token, x) {
  
  result <- round(rnorm(x, mean = 10, sd = 5))
  
  name <- sample(1:26, size = x)
  
  names(result) <- LETTERS[name]
  
  result <- as.data.frame(t(result))
  
  result$time <- Sys.time()
  
  write_to_db(result)

}