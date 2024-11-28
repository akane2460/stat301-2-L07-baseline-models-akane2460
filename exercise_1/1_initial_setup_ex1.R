# L07 Baseline Models: Exercise 1 ----
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
load(here("exercise_1/data_splits/abalone_test.rda"))
dim(abalone_test)
load(here("exercise_1/data_splits/abalone_train.rda"))
dim(abalone_train)
# inspecting target variable


# quick data quality ----

# initial split ----
# set seed
set.seed(3012)

# folding data (resamples) ----
# set seed 
set.seed(605)

# set up controls for fitting resamples ----


# write out split, train, test and folds ----
