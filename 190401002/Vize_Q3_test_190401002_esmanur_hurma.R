# testthat kütüphanesini yükle
library(testthat)

# Test 3.1: Global Workspace'te my_artists adlı bir değişken olmalı
test_that("Global Workspace'te my_artists adlı bir değişken olmalı", {
  expect_true(exists("my_artists"))
})

# Test 3.2: my_artists adlı değişkenin class'ı "data.frame" olmalı
test_that("my_artists adlı değişkenin class'ı 'data.frame' olmalı", {
  expect_true(is.data.frame(my_artists))
})

# Test 3.3: my_artists adlı değişken 2 sütun bulundurmalı
test_that("my_artists adlı değişken 2 sütun içermeli", {
  expect_equal(ncol(my_artists), 2)
})

# Test 3.4: my_artists adlı değişken sütun isimleri c("artist", "id") olmalı
test_that("my_artists adlı değişkenin sütun isimleri c('artist', 'id') olmalı", {
  expect_true(all(colnames(my_artists) %in% c("artist", "id")))
})