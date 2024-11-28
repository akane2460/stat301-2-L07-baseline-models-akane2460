# L07 Baseline Models: Exercise 1 ----
# Define and fit baseline models (null and very simple linear model)

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)

# handle common conflicts
tidymodels_prefer()

# load recipe
load(here("exercise_1/recipes/abalone_recipe_baseline.rda"))

# load fold data
load(here("exercise_1/data_splits/abalone_folds.rda"))

# 1. the null model and 
# 2. a very simple linear model. 

# 1. Define recipe/preprocessing
# 2. Define model specification 
# - use `null_model()` with `parsnip` engine
# - use `linear_reg()` with `lm` engine
# 3. Define workflow
# 4. Use resamples to train/assess workflow
# ^[Same resamples that all candidate workflows/models should use. Allows for valid comparisons.]

##########################################################################
# Null Model (the duh baseline) ----
##########################################################################
# model specifications ----
baseline_lm_spec <- 
  linear_reg() |> 
  set_engine("lm") |> 
  set_mode("regression") 

# define workflows ----
baseline_lm_wflow <-
  workflow() |> 
  add_model(baseline_lm_spec) |> 
  add_recipe(abalone_recipe_baseline)

# fit workflows/models ----
baseline_fit_lm <- baseline_lm_wflow |> 
  fit_resamples(
    resamples = abalone_folds, 
    control = control_resamples(save_workflow = TRUE)
  )

# write out results (fitted/trained workflows) ----
save(baseline_fit_lm, file = here("exercise_1/results/baseline_fit_lm.rda"))

##########################################################################
# Basic baseline  (step up from null model) ----
##########################################################################
null_spec <- null_model() |> 
  set_engine("parsnip") |> 
  set_mode("regression")

# define workflows ----
null_workflow <- workflow() |> 
  add_model(null_spec) |> 
  add_recipe(abalone_recipe_baseline)

# fit workflows/models ----
null_fit <- null_workflow |> 
  fit_resamples(
    resamples = abalone_folds, 
    control = control_resamples(save_workflow = TRUE)
  )

# write out results (fitted/trained workflows) ----
save(null_fit, file = here("exercise_1/results/null_fit.rda"))
