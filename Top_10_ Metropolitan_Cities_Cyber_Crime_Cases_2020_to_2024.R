# 1. Load packages
library(tidyverse)
library(readxl)

# 2. Import Excel file
city_data <- read_excel(
  "C:/Users/HP/OneDrive/Desktop/RProject/NCRB_Metropolitan_City_Cyber_Crime_2020_2024.xlsx",
  sheet = "All_19_Cities"
)

# 3. Select Top 10 Metropolitan Cities
top10_cities <- city_data %>%
  arrange(desc(Five_Year_Total)) %>%
  slice_head(n = 10)

# 4. Convert data into long format
long_data <- top10_cities %>%
  select(City, `2020`, `2021`, `2022`, `2023`, `2024`) %>%
  pivot_longer(
    cols = `2020`:`2024`,
    names_to = "Year",
    values_to = "Cases"
  )

# 5. Convert Year into numeric format
long_data$Year <- as.integer(long_data$Year)

# 6. Create line graph
p <- ggplot(
  long_data,
  aes(
    x = Year,
    y = Cases,
    color = City,
    group = City
  )
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  scale_x_continuous(breaks = 2020:2024) +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Top 10 Metropolitan Cities: Cyber Crime Cases (2020-2024)",
    x = "Year",
    y = "Number of Registered Cyber Crime Cases",
    color = "City"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.position = "bottom"
  ) +
  guides(color = guide_legend(ncol = 2))

# 7. Display graph
print(p)

# 8. Save graph
ggplot2::ggsave(
  "Top10_Metropolitan_City_Cyber_Crime.png",
  plot = p,
  width = 12,
  height = 7,
  dpi = 300
)
