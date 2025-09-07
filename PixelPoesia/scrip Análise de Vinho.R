## Introdução

### Contexto
O conjunto de dados de qualidade do vinho contém informações detalhadas sobre várias características químicas e físicas dos vinhos, e sua relação com a qualidade percebida. Analisar esses dados pode fornecer insights valiosos sobre os fatores que contribuem para um bom vinho.

### Importância da Análise
A análise exploratória de dados (AED) é fundamental para identificar padrões, entender a distribuição dos dados e descobrir relações entre variáveis. Isso é particularmente importante na produção de vinhos, onde pequenos ajustes podem levar a grandes melhorias na qualidade.

### Objetivos
Este trabalho tem como objetivo realizar uma análise exploratória dos dados de qualidade do vinho, abrangendo:
  - Criação de uma tabela de frequências por intervalos.
- Geração de uma tabela de medidas descritivas.
- Criação de gráficos para variáveis quantitativas e qualitativas.
- Realização de uma análise bivariada.
## Objetivos

### Geral
Analisar o conjunto de dados de qualidade de vinhos para identificar padrões e relações.

### Específicos
- Criar uma tabela de frequências por intervalos.
- Gerar uma tabela de medidas descritivas.
- Criar gráficos para variáveis quantitativas e qualitativas.
- Realizar uma análise bivariada.
## Metodologia

### Conjunto de Dados
O conjunto de dados utilizado neste trabalho foi extraído do Kaggle e contém informações sobre a qualidade de vinhos, incluindo variáveis quantitativas como acidez, pH e teor alcoólico, e variáveis qualitativas como a qualidade percebida do vinho.

### Ferramentas
A análise foi realizada utilizando a linguagem R, com pacotes como `dplyr` e `ggplot2` para a manipulação e visualização dos dados.

### Passos
1. **Limpeza dos Dados**: Verificação e tratamento de valores ausentes.
2. **Análise Descritiva**: Criação de tabelas de frequências e medidas descritivas.
3. **Análise Bivariada**: Criação de tabelas de contingência e gráficos de dispersão.
## Resultados e Discussões

### Tabela de Frequências por Intervalos
```r
# Tabela de frequências para a variável `quality`
tabela_frequencias <- table(dados_vinho$quality)
print(tabela_frequencias)
# Medidas descritivas para variáveis quantitativas
medidas_descritivas <- summary(dados_vinho$fixed.acidity)
print(medidas_descritivas)
# Gráfico de barras para `quality`
ggplot(dados_vinho, aes(x = quality)) + 
  geom_bar() + 
  ggtitle('Distribuição por Qualidade') + 
  xlab('Qualidade') + 
  ylab('Frequência')

# Histograma para `fixed.acidity`
ggplot(dados_vinho, aes(x = fixed.acidity)) + 
  geom_histogram(bins = 10) + 
  ggtitle('Distribuição de Acidez Fixa') + 
  xlab('Acidez Fixa') + 
  ylab('Frequência')
# Tabela de contingência para `quality` e `alcohol`
tabela_contingencia <- table(cut(dados_vinho$alcohol, breaks = 3), dados_vinho$quality)
print(tabela_contingencia)

# Gráfico de dispersão e coeficiente de correlação para `fixed.acidity` e `citric.acid`
correlacao <- cor(dados_vinho$fixed.acidity, dados_vinho$citric.acid)
print(correlacao)

ggplot(dados_vinho, aes(x = fixed.acidity, y = citric.acid)) + 
  geom_point() + 
  ggtitle('Acidez Fixa vs. Ácido Cítrico') + 
  xlab('Acidez Fixa') + 
  ylab('Ácido Cítrico')

#### 5. Conclusões
```markdown
## Conclusões
A análise exploratória de dados dos vinhos revelou padrões interessantes, como a distribuição das qualidades percebidas e a relação entre acidez fixa e ácido cítrico. Esses insights podem ser valiosos para produtores de vinho que buscam melhorar a qualidade de seus produtos.
## Referências
- Kaggle. Wine Quality Data Set. Disponível em: [Wine Quality Data Set](https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009)
- Wickham, H., & Grolemund, G. (2017). R for Data Science: Import, Tidy, Transform, Visualize, and Model Data. O'Reilly Media, Inc.
