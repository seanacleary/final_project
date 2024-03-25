here::i_am("code/02_make_figure.R")

data <- readRDS(
  file=here::here("output/data_clean.rds")
)

#load libraries
library(dplyr)
library(ggplot2)
library(corrplot)

#chi square
chi_data <- data %>% group_by(h1n1_vaccine) %>%
  summarize(
    behavioral_antiviral_meds=sum(behavioral_antiviral_meds),
    behavioral_avoidance=sum(behavioral_avoidance),
    behavioral_face_mask=sum(behavioral_face_mask),
    behavioral_wash_hands=sum(behavioral_wash_hands),
    behavioral_large_gatherings=sum(behavioral_large_gatherings),
    behavioral_outside_home=sum(behavioral_outside_home),
    behavioral_touch_face=sum(behavioral_touch_face)
  )

chi_data <- chi_data %>% select(-"h1n1_vaccine")

df_transpose = t(chi_data)
colnames(df_transpose) <- c("Unvaccinated", "Vaccinated")
rownames(df_transpose) <- c("Has taken antiviral medications", "Has avoided close contact with others with flu-like symptoms", "Has bought a face mask", "Has frequently washed hands/used hand sanitizer", "Has reduced time at large gatherings", "Has reduced contact with people outside of own household", "Has avoided touching eyes, nose, or mouth")

chisq <- chisq.test(df_transpose)

#save as jpeg
jpeg(file=here::here("output/figure.jpeg"))

#make correlation plot
corrplot(chisq$residuals, is.cor = FALSE, title="Pearson residuals for dependence between \nvaccination status and disease mitigation behaviors", mar=c(1,1,2,1), cl.ratio=1)

dev.off()

#save output
#ggsave(
#  here::here("output/figure.png"),
#  plot=replayPlot(corr_plot)
#)

#saveRDS(
#  corr_plot, file=here::here("output/figure.rds")
#)