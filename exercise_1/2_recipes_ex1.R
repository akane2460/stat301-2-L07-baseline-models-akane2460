# L07 Baseline Models: Exercise 1 ----
# Setup pre-processing/recipes/feature engineering

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)

# handle common conflicts
tidymodels_prefer()

# load training data ----
load(here("exercise_1/data_splits/abalone_train.rda"))

# build lm recipe ----
abalone_recipe_lm <- recipe(age ~ ., data = abalone_train) |> 
  step_rm(rings) |> 
  step_dummy(type) |> 
  step_interact(terms = ~ starts_with("type_"):shucked_weight ) |> 
  step_interact(terms = ~ longest_shell:diameter) |> 
  step_interact(terms = ~ shucked_weight:shell_weight) |> 
  step_zv(all_predictors()) |> 
  step_normalize(all_numeric_predictors())

# check recipe
abalone_recipe_lm |> 
  prep() |> 
  bake(new_data = NULL) |> 
  glimpse()

# build tree-based recipe ----
abalone_recipe_tree <- recipe(age ~ ., data = abalone_train) %>% 
  step_rm(rings) %>% 
  step_dummy(all_nominal_predictors(), one_hot = TRUE) %>% 
  step_zv(all_predictors()) |> 
  step_normalize(all_numeric_predictors())

# check recipe
abalone_recipe_tree |> 
  prep() |> 
  bake(new_data = NULL) |> 
  glimpse()

# build baseline recipe ----
abalone_recipe_baseline <- recipe(age ~ ., data = abalone_train) |> 
  step_rm(rings) |> 
  step_dummy(all_nominal()) |> 
  step_zv(all_predictors()) |> 
  step_scale(all_numeric_predictors()) |> 
  step_center(all_numeric_predictors())

# check recipe
# abalone_recipe_baseline |> 
#   prep() |> 
#   bake(new_data = NULL) |> 
#   glimpse()

# write out recipe(s) ----
save(abalone_recipe_lm, file = here("exercise_1/recipes/abalone_recipe_lm.rda"))
save(abalone_recipe_tree, file = here("exercise_1/recipes/abalone_recipe_tree.rda"))
save(abalone_recipe_baseline, file = here("exercise_1/recipes/abalone_recipe_baseline.rda"))


