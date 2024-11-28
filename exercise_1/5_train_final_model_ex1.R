# L07 Baseline Models: Exercise 1 ----
# Train final model

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)
library(doMC)

# handle common conflicts
tidymodels_prefer()

# load data
load(here("exercise_1/data_splits/abalone_train.rda"))

# load recipes
load(here("exercise_1/recipes/abalone_recipe_tree.rda"))
load(here("exercise_1/recipes/abalone_recipe_baseline.rda"))

# load fits
load(here("exercise_1/results/rf_tuned.rda"))

# training model on training set----
rf_spec <- 
  rand_forest(trees = 1000, mtry = 5, min_n = 30) |> # mtry and min_n values determined via tuning analysis
  set_engine("ranger") |> 
  set_mode("regression")

# define workflows ----
rf_wflow <-
  workflow() |> 
  add_model(rf_spec) |> 
  add_recipe(abalone_recipe_tree)

# fit workflows/models ----
# set seed
set.seed(4398)
final_rf_fit <- fit(rf_wflow, abalone_train)

# write out results (fitted/trained workflows) ----
save(final_rf_fit, file = here("exercise_1/results/final_rf_fit.rda"))

