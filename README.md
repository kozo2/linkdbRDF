# linkdbrdf
A R client library for LinkDB RDF Endpoint

Installation
------------
```R
install.packages("devtools")
install.packages("SPARQL")
install.packages("hash")
library(devtools)
install_github("kozo2/linkdbrdf")
```

Examples
--------
```R
library(linkdbrdf)
knapsacklinks <- getLinks("compound", "knapsack")
pubchemlinks <- getLinks("compound", "pubchem")
chebilinks <- getLinks("comopund", "chebi")
nikkajilinks <- getLinks("compound", "nikkaji")
total <- merge(knapsacklinks, pubchemlinks, by = "fromlabel", all.x = T, all.y = T)
View(total)
```
