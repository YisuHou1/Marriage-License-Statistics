#### Preamble ####
# Purpose: Clean Raw Data
# Author: Yisu Hou
# Date: 19 September 2024
# Contact: yisu.hou@mail.utoronto.ca
# License: None

#### Workspace setup ####
library(tidyverse)

raw_data <- read_csv("data/raw_data.csv")

cleaned_data <- raw_data %>%
  janitor::clean_names() %>%
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") %>%
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-")))

write_csv(cleaned_data, "data/cleaned_data.csv")

cleaned_data %>% ggplot(aes(x = date, y = marriage_licenses)) + 
  geom_point() + 
  labs(title = "Marriage Licenses in Toronto Before and After Covid",
       x = "Year", y = "Number of Licenses")

