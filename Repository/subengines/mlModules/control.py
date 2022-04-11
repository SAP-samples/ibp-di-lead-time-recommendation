datetime = "IOTIME"
categorical = ["PRDID", "LOCTO", "LOCID"]
drop = ["ROTIME"]
time_cols = ["weekday", "weeknumber", "month"]

#Model Configuration
model_params = {
    "learning_rate": 0.02,
    "iterations": 1000,
    "early_stopping_rounds": 50,
    "depth": 16
}

fit_test_split = 0.9
train_valid_split = 0.75

#Fit Configuration
y = "LT"
x = ["PRDID", "LOCTO", "LOCID", "QTY", "WEEKDAY", "WEEKNUMBER", "MONTH"]
verbose = 100
