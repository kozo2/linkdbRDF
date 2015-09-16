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

# aggregate multiple IDs for a KEGG ID
library(dplyr)

mygroup <- function(links){
  by.type <- group_by(links, fromlabel)
  by.db <- summarize(by.type, tolabel = toString(tolabel))
  return(by.db)
}

# merge them all
mergedone <- merge(mygroup(knapsacklinks), mygroup(pubchemlinks), by = "fromlabel", all = T)
mergedone <- merge(mergedone, mygroup(chebilinks), by = "fromlabel", all = T)
mergedone <- merge(mergedone, mygroup(nikkajilinks), by = "fromlabel", all = T)
mergedone <- merge(mergedone, mygroup(chembllinks), by = "fromlabel", all = T)
View(mergedone)

cols <- c("kegg", "knapsack", "pubchem", "chebi", "nikkaji", "chembl")
colnames(mergedone) <- cols
write.csv(mergedone, file="linkdbCpdIDs.csv")
```
