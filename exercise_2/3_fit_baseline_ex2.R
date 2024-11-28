# L07 Baseline Models: Exercise 2 ----
# Define and fit baseline models (null and naive bayes)

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)
library(discrim)
library(klaR)

# handle common conflicts
tidymodels_prefer()

# load recipe
load(here("exercise_2/recipes/titanic_recipe_baseline.rda"))

# load fold data
load(here("exercise_2/data_splits/titanic_folds.rda"))

# 1. Define recipe/preprocessing
# 2. Define model specification 
# - use `null_model()` with `parsnip` engine
# - use `naive_Bayes()` with `klaR` engine (note you will need the `discrim` package loaded)
# 3. Define workflow
# 4. Use resamples to train/assess workflow^[Same resamples that all candidate 
    # workflows/models should use. Allows for valid comparisons.]


################################################################################
# Null Model (the duh baseline) ----
################################################################################

null_spec <- null_model() |> 
  set_engine("parsnip") |> 
  set_mode("classification")

# define workflows ----
null_workflow <- workflow() |> 
  add_model(null_spec) |> 
  add_recipe(titanic_recipe_baseline)

# fit workflows/models ----
null_fit <- null_workflow |> 
  fit_resamples(
    resamples = titanic_folds, 
    control = control_resamples(save_workflow = TRUE)
  )

# write out results (fitted/trained workflows) ----
save(null_fit, file = here("exercise_2/results/null_fit.rda"))

##########################################################################
# Basic baseline  (step up from null model) ----
##########################################################################
# model specifications ----
baseline_lm_spec <- naive_Bayes() |> 
  set_engine("klaR") |> 
  set_mode("classification") 

# define workflows ----
baseline_lm_wflow <- workflow() |> 
  add_model(baseline_lm_spec) |> 
  add_recipe(titanic_recipe_baseline)

# fit workflows/models ----
baseline_fit_lm <- baseline_lm_wflow |> 
  fit_resamples(
    resamples = titanic_folds, 
    control = control_resamples(save_workflow = TRUE)
  )

# write out results (fitted/trained workflows) ----
save(baseline_fit_lm, file = here("exercise_2/results/baseline_fit_lm.rda"))


