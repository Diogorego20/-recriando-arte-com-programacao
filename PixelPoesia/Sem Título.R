# Diogo da Silva Rego, Matricula: 202400456381

# Projeto Prático 2024.2

# Usando o Banco de Dados de Pacientes com Cancer de Mama.

# Obrijetivo: 
Treinar a utiliza ̧c ̃ao dos pacotes tidyverse, gtsummary e flextable. Cada aluno deve escolher uma vari ́avel qualitativa como grupo e fazer uma an ́alise descritiva e comparativa simples, por meio de medidas descritivas, tabelas e gr ́aficos. A parte da compara ̧c ̃ao resume-se apenas em indicar os p-valores menores que 5%, o que indica uma diferen ̧ca entre os grupos naquela vari ́avel. Para tanto os alunos podem utilizar dois tipos de dados:
  • Banco de dados sugerido: conjunto de dados que cont ́em informa ̧c ̃oes de pacientes com cˆancer de mama. Download em: Breast Cancer e maiores informa ̧c ̃oes sobre as vari ́aveis em: IEEEDa- taPort

# Instalação dos pacotes necessários
 install.packages(c("tidyverse", "gtsummary", "flextable", "conflicted"))
 
 # Carregando pacotes
 library(tidyverse)
 library(gtsummary)
 library(flextable)
 library(conflicted)
 
# Definindo o diretório de trabalho.
 
 ")

 # Segundo o livro R Para Data Science.
dir <- "/Users/mac/Downloads/Breast_Cancer.csv"
  if(file.existc(dir)) {
    setwd(dir)
    print(getwd())
  } else {
    print("o diretorio especificado nao existe.")
    dados <read.csv("seer_breast_cancer_data.csv")
  }
  
head(dados)


help(setwd)
 
 # Verificarse o diretório foi alterado corretamente.
  print(getwd())

  
# Carregar o arquivo CSV baixado no link do site sujerido.
  
  
  dados<- read.csv("/Users/mac/Downloads/SEER Breast Cancer Dataset .csv")
  
# Linhas do dataset

head(dados)

# Definido as preferencias da função em caso de conflito.

 conflict_prefer("filter", "dplyr")
 
# Verificando as colunas do dataset

 colnames(dados)
 
# Resumo descritivo ultilizado a coluna 'race'como frup e 'Tumor.Size'para a análise
 # Operador pipe
 
 resumo <- dados %>%
   group_by(race) %>%
   summarise(
   media = mean(Tumor.Size, na.rm = TRUE),
   mediana = median(Tumor.Size, na.rm = TRUE),
   desvio_padrao = sd(Tumor.Size, na.rm = TRUE)
   )
   
# Criar tabela descritiva

  resumo %>%
    gtsummary::tbl_summary() %>%
    as_flex_table()
    
# Visualizacção gráfica.

  ggplot(dados, aes(x = Race, y = Tumor.Size)) + 
    geom_boxplot() +
    Theme_minimal()
    
# Ajustes e correções:
 # Instalações dos pacotes, combinei a instalção em uma única linha.
 
# Corri o nome do diretório removendo o espaço extra e os parênteses faltante.

# Carremetos de dados:
  # Correção do caminho
   )
   