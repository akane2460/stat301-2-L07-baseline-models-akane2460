# L07 Baseline Models: Exercise 2 ----
# Train final model

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)
library(doMC)

# handle common conflicts
tidymodels_prefer()

# handle common conflicts
tidymodels_prefer()

# load data
load(here("exercise_2/data_splits/titanic_train.rda"))

# load recipes
load(here("exercise_2/recipes/titanic_recipe_tree.rda"))

# training model on training set----
rf_spec <- 
  rand_forest(trees = 1500, mtry = 2, min_n = 2) |> # mtry and min_n values determined via tuning analysis
  set_engine("ranger") |> 
  set_mode("classification")

# define workflows ----
rf_wflow <-
  workflow() |> 
  add_model(rf_spec) |> 
  add_recipe(titanic_recipe_tree)

# fit workflows/models ----
# set seed
set.seed(8934)
final_rf_fit <- fit(rf_wflow, titanic_train)

# write out results (fitted/trained workflows) ----
save(final_rf_fit, file = here("exercise_2/results/final_rf_fit.rda"))

