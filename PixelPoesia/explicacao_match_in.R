# Explicação sobre as funções match() e %in% em R

# Função match()
# --------------
# A função match() retorna as posições dos elementos de um vetor (x) em outro vetor (table).
# Se um elemento de x não estiver presente em table, o resultado será NA.

# Sintaxe:
# match(x, table, nomatch = NA_integer_, incomparables = NULL)

# Parâmetros:
# - x: O vetor de valores que você quer encontrar em table.
# - table: O vetor onde os valores de x serão procurados.
# - nomatch: O valor retornado quando um elemento de x não é encontrado em table. O padrão é NA.
# - incomparables: Um vetor de valores que não devem ser considerados para correspondência. O padrão é NULL.

# Exemplo:
x <- c("a", "b", "c", "d")
table <- c("c", "a", "b")
posicoes <- match(x, table)
posicoes
# Resultado: [1]  2  3  1 NA

# Explicação:
# - "a" está na posição 2 de table.
# - "b" está na posição 3 de table.
# - "c" está na posição 1 de table.
# - "d" não está em table, então retorna NA.


# Operador %in%
# -------------
# O operador %in% verifica se os elementos de um vetor (x) estão presentes em outro vetor (table).
# Retorna um vetor lógico (TRUE ou FALSE) indicando a presença ou ausência de cada elemento.

# Sintaxe:
# x %in% table

# Parâmetros:
# - x: O vetor de valores que você quer verificar.
# - table: O vetor onde os valores de x serão procurados.

# Exemplo:
x <- c("a", "b", "c", "d")
table <- c("c", "a", "b")
resultado <- x %in% table
resultado
# Resultado: [1]  TRUE  TRUE  TRUE FALSE

# Explicação:
# - "a", "b" e "c" estão em table, então retornam TRUE.
# - "d" não está em table, então retorna FALSE.


# Diferença entre match() e %in%
# ------------------------------
# 1. match():
#    - Retorna as posições dos elementos de x em table.
#    - Se um elemento não for encontrado, retorna NA.
#
# 2. %in%:
#    - Retorna um vetor lógico (TRUE/FALSE) indicando se os elementos de x estão em table.
#    - É mais simples e direto para verificações de pertinência.


# Quando usar cada uma?
# ---------------------
# - Use match() quando precisar das posições dos elementos.
# - Use %in% quando precisar apenas saber se os elementos estão presentes ou não.


# Exemplos práticos
# -----------------

# Usando match():
notas <- c(1, 2, 2, 3, 1)
info_notas <- c(3, 2, 1)
posicoes <- match(notas, info_notas)
posicoes
# Resultado: [1] 3 2 2 1 3

# Usando %in%:
pertence <- notas %in% info_notas
pertence
# Resultado: [1] TRUE TRUE TRUE TRUE TRUE


# Documentação oficial
# --------------------
# Para mais detalhes, consulte a documentação oficial no R:
# - match(): ?match
# - %in%: ?"%in%"


# Resumo
# ------
# - match(): Retorna as posições dos elementos de um vetor em outro.
# - %in%: Retorna um vetor lógico indicando a presença dos elementos.

