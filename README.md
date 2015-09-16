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
pubchemlinks <- getLinks("compound", "pubchem") # this may takes more than 10 seconds
chebilinks <- getLinks("compound", "chebi") # this may takes more than 10 seconds
nikkajilinks <- getLinks("compound", "nikkaji")
chembllinks <- getLinks("compound", "chembl")

mergedone <- merge(knapsacklinks, pubchemlinks, by = "fromlabel", all.x = T, all.y = T)
mergedone <- merge(mergedone, chebilinks, by = "fromlabel", all.x = T, all.y = T)
mergedone <- merge(mergedone, nikkajilinks, by = "fromlabel", all.x = T, all.y = T)
mergedone <- merge(mergedone, chembllinks, by = "fromlabel", all.x = T, all.y = T)
View(mergedone)

cols <- c("kegg", "knapsack", "pubchem", "chebi", "nikkaji", "chembl")
colnames(mergedone) <- cols
write.csv(mergedone, file="linkdbCpdIDs.csv")
```
