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
  
  # HTTP Status Code
  status_code <- httr::status_code(response)
  
  # JSON Parse
  json_data <- jsonlite::fromJSON(content(response, "text"))
  
  # Artist Bilgilerini Çıkartma
  artists <- json_data$artists$items
  artist_df <- data.frame(artist = sapply(artists, function(x) x$name),
                          id = sapply(artists, function(x) x$id),
                          stringsAsFactors = FALSE)
  
  # Çıktı Oluşturma
  output <- list(
    status_code = status_code,
    search_results = artist_df
  )
  
  return(output)
}

# Kullanım Örneği
result <- spotify_search_artist("The Doors")
print(result)
