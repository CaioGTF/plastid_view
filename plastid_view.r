library(ggplot2)
library(dplyr)


FILE_PATH <- "plastid_bin_stats.csv"


# Load plastid_stats output
df <- read.csv(FILE_PATH, header = TRUE)


# Filter bins with >10% plastid content
df_filtrado <- df %>%
filter(plastid_nt_percent > 10)


# Plot plastid content per bin
ggplot(df_filtrado, aes(x = reorder(bin_id, plastid_nt_percent),
y = plastid_nt_percent)) +
geom_col(fill = "#2C7FB8") +
geom_text(aes(label = paste0(round(plastid_nt_percent, 1), "%")),
hjust = -0.1,
size = 3.5) +
coord_flip() +
labs(
title = "Bins with high plastid content",
subtitle = "Bins with more than 10% plastid-derived nucleotides",
x = "Bins",
y = "Plastid content (%)"
) +
scale_y_continuous(expand = expansion(mult = c(0, 0.15))) +
theme_minimal(base_size = 12) +
theme(
plot.title = element_text(face = "bold"),
axis.text.y = element_text(size = 10)
)