# 1. Install required packages (run these two lines once if not already installed)


# 2. Load the libraries
library(readxl)
library(ggplot2)

# 3. Import the Excel file

data <- read_excel("D:/IT Project/cyber_crime_data.xlsx", range = "A1:B6")

# Ensure columns are treated as numeric
data$Year <- as.numeric(data$Year)
data$Cases <- as.numeric(data$Cases)

# 4. Generate the Line Graph
ggplot(data, aes(x = Year, y = Cases)) +
  # Add the line
  geom_line(color = "#1f77b4", linewidth = 1.2) +
  # Add data points
  geom_point(color  = "#EF5350", size = 3.5) +
  # Add exact case numbers above each point
  geom_text(aes(label = format(Cases, big.mark = ",")), 
            vjust = -1.2, 
            size = 3.8, 
            fontface = "bold",
            color = "#333333") +
  # Format axes and titles
  scale_x_continuous(breaks = data$Year) +
  scale_y_continuous(labels = scales::comma, 
                     limits = c(40000, 115000)) +
  labs(
    title = "Cybercrime Growth Analysis (2020–2024)",
    subtitle = "Annual reported cybercrime cases showing steady upward growth",
    x = "Year",
    y = "Number of Reported Cases",
    caption = "Source: NCRB Cybercrime reports"
  ) +
  # Apply a clean, minimal theme
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(color = "gray40", margin = margin(b = 15)),
    plot.caption = element_text(hjust = 0, face = "italic", color = "gray50", margin = margin(t = 10)),
    panel.grid.minor = element_blank()
  )
