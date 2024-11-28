## Overview

Directory contains initial setup objects for exercise 1 created in [exercise_1/1_initial_setup_ex1.R](https://github.com/akuyper/L07-baseline-models/blob/main/exercise_1/1_initial_setup_ex1.R)

- `abalone_split.rda`: Split object; result of performing an initial split; can derive the testing and training dataset from this object
- `abalone_train.rda`: Abalone training dataset; derived from `abalone_split`
- `abalone_test.rda`: Abalone testing dataset; derived from `abalone_split`
- `abalone_folds.rda`: Object identifying how the training set should be folded (resampling technique used for tuning and out of sample model performance estimation)
- `keep_wflow.rda`: Extra controls indicated what to save when tuning/training on a regular grid