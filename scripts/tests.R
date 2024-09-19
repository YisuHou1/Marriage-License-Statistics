#### Preamble ####
# Purpose: Test Simulated Dataset
# Author: Yisu Hou
# Date: 19 September 2024
# Contact: yisu.hou@mail.utoronto.ca
# License: None

#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/simulated.csv")

# Test for negative numbers
data$number_of_marriage |> min() <= 0

# Test for NAs
all(is.na(data$number_of_marriage))