# Instalar pacotes (se necessário)
install.packages("tidyverse")
install.packages("gtsummary")
install.packages("flextable")
install.packages("conflicted")

# Carregar pacotes
library(tidyverse)
library(gtsummary)
library(flextable)
library(conflicted)

# Resolver conflitos de funções, se houver
conflict_prefer("filter", "dplyr")
# Definir o diretório de trabalho
setwd("/Users/mac/Downloads/")

# Verificar o diretório de trabalho atual
print(getwd())
# Carregar o arquivo CSV
dados <- read.csv("/Users/mac/Downloads/heart_disease_c.csv")

# Visualizar as primeiras linhas dos dados
head(dados)
# Criação de tabela descritiva
tabela_descritiva <- tbl_summary(dados)
tabela_descritiva
# Calcular a mediana (substitua 'alguma_variavel' pelo nome correto da variável)
valor <- dados$alguma_variavel  # Substitua 'alguma_variavel' pelo nome correto da variável
mediana <- median(valor, na.rm = TRUE)
print(mediana)

# Criação de tabela descritiva usando gtsummary e flextable
Resumo <- dados %>% gtsummary::tbl_summary() %>% as_flex_table()
print(Resumo)
# Gráfico de barras para uma variável categórica
ggplot(dados, aes(x = grupo)) +
  geom_bar() +
  labs(title = "Distribuição por Grupo", x = "Grupo", y = "Contagem")

# Gráfico de boxplot
ggplot(dados, aes(x = grupo, y = valor)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Boxplot de Valor por Grupo", x = "Grupo", y = "Valor")
Refazendo, reinstalando me certificando.
# Instalar pacotes (se necessário)
install.packages("dplyr")
install.packages("ggplot2")

# Carregar pacotes
library(dplyr)
library(ggplot2)
# Definir o diretório de trabalho
setwd("C:/DELL-DIOGO/Atividade_01")

# Carregar o arquivo CSV
dados <- read.csv("/Users/mac/Downloads/heart_disease_c.csv")
# Visualizar os nomes das colunas
colnames(dados)
[1] "genero"          "tipo_de_cancer"  "outra_coluna"    ...
# Analisar a distribuição da variável 'genero'
distribuicao_genero <- dados %>%
  group_by(genero) %>%
  summarise(Contagem = n())

# Visualizar a distribuição
print(distribuicao_genero)

# Analisar a distribuição da variável 'tipo_de_cancer'
distribuicao_tipo_cancer <- dados %>%
  group_by(tipo_de_cancer) %>%
  summarise(Contagem = n())

# Visualizar a distribuição
print(distribuicao_tipo_cancer)

# Gráfico de barras para a variável 'genero'
ggplot(dados, aes(x = genero)) +
  geom_bar() +
  labs(title = "Distribuição por Gênero", x = "Gênero", y = "Contagem")

# Gráfico de barras para a variável 'tipo_de_cancer'
ggplot(dados, aes(x = tipo_de_cancer)) +
  geom_bar() +
  labs(title = "Distribuição dos Tipos de Câncer de Mama", x = "Tipo de Câncer", y = "Contagem")
