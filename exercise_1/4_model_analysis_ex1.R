# L07 Baseline Models: Exercise 1 ----
# Model selection/comparison & analysis

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)

# handle common conflicts
tidymodels_prefer()

# load test data----
load(here("exercise_1/data_splits/abalone_test.rda"))

# load fits----
load(here("exercise_1/results/baseline_fit_lm.rda"))
load(here("exercise_1/results/null_fit.rda"))
load(here("exercise_1/results/bt_tuned.rda"))
load(here("exercise_1/results/en_tuned.rda"))
load(here("exercise_1/results/knn_tuned.rda"))
load(here("exercise_1/results/lm_fit.rda"))
load(here("exercise_1/results/rf_tuned.rda"))

# task 3: RMSE and std error table----
model_set <- as_workflow_set(
  baseline = baseline_fit_lm,
  null = null_fit,
  boosted_tree = bt_tuned, 
  en = en_tuned,
  knn = knn_tuned,
  lm = lm_fit,
  rf = rf_tuned)

rmse_metrics <- model_set |> 
  collect_metrics() |> 
  filter(.metric == "rmse") 

min_rmse <- rmse_metrics |> 
  group_by(wflow_id) |> 
  slice_min(mean)

min_rmse |> 
  select(wflow_id, model, .metric, mean, std_err) |> 
knitr::kable()

# look at best results parameters rf
best_results_rf <- select_best(rf_tuned, metric = "rmse")
  # get best results when mtry = 5 and min_n = 30
