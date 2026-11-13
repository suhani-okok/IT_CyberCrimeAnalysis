# 1. Load the required libraries
library(readxl)
library(tidyverse)

# 2. Import the data

raw_data <- read_excel("D:/IT Project/crime_type_data.xlsx", sheet = 1)

# 3. Reshape the data to long format
tidy_data <- raw_data %>%
  pivot_longer(
    cols = c(`2020`,`2021`, `2022`, `2023`, `2024`),
    names_to = "Year",
    values_to = "Offences"
  )

# 4. Generate the Grouped Bar Chart
ggplot(tidy_data, aes(x = Year, y = Offences, fill = `Crime Head`)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  geom_text(aes(label = Offences), position = position_dodge(width = 0.7), vjust = -0.5, size = 3.5) +
  labs(
    title = "Comparison of Offences by Crime Head (2020-2024)",
    x = "Year",
    y = "Number of Offences",
    fill = "Crime Category"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "bottom",
    legend.direction = "vertical",
    plot.title = element_text(face = "bold", hjust = 0.5)
  )
