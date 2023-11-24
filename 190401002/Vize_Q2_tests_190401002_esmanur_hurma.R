# Gerekli paketin yüklenmesi
install.packages("testthat")
library(testthat)

# Test senaryoları
test_that("Spotify API Fonksiyonu Testleri", {
  
  # Test 2.1
  test_that("Global Workspace’de spotify_search_artist adlı bir değişken olmalı.", {
    expect_true(exists("spotify_search_artist"), "Test 2.1 geçemedi: spotify_search_artist değişkeni bulunamadı.")
  })
  



