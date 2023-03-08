get_pheno <- function(key1, key2=NULL){

  if(!is.null(key2)){
    url_base <- "https://www.informatics.jax.org/allele/report.txt?phenotype="
    url_body <- paste0(url_base, key1,"+AND+", key2, "&nomen=&chromosome=any&cm=&coordinate=&coordUnit=bp")
    response <- purrr::map(url_body, purrr::safely(vroom::vroom))
    reponse1 <- purrr::transpose(response)
    reponse_final <- reponse1[["result"]]
    reponse_final <- reponse_final[[1]]
    reponse_final <- reponse_final[,c("MGI Allele ID", "Allele Symbol", "Allele Name", "Chromosome",
                                      "Allele Attributes", "Human Disease Models")]
    return(reponse_final)
  }
  url_base <- "https://www.informatics.jax.org/allele/report.txt?phenotype="
  url_body <- paste0(url_base, key1,"&nomen=&chromosome=any&cm=&coordinate=&coordUnit=bp")
  response <- purrr::map(url_body, purrr::safely(vroom::vroom))
  reponse1 <- purrr::transpose(response)
  reponse_final <- reponse1[["result"]]
  reponse_final <- reponse_final[[1]]
  reponse_final <- reponse_final[,c("MGI Allele ID", "Allele Symbol", "Allele Name", "Chromosome",
                                    "Allele Attributes", "Human Disease Models")]
  return(reponse_final)
}



prueba <- get_pheno("Alzheimer", "Inflammation")

