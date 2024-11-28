# L07 Baseline Models: Exercise 2 ----
# Setup pre-processing/recipes/feature engineering

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)

# handle common conflicts
tidymodels_prefer()

# load training data ----
load(here("exercise_2/data_splits/titanic_train.rda"))

# build lm recipe ----
titanic_recipe_lm <- recipe(survived ~ ., data = titanic_train) |> 
  step_rm(passenger_id, name, cabin, embarked, ticket) |> 
  step_zv(all_predictors()) |>
  step_impute_linear(age) |> 
  step_dummy(all_nominal_predictors()) |> 
  step_interact(terms = ~ starts_with("sex_"):fare) |> 
  step_interact(terms = ~ age:fare) |> 
  step_zv(all_predictors()) |> 
  step_normalize(all_numeric_predictors())

# check recipe
titanic_recipe_lm |> 
  prep() |> 
  bake(new_data = NULL) |> 
  glimpse()

# build tree-based recipe ----
titanic_recipe_tree <- recipe(survived ~ ., data = titanic_train) %>% 
  step_rm(passenger_id, name, cabin, embarked, ticket) |> 
  step_zv(all_predictors()) |>
  step_impute_linear(age) |> 
  step_dummy(all_nominal_predictors(), one_hot = TRUE) |> 
  step_zv(all_predictors()) |> 
  step_normalize(all_numeric_predictors())


# check recipe
titanic_recipe_tree |> 
  prep() |> 
  bake(new_data = NULL) |> 
  glimpse()

# build baseline recipe ----
titanic_recipe_baseline <- recipe(survived ~ ., data = titanic_train) |> 
  step_rm(passenger_id, name, cabin, embarked, ticket) |> 
  step_zv(all_predictors()) |> 
  step_impute_linear(age) |> 
  step_dummy(all_nominal_predictors(), one_hot = TRUE) |> 
  step_center(all_numeric_predictors())

# check recipe
# abalone_recipe_baseline |>
#   prep() |>
#   bake(new_data = NULL) |>
#   glimpse()

# write out recipe(s) ----
save(titanic_recipe_lm, file = here("exercise_2/recipes/titanic_recipe_lm.rda"))
save(titanic_recipe_tree, file = here("exercise_2/recipes/titanic_recipe_tree.rda"))
save(titanic_recipe_baseline, file = here("exercise_2/recipes/titanic_recipe_baseline.rda"))


