# L07 Baseline Models: Exercise 2 ----
# Assess final model

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)
library(tidyr)

# handle common conflicts
tidymodels_prefer()

# load test data----
load(here("exercise_2/data_splits/titanic_test.rda"))

# load trained models ----
load(here("exercise_2/results/final_rf_fit.rda"))

# final accuracy
predicted_final_fit <- bind_cols(titanic_test, predict(final_rf_fit, titanic_test)) |> 
  select(survived, .pred_class)

accuracy_final_fit <- accuracy(predicted_final_fit, truth = survived, estimate = .pred_class)

accuracy_final_fit |> 
  knitr::kable()

# confusion matrix
conf_mat(predicted_final_fit, truth = survived, estimate = .pred_class)

row1 <- c("", "Truth", "")
row2 <- c("Prediction", "Yes", "No")
row3 <- c("Yes", "39", "10")
row4 <- c("No", "13", "73")

conf_table <- as.table(matrix(c(row1, row2, row3, row4), nrow = 4, byrow = TRUE))

conf_table |> 
  knitr::kable()
