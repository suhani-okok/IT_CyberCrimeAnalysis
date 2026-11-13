
library(readxl)
library(tidyr)
library(ggplot2)

# A pop-up window will open—select your Excel file directly
df <- read_excel("D:/IT Project/crime_type_data.xlsx",sheet = 2)


df_long <- pivot_longer(
  df,
  cols = -1,
  names_to = "Year",
  values_to = "Cases"
)

# Standardize the first column name to 'Category'
colnames(df_long)[1] <- "Category"

# Plot the comparison chart
ggplot(df_long, aes(x = Year, y = Cases, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Cases), 
            position = position_dodge(width = 0.9), 
            vjust = -0.4, 
            size = 3.5) +
  labs(
    title = "Comparison of Cyber Crimes (2020-2024)",
    x = "Year",
    y = "Number of Reported Cases",
    fill = "Category"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")
