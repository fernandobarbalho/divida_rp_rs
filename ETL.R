library(tidyverse)


info_consolidadas_dividas <- read_delim("20240513-11-info-consolidadas-dividas.csv", 
                                        delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ",", 
                                                                                            grouping_mark = ".", encoding = "latin1"), 
                                        trim_ws = TRUE)

dividas_rs_municipios_estados<-
  info_consolidadas_dividas %>%
  filter(UF=="RS")


dividas_rs_municipios_estados <- janitor::clean_names(dividas_rs_municipios_estados)


dividas_rs_municipios_estados %>%
  writexl::write_xlsx("dividas_rs_municipios_estados.xlsx")

saveRDS(dividas_rs_municipios_estados,"dividas_rs_municipios_estados.rds")


trata_finbra<- function(path){
  
  
  finbraRREO_estado_despesa <- read_delim(path, 
                                          delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ",", 
                                                                                              grouping_mark = ".", encoding = "latin1"), 
                                          trim_ws = TRUE, skip = 5)
  
  
  finbraRREO_estado_despesa <-janitor::clean_names(finbraRREO_estado_despesa)
  
  finbraRREO_estado_despesa %>%
    filter(uf == "RS")
  
  
}


##Trata despesa primária do estado

path<- "finbraRREO_ESTDF_CalculoAcimadaLinha-DespesasPrimarias/finbraRREO.csv"

despesa_primaria_rs<- trata_finbra(path)


##Trata receita primária do estado

path<- "finbraRREO_ESTDF_CalculoAcimadaLinha-ReceitasPrimarias/finbraRREO.csv"

receita_primaria_rs<- trata_finbra(path)


##Trata despesa primária dos municípios do estado

path<- "finbraRREO_MUNEST_CalculoAcimadaLinha-DespesasPrimarias/finbraRREO.csv"

despesa_primaria_mun_rs<- trata_finbra(path)



##Trata receita primária dos municípios do estado

path<- "finbraRREO_MUNEST_CalculoAcimadaLinha-ReceitasPrimarias/finbraRREO.csv"

receita_primaria_mun_rs<- trata_finbra(path)


