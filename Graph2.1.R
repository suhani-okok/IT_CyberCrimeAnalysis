# Title: Heatmap for Cybercrime Data (2020-2024)
# Description: This R script imports cybercrime data from an Excel file,
#              reshapes it, and creates a clean, color-coded heatmap grid.

# 1. Install and Load Required Packages
# Un-comment the lines below if you need to install these packages first:
# install.packages("readxl")
# install.packages("tidyverse")

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

# 2. Define File Path (Replace with your actual file path if different)
file_path <- "D:/IT Project/crime_head_data.xlsx"

# 3. Read the Excel File
df <- read_excel(file_path)

# 4. Reshape Data for Plotting
df_long <- df %>%
  rename(Crime_Head = `Crime Head`) %>%
  pivot_longer(
    cols = c("2020","2021", "2022", "2023", "2024"),
    names_to = "Year",
    values_to = "Incidents"
  )

# 5. Create the Heatmap
ggplot(df_long, aes(x = Year, y = Crime_Head, fill = Incidents)) +
  geom_tile(color = "white", size = 0.5) + # Creates grid borderlines
  scale_fill_gradient(low = "#fee0d2", high = "#de2d26", labels = scales::comma) + # Soft red to dark red gradient
  geom_text(aes(label = scales::comma(Incidents)), color = "black", size = 3.5) + # Overlays actual numbers on tiles
  labs(
    title = "Year-wise Heatmap Matrix of Cybercrime Heads",
    subtitle = "Visualizing intensity of incidents (2020-2024)",
    x = "Year",
    y = "Cybercrime Category",
    fill = "Total Incidents"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.text.y = element_text(size = 10),
    panel.grid = element_blank() # Removes default background grid lines
  )

# 6. Optional: Save the Heatmap
# ggsave("cybercrime_heatmap.png", width = 10, height = 6, dpi = 300)
