## Overview

Directory contains initial setup objects for exercise 2 created in [exercise_2/1_initial_setup_ex2.R](https://github.com/akuyper/L07-baseline-models/blob/main/exercise_2/1_initial_setup_ex2.R)

- `titanic_split.rda`: Split object; result of performing an initial split; can derive the testing and training dataset from this object
- `titanic_train.rda`: Titanic training dataset; derived from `titanic_split`
- `titanic_test.rda`: Titanic testing dataset; derived from `titanic_split`
- `titanic_folds.rda`: Object identifying how the training set should be folded (resampling technique used for tuning and out of sample model performance estimation)
- `keep_wflow.rda`: Extra controls indicated what to save when tuning/training on a regular grid