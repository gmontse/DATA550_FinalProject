here::i_am("code/acne_hist.R")

data <- read.csv(
  file = here::here("data/PCOS_clean_data.csv")
)

library(ggplot2)

#acne scatterplot
  #separate by category
  no_acne <- subset(data, PCOS_Symptom_Acne == 0)
  acne <- subset(data, PCOS_Symptom_Acne == 1)
  
#no acne and microbiome abundance histogram
no_acne_hist <- ggplot(
  no_acne, 
  aes(x = Microbiome_Info_Abundance)
  ) +
  geom_histogram(
    fill = "plum4", 
    color = "white", 
    alpha = 0.7, 
    bins = 20
  ) +
  labs(
    title = "Distribution of Microbiome Abundance (No Acne)",
    x = "Microbiome Abundance",
    y = "Frequency"
  ) +
  theme_minimal()

print(no_acne_hist)

#save histogram to output directory
ggsave(
  here::here("output/no_acne_hist.png"),
  plot = no_acne_hist,
  device = "png"
)

#Acne and Microbiome Abundance Histogram

acne_hist <- ggplot(
  acne, 
  aes(x = Microbiome_Info_Abundance)
) +
  geom_histogram(
    fill = "plum3", 
    color = "white", 
    alpha = 0.7, 
    bins = 20
  ) +
  labs(
    title = "Distribution of Microbiome Abundance (Acne)",
    x = "Microbiome Abundance",
    y = "Frequency"
  ) +
  theme_minimal()

print(acne_hist)

#save the histogram png to output folder
ggsave(
  here::here("output/acne_hist.png"),
  plot = acne_hist,
  device = "png"
)

#Acne and Microbiome Diversity Histogram Plots 
acne_diversity_hist <- ggplot(
  acne, 
  aes(x = Microbiome_Info_Diversity)
) +
  geom_histogram(
    fill = "dodgerblue", 
    color = "white", 
    alpha = 0.7, 
    bins = 20
  ) +
  labs(
    title = "Distribution of Microbiome Diversity (Acne)",
    x = "Microbiome Diversity",
    y = "Frequency"
  ) +
  theme_minimal()

print(acne_diversity_hist)

#save histogram to outputl folder
ggsave(
  here::here("output/acne_diversity_hist.png"),
  plot = acne_diversity_hist,
  device = "png"
)

#No Acne and Microbiome Diversity Histogram
no_acne_diversity_hist <- ggplot(
  no_acne, 
  aes(x = Microbiome_Info_Diversity)
) +
  geom_histogram(
    fill = "dodgerblue4", 
    color = "white", 
    alpha = 0.7, 
    bins = 20
  ) +
  labs(
    title = "Distribution of Microbiome Diversity (No Acne)",
    x = "Microbiome Diversity",
    y = "Frequency"
  ) +
  theme_minimal()

print(no_acne_diversity_hist)

#Save histogram to output folder
ggsave(
  here::here("output/no_acne_diversity_hist.png"),
  plot = no_acne_diversity_hist,
  device = "png"
)
