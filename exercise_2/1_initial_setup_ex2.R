# L07 Baseline Models: Exercise 2 ----
# Initial data checks & data splitting

# Random process in script, seed set right before it

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)
library(patchwork)

# handle common conflicts
tidymodels_prefer()

# load data ----
load(here("exercise_2/data_splits/titanic_test.rda"))
dim(titanic_test)
load(here("exercise_2/data_splits/titanic_train.rda"))
dim(titanic_train)

# inspecting target variable


# quick data quality ----


# initial split ----
# set seed
set.seed(2103)

# folding data (resamples) ----
# set seed 
set.seed(506)

# set up controls for fitting resamples ----

# write out split, train, test and folds ----

