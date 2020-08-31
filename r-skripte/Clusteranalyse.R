# download.file("https://goo.gl/whKjnl", destfile = "tips.csv")
tips <- read.csv2("tips.csv")

library(mosaic) # Paket laden

tipsscale <- tips %>%
  select(size, total_bill, tip) %>% # Variablen wählen
  scale() %>% # Skalieren
  data.frame() # Als Datensatz definieren

tipsscale %>% head(n = 3) # Erste drei Beobachtungen

tipsscale %>% head(n = 3) %>%
  dist() # Distanz

set.seed(1896) # Zufallszahlengenerator setzen
ergkclust <- kmeans(tipsscale, # Datensatz
                    centers = 3, # Anzahl Zentren: k
                    nstart = 10) # Anzahl Startpartitionen

ergkclust$size # Anzahl Beob. je Cluster

ergkclust$centers # Cluster Zentren

set.seed(1896) # Reproduzierbarkeit
maxk <- 10 # Maximale Anzahl Cluster
anzk <- 1:maxk # Vektor mit Clusterzahl
sse <- numeric(maxk) # (leerer) Ergebnisvektor
# Schleife über Anzahl Cluster; SSE speichern
for (k in anzk)
  sse[k] <- kmeans(tipsscale, centers = k)$tot.withinss

gf_line(sse ~ anzk)

