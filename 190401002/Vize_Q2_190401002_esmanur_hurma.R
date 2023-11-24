library(httr)
library(jsonlite)

spotify_search_artist <- function(artist_name) {
  
  # Spotify Web API Endpoint URL
  endpoint <- "https://api.spotify.com/v1/search"
  
  # API Anahtarları
  spotify_id <- Sys.getenv("SPOTIFY_ID")
  spotify_secret <- Sys.getenv("SPOTIFY_SECRET")
  
  # Query Parametreleri
  query_params <- list(
    q = artist_name,
    type = "artist",
    limit = 1
  )
  
  # GET İsteği
  response <- httr::GET(url = endpoint, query = query_params,
                        add_headers(Authorization = paste("Bearer", spotify_id)))
  
 