## Exercise 1

### R scripts

- `1_initial_setup_ex1.R`: initial data split & forming of resamples
- `2_recipes_ex1.R`: data preprocessing/feature engineering for various models
- `3_fit_baseline_ex1.R`: fitting of baseline(s) to resamples 
- `3_fit_lm_ex1.R`: fitting of linear regression to resamples
- `3_tune_bt_ex1.R`: fitting/tuning of boosted tree model to resamples 
- `3_tune_en_ex1.R`: fitting/tuning of elastic net model to resamples 
- `3_tune_knn_ex1.R`: fitting/tuning of k-nearest neighbors model to resamples 
- `3_tune_rf_ex1.R`: fitting/tuning of random forest model to resamples 
- `4_model_analysis_ex1.R`: analysis/comparison of models fit to resamples, final model selection
- `5_train_final_model_ex1.R`: training/fitting of final model
- `6_assess_final_model_ex1.R`: assessment of final model

### Directories

- `data_splits/`: contains setup of data: initial split, resamples, & controls for fitting to resamples 
- `recipes/`: contains all preprocessing/feature engineering objects
- `results/`: contains results from training/fitting models to resamples