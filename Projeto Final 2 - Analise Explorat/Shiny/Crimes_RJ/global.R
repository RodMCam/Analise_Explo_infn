

library(conflicted)
library(tidyverse)
library(dlookr)
library(summarytools)
library(knitr)
library(corrplot)
library(lubridate) 

base_dados_s <- read_csv2("BaseDPEvolucaoMensalCisp.csv")

base_dados_s$Data <- dmy(str_c("01",base_dados_s$mes,base_dados_s$ano , sep="-"))

base_dados_s <- dplyr:: select( base_dados_s, c(Data, furto_bicicleta )) %>%
              na.omit()

base_dados_s <- base_dados_s %>%
                  group_by(Data) %>%
                    summarise(furto_bicicleta = sum(furto_bicicleta))


