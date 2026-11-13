
library(ggplot2)

# Step 1: Enter the data
data <- data.frame(
  State = rep(c(
    "Karnataka", "Maharashtra", "Telangana",
    "Tamil Nadu", "Uttar Pradesh", "Bihar",
    "Andhra Pradesh", "Odisha", "Kerala", "Jharkhand"
  ), each = 5),
  
  Year = rep(c("2020", "2021", "2022", "2023", "2024"), 10),
  
  Cases = c(
    18638, 26248, 15833, 12446, 19068,
    8505, 10669, 12505, 16128, 18059,
    2849, 5664, 7724, 9179, 15738,
    722, 1248, 2116, 3842, 7549,
    5737, 6833, 5975, 5645, 6383,
    1183, 1739, 2308, 3405, 5384,
    2574, 3689, 4388, 4381, 5242,
    2512, 3600, 3705, 3200, 4520,
    404, 639, 850, 875, 3396,
    1963, 2295, 2366, 2674, 2723
  )
)

# Step 2: Arrange state names
state_order <- c(
  "Karnataka", "Maharashtra", "Telangana",
  "Tamil Nadu", "Uttar Pradesh", "Bihar",
  "Andhra Pradesh", "Odisha", "Kerala", "Jharkhand"
)

data$State <- factor(data$State, levels = rev(state_order))

# Step 3: Create the graph
p <- ggplot(data, aes(x = Cases, y = State, fill = Year)) +
  geom_col(
    position = position_dodge(width = 0.8),
    width = 0.75
  ) +
  
  scale_fill_manual(values = c(
    "2020" = "#1f77b4",
    "2021" = "#ff7f0e",
    "2022" = "#2ca02c",
    "2023" = "#d62728",
    "2024" = "#9467bd"
  )) +
  
  labs(
    title = "Top 10 States: Pending Cyber-Crime Cases for Investigation (2020-2024)",
    x = "Cases pending investigation from previous year",
    y = "State",
    fill = "Year"
  ) +
  
  theme_minimal() +
  
  theme(
    plot.title = element_text(
      size = 15, face = "bold", hjust = 0.5
    ),
    axis.title = element_text(size = 11),
    axis.text = element_text(size = 10),
    legend.position = "bottom",
    panel.grid.major.y = element_blank()
  )

# Step 4: Display graph
print(p)

# Step 5: Save graph
ggsave(
  "Pending_Cyber_Crime_Graph.png",
  plot = p,
  width = 12,
  height = 7,
  dpi = 300
)

