police_data <- read.csv("C:/Users/syedp/OneDrive/Documents/Data Visualization/37-00049_UOF-P_2016_prepped.csv")


library(tidyverse)

# Create a two-way table of officer gender and subject race
table_data <- police_data %>%
  select(OFFICER_GENDER, SUBJECT_RACE) %>%
  table()

# Convert the table to a data frame and add column names
table_df <- as.data.frame.table(table_data)
colnames(table_df) <- c("Officer Gender", "Subject Race", "Frequency")

# Print the table
table_df

# Load necessary packages
library(ggplot2)
library(scales)

# Create a data frame of subject races and count occurrences
subject_races <- data.frame(table(police_data$SUBJECT_RACE))

# Create a pie chart of subject races
ggplot(data = subject_races, aes(x = "", y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar(theta = "y") +
  scale_fill_manual(values = c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#5DA5DA")) +
  labs(title = "Distribution of Subject Races") +
  theme_void() +
  theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"))

# Load necessary packages
library(ggplot2)
library(scales)

# Create a data frame of officer races and count occurrences
officer_races <- data.frame(table(police_data$OFFICER_RACE))

# Create a bar plot of officer races
ggplot(data = officer_races, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", width = 0.5, color = "black") +
  scale_fill_manual(values = c("#5DA5DA", "#FAA43A", "#60BD68", "#F17CB0", "#B2912F", "#B276B2", "#DECF3F")) +
  labs(title = "Distribution of Officer Races", x = "Race", y = "Count") +
  theme_minimal(base_size = 16) +
  theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
        axis.title = element_text(size = 18, face = "bold"),
        axis.text = element_text(size = 16),
        legend.position = "none")
# Load necessary packages
library(ggplot2)

# Create a data frame of subject races and count occurrences
subject_races <- data.frame(table(police_data$SUBJECT_RACE))

# Create a pie chart of subject races
ggplot(data = subject_races, aes(x = "", y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
  coord_polar(theta = "y") +
  labs(title = "Distribution of Subject Races") +
  theme_classic() +
  theme(plot.title = element_text(size = 16, face = "bold"),
        axis.title = element_blank(),
        axis.text = element_blank(),
        legend.title = element_blank(),
        legend.text = element_text(size = 10),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", color = "black")) +
  guides(fill = guide_legend(title = "Race"))

