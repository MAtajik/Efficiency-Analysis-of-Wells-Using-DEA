path <- 'F:/Lamar University Spring 2023 Semester/Optimization/final project/trial'
# Path of the working directory
setwd(path)  # set working directory
getwd()
library(readxl)
CCR_data_file <- read_excel('F:/Lamar University Spring 2023 Semester/Optimization/final project/NitrateAV.xlsx')
View(CCR_data_file)
require(deaR)
ccr_model<-read_data(CCR_data_file, ni=9, no=1, dmus = 1, inputs=6:14, outputs=5)
View(ccr_model)
result_ccr <- model_basic(ccr_model, orientation = 'io', rts = 'crs', dmu_eval = 1:1197, dmu_ref=1:1197)
View(result_ccr)
efficiencies(result_ccr)
targets((result_ccr))
write.csv(targets(result_ccr), 'target.csv')
eff <-efficiencies((result_ccr))
write.csv(eff, 'eff.csv')
summary(result_ccr)
results <- summary(result_ccr)
write.csv(results, 'summary.csv')
plot(result_ccr)


# Load the efficiency scores
efficiencies <- efficiencies(result_ccr)
# Find the minimum and maximum efficiency scores
min_efficiency <- min(efficiencies)
max_efficiency <- max(efficiencies)
# Find the DMUs with the minimum and maximum efficiency scores
min_efficient_dmus <- which(efficiencies == min_efficiency)
max_efficient_dmus <- which(efficiencies == max_efficiency)
# Print the results
cat("Minimum efficient DMUs:", min_efficient_dmus, "\n")
cat("Maximum efficient DMUs:", max_efficient_dmus, "\n")


# Get the efficiency scores
eff <- efficiencies(result_ccr)
# Find the index of the maximum efficient DMU
max_eff_index <- which.max(eff)
# Find the index of the minimum efficient DMU
min_eff_index <- which.min(eff)
# Convert the maximum efficient DMU result value to 1 and the minimum efficient DMU value to 0
eff[eff == eff[max_eff_index]] <- 1
eff[eff == eff[min_eff_index]] <- 0
# Print the updated efficiency scores
eff
write.csv(eff, 'adjustmentfile.csv')






















