# download.file("https://goo.gl/whKjnl", destfile = "tips.csv")
tips <- read.csv2("tips.csv")
library(mosaic) # Paket laden

tipsscale <- tips %>%
  select(size, total_bill, tip) %>% # metrische Variablen wählen
  scale() %>% # Skalieren
  data.frame() # Als Datensatz definieren

library(corrplot) # ggfs. einmalig vorab installieren
cor(tipsscale) %>%
  corrplot()

ergpca <- prcomp( ~ size + total_bill + tip,
                  data=tipsscale)

plot(ergpca, type="l")

summary(ergpca)

biplot(ergpca)

ergpca$rotation[,1:2]

library(psych) # ggfs. einmalig vorab installieren
ca <- alpha(tipsscale, check.keys = TRUE)
summary(ca)


