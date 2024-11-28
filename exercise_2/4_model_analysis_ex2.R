# L07 Baseline Models: Exercise 2 ----
# Model selection/comparison & analysis

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)

# handle common conflicts
tidymodels_prefer()

# load test data----
load(here("exercise_2/data_splits/titanic_test.rda"))

# load fits----
load(here("exercise_2/results/baseline_fit_lm.rda"))
load(here("exercise_2/results/null_fit.rda"))
load(here("exercise_2/results/bt_tuned.rda"))
load(here("exercise_2/results/en_tuned.rda"))
load(here("exercise_2/results/knn_tuned.rda"))
load(here("exercise_2/results/lm_fit.rda"))
load(here("exercise_2/results/rf_tuned.rda"))

# collect accuracy metrics
model_set <- as_workflow_set(
  baseline = baseline_fit_lm,
  null = null_fit,
  boosted_tree = bt_tuned, 
  en = en_tuned,
  knn = knn_tuned,
  lm = lm_fit,
  rf = rf_tuned)

accuracy_metrics <- model_set |> 
  collect_metrics() |> 
  filter(.metric == "accuracy") 

min_accuracy <- accuracy_metrics |> 
  group_by(wflow_id) |> 
  slice_min(mean) |> 
  distinct(wflow_id, .keep_all = TRUE)
  
min_accuracy |> 
  select(wflow_id, model, .metric, mean, std_err) |> 
  knitr::kable()

# look at best results parameters rf
best_results_rf <- select_best(rf_tuned, metric = "accuracy")
# get best results when mtry = 2 and min_n = 2, trees = 1500