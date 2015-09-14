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
foo <- getLinks("compound", "knapsack")
bar <- getLinks("compound", "pubchem")
total <- merge(foo, bar, by = "fromlabel", all.x = T, all.y = T)
View(total)
```
