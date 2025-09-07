# ===============================================================================
# A PERSISTÊNCIA DA MEMÓRIA - SALVADOR DALÍ (1931)
# Reprodução Digital usando Algoritmos Surrealistas em R
# Autor: Diogo Rego - Estudante de Estatística UFPB
# Projeto: Pixel Poesia R - Arte com Linguagem de Programação
# GitHub: https://github.com/Diogorego20/pixel-poesia-r
# Data: Agosto 2025
# ===============================================================================

# Esta implementação reproduz a icônica obra surrealista de Salvador Dalí
# usando algoritmos que simulam distorções temporais, formas oníricas
# e a técnica de hiper-realismo característico do surrealismo

# ===============================================================================
# FUNÇÃO PRINCIPAL: CRIAR A PERSISTÊNCIA DA MEMÓRIA
# ===============================================================================

criar_persistencia_memoria <- function(largura = 800, 
                                      altura = 600,
                                      intensidade_distorcao = 0.8,
                                      num_relogios = 3,
                                      cor_ceu = "#87CEEB",
                                      cor_terra = "#D2B48C",
                                      mostrar_arvore = TRUE,
                                      mostrar_forma_organica = TRUE,
                                      estilo_surrealista = "classico",
                                      paleta_cores = "dali_original") {
  
  cat("=== A PERSISTÊNCIA DA MEMÓRIA ===\n")
  cat("Reproduzindo a obra de Salvador Dalí (1931)\n")
  cat("Dimensões:", largura, "x", altura, "\n")
  cat("Estilo:", estilo_surrealista, "\n")
  cat("Paleta:", paleta_cores, "\n")
  cat("Relógios:", num_relogios, "\n")
  cat("================================\n")
  
  # Configuração do dispositivo gráfico
  nome_arquivo <- paste0("persistencia_memoria_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".png")
  png(nome_arquivo, width = largura, height = altura, bg = "#f5f5dc", res = 150)
  
  # Configuração da plotagem
  par(mar = c(0, 0, 0, 0))
  plot(0, 0, type = "n", xlim = c(0, largura), ylim = c(0, altura), 
       axes = FALSE, xlab = "", ylab = "", asp = 1)
  
  # 1. CRIAR PAISAGEM DESÉRTICA DE FUNDO
  criar_paisagem_desertica(largura, altura, cor_ceu, cor_terra, paleta_cores)
  
  # 2. DESENHAR MONTANHAS DISTANTES (INSPIRADAS EM PORT LLIGAT)
  desenhar_montanhas_dali(largura, altura, paleta_cores)
  
  # 3. CRIAR PLATAFORMA/MESA SURREALISTA
  criar_plataforma_surrealista(largura, altura, estilo_surrealista)
  
  # 4. DESENHAR ÁRVORE SECA (SE HABILITADA)
  if (mostrar_arvore) {
    desenhar_arvore_seca_dali(largura, altura, intensidade_distorcao, estilo_surrealista)
  }
  
  # 5. ADICIONAR RELÓGIOS DERRETIDOS
  adicionar_relogios_derretidos(largura, altura, num_relogios, intensidade_distorcao, 
                               estilo_surrealista, paleta_cores)
  
  # 6. DESENHAR FORMA ORGÂNICA CENTRAL (SE HABILITADA)
  if (mostrar_forma_organica) {
    desenhar_forma_organica_dali(largura, altura, intensidade_distorcao, estilo_surrealista)
  }
  
  # 7. ADICIONAR ELEMENTOS SURREALISTAS ADICIONAIS
  adicionar_elementos_surrealistas(largura, altura, intensidade_distorcao, estilo_surrealista)
  
  # 8. APLICAR EFEITOS DE HIPER-REALISMO
  aplicar_hiper_realismo(largura, altura, estilo_surrealista)
  
  # Assinatura do artista
  text(largura * 0.02, altura * 0.02, 
       "A Persistência da Memória (1931) - Reprodução Digital", 
       col = "#8B4513", cex = 0.7, adj = 0, font = 2)
  
  text(largura * 0.02, altura * 0.06, 
       "Algoritmos Surrealistas por Diogo Rego - UFPB", 
       col = "#654321", cex = 0.6, adj = 0)
  
  dev.off()
  
  cat("Obra salva como:", nome_arquivo, "\n")
  return(nome_arquivo)
}

# ===============================================================================
# ALGORITMO 1: PAISAGEM DESÉRTICA SURREALISTA
# ===============================================================================

criar_paisagem_desertica <- function(largura, altura, cor_ceu, cor_terra, paleta) {
  
  # Linha do horizonte (mais baixa que no impressionismo)
  horizonte_y <- altura * 0.25
  
  # Definir paletas baseadas no estilo
  if (paleta == "dali_original") {
    cores_ceu <- c("#87CEEB", "#B0E0E6", "#F0F8FF", "#FFFACD")
    cores_terra <- c("#D2B48C", "#DEB887", "#F4A460", "#CD853F")
    cores_sombra <- c("#8B7355", "#A0522D", "#8B4513")
  } else if (paleta == "dourado_onirico") {
    cores_ceu <- c("#FFD700", "#FFA500", "#FF8C00", "#FFFF99")
    cores_terra <- c("#DAA520", "#B8860B", "#CD853F", "#D2691E")
    cores_sombra <- c("#8B4513", "#A0522D", "#654321")
  } else {
    cores_ceu <- c("#87CEEB", "#B0E0E6", "#F0F8FF", "#FFFACD")
    cores_terra <- c("#D2B48C", "#DEB887", "#F4A460", "#CD853F")
    cores_sombra <- c("#8B7355", "#A0522D", "#8B4513")
  }
  
  # Criar gradiente do céu
  for (y in horizonte_y:altura) {
    proporcao <- (y - horizonte_y) / (altura - horizonte_y)
    
    # Interpolar cores do céu
    if (proporcao < 0.3) {
      cor_base <- cores_ceu[1]
    } else if (proporcao < 0.6) {
      cor_base <- cores_ceu[2]
    } else if (proporcao < 0.8) {
      cor_base <- cores_ceu[3]
    } else {
      cor_base <- cores_ceu[4]
    }
    
    # Desenhar linha do céu
    rect(0, y, largura, y+1, col = cor_base, border = NA)
  }
  
  # Criar terreno desértico
  for (y in 0:horizonte_y) {
    proporcao_profundidade <- y / horizonte_y
    
    # Interpolar cores da terra
    indice_cor <- max(1, min(length(cores_terra), 
                            round(proporcao_profundidade * length(cores_terra))))
    cor_base <- cores_terra[indice_cor]
    
    # Adicionar variação de textura
    for (x in seq(0, largura, by = 5)) {
      largura_segmento <- sample(3:8, 1)
      x_fim <- min(x + largura_segmento, largura)
      
      # Variação cromática para textura
      if (runif(1) < 0.3) {
        cor_final <- sample(cores_sombra, 1)
      } else {
        cor_final <- cor_base
      }
      
      rect(x, y, x_fim, y+1, col = cor_final, border = NA)
    }
  }
}

# ===============================================================================
# ALGORITMO 2: MONTANHAS DISTANTES (INSPIRADAS EM PORT LLIGAT)
# ===============================================================================

desenhar_montanhas_dali <- function(largura, altura, paleta) {
  
  horizonte_y <- altura * 0.25
  
  # Cores das montanhas
  if (paleta == "dali_original") {
    cores_montanha <- c("#CD853F", "#D2B48C", "#DEB887")
  } else {
    cores_montanha <- c("#DAA520", "#B8860B", "#CD853F")
  }
  
  # Montanhas no fundo (estilo Dalí - formas suaves e arredondadas)
  montanhas <- list(
    list(x_inicio = largura * 0.6, x_fim = largura * 0.9, altura_max = altura * 0.15),
    list(x_inicio = largura * 0.7, x_fim = largura * 1.0, altura_max = altura * 0.12),
    list(x_inicio = largura * 0.8, x_fim = largura * 0.95, altura_max = altura * 0.08)
  )
  
  for (i in seq_along(montanhas)) {
    montanha <- montanhas[[i]]
    
    # Criar perfil suave da montanha
    x_pontos <- seq(montanha$x_inicio, montanha$x_fim, length.out = 50)
    y_pontos <- numeric(length(x_pontos))
    
    for (j in seq_along(x_pontos)) {
      # Função senoidal suavizada para perfil natural
      proporcao <- (j - 1) / (length(x_pontos) - 1)
      altura_local <- sin(proporcao * pi) * montanha$altura_max
      
      # Adicionar variação natural
      variacao <- rnorm(1, 0, montanha$altura_max * 0.05)
      y_pontos[j] <- horizonte_y + altura_local + variacao
    }
    
    # Desenhar montanha
    cor_montanha <- cores_montanha[min(i, length(cores_montanha))]
    
    for (j in 1:(length(x_pontos)-1)) {
      # Preencher área da montanha
      x_atual <- x_pontos[j]
      x_proximo <- x_pontos[j+1]
      y_atual <- y_pontos[j]
      y_proximo <- y_pontos[j+1]
      
      # Desenhar segmento vertical
      for (y in horizonte_y:max(y_atual, y_proximo)) {
        if (y <= y_atual || y <= y_proximo) {
          lines(c(x_atual, x_proximo), c(y, y), col = cor_montanha, lwd = 1)
        }
      }
    }
  }
}

# ===============================================================================
# ALGORITMO 3: PLATAFORMA/MESA SURREALISTA
# ===============================================================================

criar_plataforma_surrealista <- function(largura, altura, estilo) {
  
  # Plataforma principal (mesa/superfície onde ficam os relógios)
  plataforma_y <- altura * 0.15
  plataforma_x_inicio <- largura * 0.1
  plataforma_x_fim <- largura * 0.7
  plataforma_altura <- altura * 0.08
  
  # Cor da plataforma
  cor_plataforma <- "#DEB887"
  cor_sombra <- "#CD853F"
  
  if (estilo == "classico") {
    # Plataforma retangular com perspectiva
    # Topo da plataforma
    polygon(c(plataforma_x_inicio, plataforma_x_fim, plataforma_x_fim + 20, plataforma_x_inicio + 20),
            c(plataforma_y + plataforma_altura, plataforma_y + plataforma_altura, 
              plataforma_y + plataforma_altura + 10, plataforma_y + plataforma_altura + 10),
            col = cor_plataforma, border = "#8B7355")
    
    # Lateral da plataforma
    polygon(c(plataforma_x_fim, plataforma_x_fim + 20, plataforma_x_fim + 20, plataforma_x_fim),
            c(plataforma_y, plataforma_y + 10, plataforma_y + plataforma_altura + 10, plataforma_y + plataforma_altura),
            col = cor_sombra, border = "#8B7355")
    
    # Frente da plataforma
    rect(plataforma_x_inicio, plataforma_y, plataforma_x_fim, plataforma_y + plataforma_altura,
         col = cor_plataforma, border = "#8B7355")
    
  } else if (estilo == "onirico") {
    # Plataforma com bordas onduladas
    x_pontos <- seq(plataforma_x_inicio, plataforma_x_fim, length.out = 100)
    y_pontos_superior <- rep(plataforma_y + plataforma_altura, length(x_pontos))
    y_pontos_inferior <- rep(plataforma_y, length(x_pontos))
    
    # Adicionar ondulação sutil
    for (i in seq_along(x_pontos)) {
      ondulacao <- sin(i * 0.2) * 3
      y_pontos_superior[i] <- y_pontos_superior[i] + ondulacao
      y_pontos_inferior[i] <- y_pontos_inferior[i] + ondulacao * 0.5
    }
    
    # Desenhar plataforma ondulada
    polygon(c(x_pontos, rev(x_pontos)), c(y_pontos_superior, rev(y_pontos_inferior)),
            col = cor_plataforma, border = "#8B7355")
  }
}

# ===============================================================================
# ALGORITMO 4: ÁRVORE SECA SURREALISTA
# ===============================================================================

desenhar_arvore_seca_dali <- function(largura, altura, intensidade_distorcao, estilo) {
  
  # Posição da árvore (esquerda da composição)
  arvore_x <- largura * 0.15
  arvore_y_base <- altura * 0.15
  arvore_altura <- altura * 0.4
  
  # Cor da árvore
  cor_tronco <- "#8B4513"
  cor_galho <- "#A0522D"
  
  if (estilo == "classico") {
    # Tronco principal
    tronco_largura <- 8
    rect(arvore_x - tronco_largura/2, arvore_y_base, 
         arvore_x + tronco_largura/2, arvore_y_base + arvore_altura * 0.6,
         col = cor_tronco, border = "#654321")
    
    # Galhos principais
    galhos <- list(
      list(angulo = pi/6, comprimento = arvore_altura * 0.3, espessura = 4),
      list(angulo = -pi/8, comprimento = arvore_altura * 0.25, espessura = 3),
      list(angulo = pi/4, comprimento = arvore_altura * 0.2, espessura = 2)
    )
    
    y_inicio_galhos <- arvore_y_base + arvore_altura * 0.4
    
    for (galho in galhos) {
      # Calcular posição final do galho
      x_fim <- arvore_x + galho$comprimento * cos(galho$angulo)
      y_fim <- y_inicio_galhos + galho$comprimento * sin(galho$angulo)
      
      # Desenhar galho
      lines(c(arvore_x, x_fim), c(y_inicio_galhos, y_fim), 
            col = cor_galho, lwd = galho$espessura)
      
      # Galhos secundários
      num_sub_galhos <- sample(2:4, 1)
      for (i in 1:num_sub_galhos) {
        proporcao <- i / (num_sub_galhos + 1)
        x_sub_inicio <- arvore_x + proporcao * (x_fim - arvore_x)
        y_sub_inicio <- y_inicio_galhos + proporcao * (y_fim - y_inicio_galhos)
        
        angulo_sub <- galho$angulo + runif(1, -pi/4, pi/4)
        comprimento_sub <- galho$comprimento * runif(1, 0.3, 0.6)
        
        x_sub_fim <- x_sub_inicio + comprimento_sub * cos(angulo_sub)
        y_sub_fim <- y_sub_inicio + comprimento_sub * sin(angulo_sub)
        
        lines(c(x_sub_inicio, x_sub_fim), c(y_sub_inicio, y_sub_fim), 
              col = cor_galho, lwd = max(1, galho$espessura - 1))
      }
    }
    
  } else if (estilo == "onirico") {
    # Árvore com distorções oníricas
    # Tronco ondulado
    x_pontos <- seq(arvore_x - 4, arvore_x + 4, length.out = 20)
    y_pontos <- seq(arvore_y_base, arvore_y_base + arvore_altura * 0.6, length.out = 20)
    
    # Aplicar ondulação ao tronco
    for (i in seq_along(x_pontos)) {
      distorcao <- sin(i * 0.5) * intensidade_distorcao * 3
      x_pontos[i] <- x_pontos[i] + distorcao
    }
    
    # Desenhar tronco ondulado
    for (i in 1:(length(y_pontos)-1)) {
      rect(min(x_pontos[i], x_pontos[i+1]), y_pontos[i],
           max(x_pontos[i], x_pontos[i+1]), y_pontos[i+1],
           col = cor_tronco, border = NA)
    }
  }
}

# ===============================================================================
# ALGORITMO 5: RELÓGIOS DERRETIDOS (ELEMENTO CENTRAL)
# ===============================================================================

adicionar_relogios_derretidos <- function(largura, altura, num_relogios, intensidade_distorcao, 
                                         estilo, paleta) {
  
  # Cores dos relógios
  if (paleta == "dali_original") {
    cores_relogio <- c("#C0C0C0", "#FFD700", "#FFA500")
    cor_ponteiro <- "#000000"
  } else {
    cores_relogio <- c("#DAA520", "#B8860B", "#CD853F")
    cor_ponteiro <- "#8B4513"
  }
  
  # Posições pré-definidas dos relógios (baseadas na obra original)
  posicoes_relogios <- list(
    list(x = largura * 0.2, y = altura * 0.23, tipo = "arvore", tamanho = 0.8),
    list(x = largura * 0.4, y = altura * 0.18, tipo = "plataforma", tamanho = 1.0),
    list(x = largura * 0.6, y = altura * 0.16, tipo = "chao", tamanho = 0.9)
  )
  
  for (i in 1:min(num_relogios, length(posicoes_relogios))) {
    pos <- posicoes_relogios[[i]]
    cor_relogio <- cores_relogio[min(i, length(cores_relogio))]
    
    if (estilo == "classico") {
      desenhar_relogio_derretido_classico(pos$x, pos$y, pos$tamanho, pos$tipo, 
                                         intensidade_distorcao, cor_relogio, cor_ponteiro)
    } else if (estilo == "onirico") {
      desenhar_relogio_derretido_onirico(pos$x, pos$y, pos$tamanho, pos$tipo, 
                                        intensidade_distorcao, cor_relogio, cor_ponteiro)
    }
  }
}

# Função auxiliar para desenhar relógio derretido clássico
desenhar_relogio_derretido_classico <- function(x, y, tamanho, tipo, intensidade, cor_relogio, cor_ponteiro) {
  
  raio_base <- 30 * tamanho
  
  if (tipo == "arvore") {
    # Relógio pendurado na árvore
    # Criar forma derretida usando curvas
    angulos <- seq(0, 2*pi, length.out = 100)
    x_pontos <- numeric(length(angulos))
    y_pontos <- numeric(length(angulos))
    
    for (i in seq_along(angulos)) {
      angulo <- angulos[i]
      
      # Distorção baseada na posição angular
      if (angulo > pi/2 && angulo < 3*pi/2) {
        # Parte inferior - mais derretida
        raio_local <- raio_base * (1 + intensidade * sin(angulo * 2) * 0.5)
        y_offset <- -intensidade * 15 * sin(angulo - pi/2)
      } else {
        # Parte superior - menos derretida
        raio_local <- raio_base * (1 + intensidade * 0.1)
        y_offset <- 0
      }
      
      x_pontos[i] <- x + raio_local * cos(angulo)
      y_pontos[i] <- y + raio_local * sin(angulo) + y_offset
    }
    
    # Desenhar relógio derretido
    polygon(x_pontos, y_pontos, col = cor_relogio, border = "#888888")
    
  } else if (tipo == "plataforma") {
    # Relógio na plataforma - derretimento lateral
    # Criar elipse distorcida
    angulos <- seq(0, 2*pi, length.out = 100)
    x_pontos <- numeric(length(angulos))
    y_pontos <- numeric(length(angulos))
    
    for (i in seq_along(angulos)) {
      angulo <- angulos[i]
      
      # Distorção lateral
      if (angulo > 0 && angulo < pi) {
        # Parte direita - mais derretida
        raio_x <- raio_base * (1 + intensidade * 0.8)
        raio_y <- raio_base * (1 - intensidade * 0.3)
      } else {
        # Parte esquerda - normal
        raio_x <- raio_base
        raio_y <- raio_base
      }
      
      x_pontos[i] <- x + raio_x * cos(angulo)
      y_pontos[i] <- y + raio_y * sin(angulo)
    }
    
    # Desenhar relógio derretido
    polygon(x_pontos, y_pontos, col = cor_relogio, border = "#888888")
    
  } else {
    # Relógio no chão - derretimento para baixo
    # Forma de gota
    angulos <- seq(0, 2*pi, length.out = 100)
    x_pontos <- numeric(length(angulos))
    y_pontos <- numeric(length(angulos))
    
    for (i in seq_along(angulos)) {
      angulo <- angulos[i]
      
      if (angulo > pi) {
        # Parte inferior - muito derretida
        raio_local <- raio_base * (1 - intensidade * 0.6)
        y_offset <- -intensidade * 20
      } else {
        # Parte superior - pouco derretida
        raio_local <- raio_base
        y_offset <- 0
      }
      
      x_pontos[i] <- x + raio_local * cos(angulo)
      y_pontos[i] <- y + raio_local * sin(angulo) + y_offset
    }
    
    # Desenhar relógio derretido
    polygon(x_pontos, y_pontos, col = cor_relogio, border = "#888888")
  }
  
  # Adicionar ponteiros do relógio
  # Ponteiro das horas
  angulo_hora <- runif(1, 0, 2*pi)
  x_hora <- x + (raio_base * 0.5) * cos(angulo_hora)
  y_hora <- y + (raio_base * 0.5) * sin(angulo_hora)
  lines(c(x, x_hora), c(y, y_hora), col = cor_ponteiro, lwd = 3)
  
  # Ponteiro dos minutos
  angulo_minuto <- runif(1, 0, 2*pi)
  x_minuto <- x + (raio_base * 0.7) * cos(angulo_minuto)
  y_minuto <- y + (raio_base * 0.7) * sin(angulo_minuto)
  lines(c(x, x_minuto), c(y, y_minuto), col = cor_ponteiro, lwd = 2)
  
  # Centro do relógio
  points(x, y, pch = 19, cex = 1.5, col = cor_ponteiro)
}

# Função auxiliar para desenhar relógio derretido onírico
desenhar_relogio_derretido_onirico <- function(x, y, tamanho, tipo, intensidade, cor_relogio, cor_ponteiro) {
  
  raio_base <- 30 * tamanho
  
  # Versão mais abstrata e fluida
  angulos <- seq(0, 2*pi, length.out = 150)
  x_pontos <- numeric(length(angulos))
  y_pontos <- numeric(length(angulos))
  
  for (i in seq_along(angulos)) {
    angulo <- angulos[i]
    
    # Distorção complexa usando múltiplas funções
    distorcao_radial <- 1 + intensidade * sin(angulo * 3) * 0.3
    distorcao_temporal <- 1 + intensidade * cos(angulo * 5) * 0.2
    
    raio_local <- raio_base * distorcao_radial * distorcao_temporal
    
    # Offset baseado no tipo
    if (tipo == "arvore") {
      y_offset <- -intensidade * 10 * sin(angulo)
    } else if (tipo == "plataforma") {
      x_offset <- intensidade * 15 * cos(angulo)
      y_offset <- 0
    } else {
      y_offset <- -intensidade * 25 * abs(sin(angulo))
      x_offset <- 0
    }
    
    x_pontos[i] <- x + raio_local * cos(angulo) + ifelse(exists("x_offset"), x_offset, 0)
    y_pontos[i] <- y + raio_local * sin(angulo) + y_offset
  }
  
  # Desenhar relógio com gradiente
  polygon(x_pontos, y_pontos, col = cor_relogio, border = "#666666")
  
  # Ponteiros mais abstratos
  for (i in 1:3) {
    angulo_ponteiro <- runif(1, 0, 2*pi)
    comprimento <- raio_base * runif(1, 0.4, 0.8)
    x_ponteiro <- x + comprimento * cos(angulo_ponteiro)
    y_ponteiro <- y + comprimento * sin(angulo_ponteiro)
    
    lines(c(x, x_ponteiro), c(y, y_ponteiro), 
          col = cor_ponteiro, lwd = sample(1:3, 1))
  }
}

# ===============================================================================
# ALGORITMO 6: FORMA ORGÂNICA CENTRAL
# ===============================================================================

desenhar_forma_organica_dali <- function(largura, altura, intensidade_distorcao, estilo) {
  
  # Posição da forma orgânica (centro-direita)
  forma_x <- largura * 0.55
  forma_y <- altura * 0.12
  forma_largura <- largura * 0.15
  forma_altura <- altura * 0.08
  
  # Cor da forma (inspirada na obra original)
  cor_forma <- "#DEB887"
  cor_sombra <- "#CD853F"
  
  if (estilo == "classico") {
    # Forma orgânica fechada (como na obra original)
    angulos <- seq(0, 2*pi, length.out = 80)
    x_pontos <- numeric(length(angulos))
    y_pontos <- numeric(length(angulos))
    
    for (i in seq_along(angulos)) {
      angulo <- angulos[i]
      
      # Criar forma orgânica irregular
      raio_x <- forma_largura * (0.5 + 0.3 * sin(angulo * 2) + 0.2 * cos(angulo * 3))
      raio_y <- forma_altura * (0.5 + 0.4 * cos(angulo * 1.5) + 0.1 * sin(angulo * 4))
      
      # Aplicar distorção
      distorcao_x <- intensidade_distorcao * 5 * sin(angulo * 2)
      distorcao_y <- intensidade_distorcao * 3 * cos(angulo * 3)
      
      x_pontos[i] <- forma_x + raio_x * cos(angulo) + distorcao_x
      y_pontos[i] <- forma_y + raio_y * sin(angulo) + distorcao_y
    }
    
    # Desenhar forma orgânica
    polygon(x_pontos, y_pontos, col = cor_forma, border = cor_sombra)
    
    # Adicionar cílios/pelos (detalhe característico)
    num_cilios <- round(intensidade_distorcao * 10) + 5
    for (i in 1:num_cilios) {
      # Posição aleatória na borda superior da forma
      angulo_cilio <- runif(1, pi/4, 3*pi/4)
      x_base <- forma_x + (forma_largura * 0.3) * cos(angulo_cilio)
      y_base <- forma_y + (forma_altura * 0.4) * sin(angulo_cilio)
      
      # Comprimento e direção do cílio
      comprimento_cilio <- runif(1, 10, 25)
      angulo_crescimento <- angulo_cilio + runif(1, -pi/6, pi/6)
      
      x_fim <- x_base + comprimento_cilio * cos(angulo_crescimento)
      y_fim <- y_base + comprimento_cilio * sin(angulo_crescimento)
      
      lines(c(x_base, x_fim), c(y_base, y_fim), col = "#8B4513", lwd = 1)
    }
    
  } else if (estilo == "onirico") {
    # Forma mais fluida e abstrata
    # Usar curvas Bézier para suavidade
    pontos_controle <- list(
      c(forma_x - forma_largura/2, forma_y),
      c(forma_x - forma_largura/4, forma_y + forma_altura/2),
      c(forma_x + forma_largura/4, forma_y + forma_altura/2),
      c(forma_x + forma_largura/2, forma_y),
      c(forma_x + forma_largura/4, forma_y - forma_altura/2),
      c(forma_x - forma_largura/4, forma_y - forma_altura/2)
    )
    
    # Aplicar distorções aos pontos de controle
    for (i in seq_along(pontos_controle)) {
      distorcao_x <- intensidade_distorcao * runif(1, -10, 10)
      distorcao_y <- intensidade_distorcao * runif(1, -5, 5)
      
      pontos_controle[[i]][1] <- pontos_controle[[i]][1] + distorcao_x
      pontos_controle[[i]][2] <- pontos_controle[[i]][2] + distorcao_y
    }
    
    # Desenhar forma usando spline
    x_spline <- sapply(pontos_controle, function(p) p[1])
    y_spline <- sapply(pontos_controle, function(p) p[2])
    
    # Fechar a forma
    x_spline <- c(x_spline, x_spline[1])
    y_spline <- c(y_spline, y_spline[1])
    
    polygon(x_spline, y_spline, col = cor_forma, border = cor_sombra)
  }
}

# ===============================================================================
# ALGORITMO 7: ELEMENTOS SURREALISTAS ADICIONAIS
# ===============================================================================

adicionar_elementos_surrealistas <- function(largura, altura, intensidade_distorcao, estilo) {
  
  # 1. Mosca sobre um dos relógios (detalhe da obra original)
  mosca_x <- largura * 0.4 + runif(1, -10, 10)
  mosca_y <- altura * 0.18 + runif(1, -5, 5)
  
  # Corpo da mosca
  points(mosca_x, mosca_y, pch = 19, cex = 0.8, col = "#000000")
  
  # Asas da mosca
  lines(c(mosca_x - 2, mosca_x + 2), c(mosca_y + 1, mosca_y + 1), col = "#666666", lwd = 1)
  lines(c(mosca_x - 2, mosca_x + 2), c(mosca_y - 1, mosca_y - 1), col = "#666666", lwd = 1)
  
  # 2. Sombras surrealistas
  if (estilo == "classico") {
    # Sombra da árvore (desproporcional)
    sombra_arvore_x <- largura * 0.25
    sombra_arvore_y <- altura * 0.05
    sombra_comprimento <- largura * 0.3
    sombra_largura <- 8
    
    # Sombra alongada e distorcida
    for (i in 1:round(sombra_comprimento/2)) {
      x_sombra <- sombra_arvore_x + i * 2
      y_sombra <- sombra_arvore_y
      largura_local <- sombra_largura * (1 - i / (sombra_comprimento/2)) * 
                      (1 + intensidade_distorcao * sin(i * 0.1) * 0.3)
      
      rect(x_sombra, y_sombra - largura_local/2, 
           x_sombra + 2, y_sombra + largura_local/2, 
           col = "#8B7355", border = NA)
    }
  }
  
  # 3. Objetos impossíveis pequenos
  if (runif(1) < intensidade_distorcao) {
    # Cubo impossível pequeno
    cubo_x <- largura * runif(1, 0.7, 0.9)
    cubo_y <- altura * runif(1, 0.05, 0.15)
    cubo_tamanho <- 8
    
    # Desenhar cubo com perspectiva impossível
    # Face frontal
    rect(cubo_x, cubo_y, cubo_x + cubo_tamanho, cubo_y + cubo_tamanho, 
         col = "#DEB887", border = "#8B7355")
    
    # Face lateral (perspectiva impossível)
    polygon(c(cubo_x + cubo_tamanho, cubo_x + cubo_tamanho + 4, 
              cubo_x + cubo_tamanho + 4, cubo_x + cubo_tamanho),
            c(cubo_y, cubo_y + 4, cubo_y + cubo_tamanho + 4, cubo_y + cubo_tamanho),
            col = "#CD853F", border = "#8B7355")
    
    # Face superior
    polygon(c(cubo_x, cubo_x + 4, cubo_x + cubo_tamanho + 4, cubo_x + cubo_tamanho),
            c(cubo_y + cubo_tamanho, cubo_y + cubo_tamanho + 4, 
              cubo_y + cubo_tamanho + 4, cubo_y + cubo_tamanho),
            col = "#F4A460", border = "#8B7355")
  }
}

# ===============================================================================
# ALGORITMO 8: EFEITOS DE HIPER-REALISMO
# ===============================================================================

aplicar_hiper_realismo <- function(largura, altura, estilo) {
  
  if (estilo == "classico") {
    # Adicionar detalhes de textura sutil
    # Textura do solo
    for (i in 1:50) {
      x_textura <- runif(1, 0, largura)
      y_textura <- runif(1, 0, altura * 0.2)
      tamanho_textura <- runif(1, 1, 3)
      
      points(x_textura, y_textura, pch = ".", cex = tamanho_textura, col = "#CD853F")
    }
    
    # Gradientes sutis nas montanhas
    # (Já implementado na função de montanhas)
    
  } else if (estilo == "onirico") {
    # Efeitos mais abstratos
    # Partículas flutuantes
    for (i in 1:30) {
      x_particula <- runif(1, 0, largura)
      y_particula <- runif(1, altura * 0.3, altura)
      tamanho_particula <- runif(1, 0.5, 2)
      transparencia <- runif(1, 0.3, 0.7)
      
      cor_particula <- paste0("#FFD700", sprintf("%02x", as.integer(transparencia * 255)))
      points(x_particula, y_particula, pch = 19, cex = tamanho_particula, col = cor_particula)
    }
  }
}

# ===============================================================================
# FUNÇÃO DE DEMONSTRAÇÃO COM MÚLTIPLOS ESTILOS
# ===============================================================================

demonstrar_persistencia_memoria <- function() {
  cat("\n=== DEMONSTRAÇÃO: A PERSISTÊNCIA DA MEMÓRIA ===\n")
  cat("Reproduzindo a obra de Salvador Dalí em diferentes estilos...\n\n")
  
  # 1. Estilo Surrealista Clássico (fiel a Dalí)
  cat("1. Gerando versão Surrealista Clássica...\n")
  criar_persistencia_memoria(
    largura = 600, 
    altura = 450,
    intensidade_distorcao = 0.8,
    num_relogios = 3,
    cor_ceu = "#87CEEB",
    cor_terra = "#D2B48C",
    mostrar_arvore = TRUE,
    mostrar_forma_organica = TRUE,
    estilo_surrealista = "classico",
    paleta_cores = "dali_original"
  )
  
  # 2. Versão Onírica Dourada
  cat("\n2. Gerando versão Onírica Dourada...\n")
  criar_persistencia_memoria(
    largura = 600, 
    altura = 450,
    intensidade_distorcao = 1.0,
    num_relogios = 3,
    cor_ceu = "#FFD700",
    cor_terra = "#DAA520",
    mostrar_arvore = TRUE,
    mostrar_forma_organica = TRUE,
    estilo_surrealista = "onirico",
    paleta_cores = "dourado_onirico"
  )
  
  # 3. Versão Minimalista Contemporânea
  cat("\n3. Gerando versão Minimalista Contemporânea...\n")
  criar_persistencia_memoria(
    largura = 600, 
    altura = 450,
    intensidade_distorcao = 0.5,
    num_relogios = 2,
    cor_ceu = "#E6E6FA",
    cor_terra = "#F5DEB3",
    mostrar_arvore = FALSE,
    mostrar_forma_organica = FALSE,
    estilo_surrealista = "classico",
    paleta_cores = "dali_original"
  )
  
  cat("\n=== DEMONSTRAÇÃO CONCLUÍDA ===\n")
  cat("Todas as versões de 'A Persistência da Memória' foram geradas!\n")
  cat("Autor: Diogo Rego - Estudante de Estatística UFPB\n")
  cat("Projeto: Pixel Poesia R - Surrealismo Digital\n")
  cat("===============================================\n")
}

# ===============================================================================
# EXECUÇÃO DA DEMONSTRAÇÃO
# ===============================================================================

# Executar demonstração
demonstrar_persistencia_memoria()

