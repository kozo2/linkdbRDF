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

knapsack_links <- getLinks("compound", "knapsack")
pubchem_links <- getLinks("compound", "pubchem") # this may takes more than 10 seconds
chebi_links <- getLinks("compound", "chebi") # this may takes more than 10 seconds
nikkaji_links <- getLinks("compound", "nikkaji")
chembl_links <- getLinks("compound", "chembl")
hmdb_links <- getLinks("compound", "hmdb")

# aggregate multiple IDs for a KEGG ID
library(dplyr)

mygroup <- function(links){
  by.type <- group_by(links, fromlabel)
  by.db <- summarize(by.type, tolabel = toString(tolabel))
  return(by.db)
}

# merge them all
mergedone <- merge(mygroup(knapsack_links), mygroup(pubchem_links), by = "fromlabel", all = T)
mergedone <- merge(mergedone, mygroup(chebi_links), by = "fromlabel", all = T)
mergedone <- merge(mergedone, mygroup(nikkaji_links), by = "fromlabel", all = T)
mergedone <- merge(mergedone, mygroup(chembl_links), by = "fromlabel", all = T)
mergedone <- merge(mergedone, mygroup(hmdb_links), by = "fromlabel", all = T)
View(mergedone)

cols <- c("kegg", "knapsack", "pubchem", "chebi", "nikkaji", "chembl", "hmdb")
colnames(mergedone) <- cols
write.csv(mergedone, file="linkdbCpdIDs.csv")
```
