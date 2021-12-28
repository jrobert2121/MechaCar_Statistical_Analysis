library(dplyr)

# Linear Regression to Predict MPG
# read csv to dataframe
mpg_table <- read.csv(file = 'MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# multiple linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_table)

# find p value and r squared
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_table))

#Suspension Coil Lot Analysis
#read csv to dataframe
suspension_coil <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# create summary dataframe
table_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# create summary for each lot
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# T-tests on Suspension Coils
# across all lots
t.test(suspension_coil$PSI, mu=1500)

# across each lot
t.test(subset(suspension_coil, Manufacturing_Lot == 'Lot1')$PSI, mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot == 'Lot2')$PSI, mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot == 'Lot3')$PSI, mu=1500)
