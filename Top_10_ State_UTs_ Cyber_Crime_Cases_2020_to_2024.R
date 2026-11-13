# 1. Load packages
library(tidyverse)
library(readxl)

# 2. Import Excel file
cyber_data <- read_excel(
  "C:/Users/HP/OneDrive/Desktop/RProject/NCRB_Cyber_Crime_State_UT_2020_2024.xlsx",
  sheet = "All_State_UT_Data"
)

# 3. Select Top 10 States/UTs
top10 <- cyber_data %>%
  arrange(desc(Five_Year_Total_2020_2024)) %>%
  slice_head(n = 10)

# 4. Convert data into long format
long_data <- top10 %>%
  select(`State/UT`, `2020`, `2021`, `2022`, `2023`, `2024`) %>%
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
    color = `State/UT`,
    group = `State/UT`
  )
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  scale_x_continuous(breaks = 2020:2024) +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Top 10 States/UTs: Cyber Crime Cases (2020-2024)",
    x = "Year",
    y = "Number of Registered Cyber Crime Cases",
    color = "State/UT"
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
ggsave(
  "Top10_Cyber_Crime_Line_Plot.png",
  plot = p,
  width = 12,
  height = 7,
  dpi = 300
)
