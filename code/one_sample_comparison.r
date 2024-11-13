install.packages("devtools")
install.packages("tidyverse")
# power calculation

# change analysis
mean_change = 0.5
sd_change = 1
alpha = 0.05
power = 0.8

# calculate the effect size
effect_size = mean_change / sd_change

# calculate the critical value (the standardized effect size to be used in the power calculation)
z_alpha = qnorm(1 - alpha / 2)
z_beta = qnorm(power)
z_diff = z_alpha + z_beta

# calculate the sample size
sample_size = (z_diff/effect_size)^2

print(sample_size)