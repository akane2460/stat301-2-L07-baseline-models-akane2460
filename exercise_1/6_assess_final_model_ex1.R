# L07 Baseline Models: Exercise 1 ----
# Assess final model

# load packages ----
library(tidyverse)
library(tidymodels)
library(here)

# handle common conflicts
tidymodels_prefer()

# load test data----
load(here("exercise_1/data_splits/abalone_test.rda"))

# load trained models ----
load(here("exercise_1/results/final_rf_fit.rda"))

# setting metrics  
ames_metrics <- metric_set(rmse, rsq, mae, mape)

# predicted vs. test value tibble
predicted_final_fit <- bind_cols(abalone_test, predict(final_rf_fit, abalone_test)) |> 
  select(age, .pred)

# ames metrics applied
final_fit_metrics <- ames_metrics(predicted_final_fit, truth = age, estimate = .pred)

final_fit_metrics |> 
  knitr::kable()

# predicted vs. observed
predicted_vs_age_plot <- predicted_final_fit |> 
  ggplot(aes(x = age, y = .pred)) + 
  geom_abline() + # diagonal line, indicating a completely accurate prediction
  geom_point(alpha = 0.5) + 
  labs(title = "Random Forest Model Abalone Age Predictions",y = "Predicted Age", x = "Age") +
  coord_obs_pred()

ggsave(here("exercise_1/results/predicted_vs_age_plot.png"), predicted_vs_age_plot)
