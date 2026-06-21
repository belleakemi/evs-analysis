# Set working directory
setwd ("C:/Users/Belle/Documents/Belle - Nanosight/dados_raw")
nanosight_intersect_p90_dep <- read.csv("nanosight_intersect_p90_dep.csv")

# Packages
library(ggplot2)
library(dplyr)
library(patchwork)


### Descriptive graphs for size, concentration and percentage
# Graph A - Size
plot_a <- ggplot(nanosight_intersect_p90_dep, aes(x = grupo_analise_dep, y = tamanho_mode_average, fill = wave)) +
  geom_boxplot(position = position_dodge(width = 0.8), outlier.shape = NA, alpha = 0.7, width = 0.6) +
  geom_jitter(aes(color = wave), position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.8), size = 2.2, alpha = 0.8) +
  labs(title = "A) EV's Average of Mode's Size (depression)", x = "Trajectory", y = "Size (nm)", fill = "Time point", color = "Time point") +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(size = 18, face = "bold", hjust = 0),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        legend.position = "right",
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 13)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray40")
# Graph B - Concentration
plot_b <- ggplot(nanosight_intersect_p90_dep, aes(x = grupo_analise_dep, y = concentracao_real, fill = wave)) +
  geom_boxplot(position = position_dodge(width = 0.8), outlier.shape = NA, alpha = 0.7, width = 0.6) +
  geom_jitter(aes(color = wave), position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.8), size = 2.2, alpha = 0.8) +
  labs(title = "B) EV's Concentration", x = "Trajectory", y = "Concentration (particles/mL)", fill = "Time point", color = "Time point") +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(size = 18, face = "bold", hjust = 0),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        legend.position = "right",
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 13)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray40")
# Graph C - Small EV %
plot_c <- ggplot(nanosight_intersect_p90_dep, aes(x = grupo_analise_dep, y = EV_pequenas_porcentagem, fill = wave)) +
  geom_boxplot(position = position_dodge(width = 0.8), outlier.shape = NA, alpha = 0.7, width = 0.6) +
  geom_jitter(aes(color = wave), position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.8), size = 2.2, alpha = 0.8) +
  labs(title = "C) Small EV's Percentage", x = "Trajectory", y = "Percentage (%)", fill = "Time point", color = "Time point") +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(size = 18, face = "bold", hjust = 0),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        legend.position = "right",
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 13)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray40")
# Combine graphs + overall title
painel_final_dep_mode <- 
  (plot_a / plot_b / plot_c) +
  plot_layout(guides = "collect") +
  plot_annotation(
    title = "p90 - Depression",
    theme = theme(
      plot.title = element_text(
        size = 18,
        face = "bold",
        hjust = 0.5
      )
    )
  )

# Save
ggsave(
  filename = "p90_Depression.png",
  plot = painel_final_dep_mode,
  width = 11,
  height = 14,
  dpi = 300
)




