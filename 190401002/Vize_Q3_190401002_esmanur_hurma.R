# Spotify Token fonksiyonu (bu kısmı gerçek fonksiyonunuzla değiştirmelisiniz)
spotify_search_artist <- function(artist_name) {
  # Spotify Token al
  access_token <- spotify_token()$token
  access_token <- gsub("^Bearer\\s+", "", access_token)
  
  # API endpoint
  endpoint <- "https://api.spotify.com/v1/search"
  
  # Arama parametreleri
  params <- list(
    q = artist_name,
    type = "artist"
  )
}
# spotify_search_artist fonksiyonu
spotify_search_artist <- function(artist_name) {
  # (Önceki örnek fonksiyonunuzu buraya ekleyin)
}

# Favori ve sevilmeyen sanatçılar
favorite_artists <- c("The Weeknd", "Paramore", "The Cranberries", "Red Chili Peppers")
unfavorite_artist <- "Uzi"

# Boş bir data frame oluştur
my_artists <- data.frame(artist = character(5), id = character(5), stringsAsFactors = FALSE)

# Favori sanatçılar için ID'leri al
for (i in seq_along(favorite_artists)) {
  result <- spotify_search_artist(favorite_artists[i])
  if (!is.null(result$search_results)) {
    my_artists[i, ] <- result$search_results[1, ]
  }
}

# Sevilmeyen sanatçı için ID'yi al
result_unfavorite <- spotify_search_artist(unfavorite_artist)
if (!is.null(result_unfavorite$search_results)) {
  my_artists[5, ] <- result_unfavorite$search_results[1, ]
}

# my_artists data frame'ini yazdır
print(my_artists)