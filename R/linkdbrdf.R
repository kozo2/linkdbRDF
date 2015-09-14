#library(SPARQL)
#library(hash)

getCpdLinks <- function(fromdb, todb, inference = FALSE, limit = 0, endpoint="http://www.genome.jp/sparql/linkdb/"){

  limitC = ""
  if (limit != 0)
  if (is.numeric(limit) && ! is.null (grep ("/.",limit)))
  limitC = paste( " limit " , limit)
  else
  warning ("limit should be an integer, limit omitted from the query")

  sparql_base <- paste( "BASE <http://www.genome.jp/linkdb/> \n",
                        "SELECT ?fromlabel ?tolabel WHERE { \n",
                        "?from <equivalent> ?to . \n",
                        "?from <core/database> ?fromdb . \n",
                        "?to <core/database> ?todb . \n",
                        "?fromdb <core/dblabel> \"", fromdb, "\". \n",
                        "?todb <core/database> \"", todb, "\" . \n",
                        "?from rdfs:label ?fromlabel . \n",
                        "?to   rdfs:label ?tolabel . \n",
                        "} ORDER BY ?fromlabel ?tolabel \n",
                 limitC )

  if(inference) {
    query <- paste( "DEFINE input:inference 'http://reactionontology.org/inference' \n", sparql_base)
  }
  else {
    query <- sparql_base
  }

  message("Performing query please wait...")

  res <- tryCatch({
              SPARQL(url=endpoint,query)
          },
          error = function(err){
              message("an error occured when trying to query for ensembl genes ", err)
          })#end tryCatch

  #res<-SPARQL(url=endpoint,query)
  return (res$results)
}
