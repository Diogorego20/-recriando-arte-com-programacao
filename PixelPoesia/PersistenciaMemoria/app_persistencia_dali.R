# ===============================================================================
# APLICAÇÃO SHINY: A PERSISTÊNCIA DA MEMÓRIA INTERATIVA
# Reprodução Digital da Obra de Salvador Dalí (1931)
# Autor: Diogo Rego - Estudante de Estatística UFPB
# Projeto: Pixel Poesia R - Arte com Linguagem de Programação
# GitHub: https://github.com/Diogorego20/pixel-poesia-r
# Data: Agosto 2025
# ===============================================================================

# Carregamento de bibliotecas
library(shiny)
library(colourpicker)

# ===============================================================================
# INTERFACE DO USUÁRIO (UI)
# ===============================================================================

ui <- fluidPage(
  
  # Configuração do tema surrealista
  tags$head(
    tags$style(HTML("
      body {
        background: linear-gradient(135deg, #2c2c54 0%, #40407a 50%, #706fd3 100%);
        color: #ffffff;
        font-family: 'Times New Roman', serif;
      }
      
      .main-header {
        background: rgba(44, 44, 84, 0.95);
        padding: 35px;
        border-radius: 25px;
        margin-bottom: 35px;
        text-align: center;
        border: 5px solid #ffa726;
        box-shadow: 0 0 30px rgba(255, 167, 38, 0.5);
      }
      
      .control-panel {
        background: rgba(64, 64, 122, 0.8);
        padding: 25px;
        border-radius: 15px;
        margin-bottom: 25px;
        border: 3px solid #ab47bc;
        box-shadow: 0 0 20px rgba(171, 71, 188, 0.3);
      }
      
      .art-display {
        background: rgba(44, 44, 84, 0.95);
        padding: 35px;
        border-radius: 25px;
        text-align: center;
        border: 5px solid #ffa726;
        box-shadow: 0 0 30px rgba(255, 167, 38, 0.5);
      }
      
      .btn-primary {
        background: linear-gradient(45deg, #ffa726, #ff9800);
        border: 3px solid #ffa726;
        font-weight: bold;
        color: #000000;
        text-shadow: none;
        font-family: 'Times New Roman', serif;
      }
      
      .btn-primary:hover {
        background: linear-gradient(45deg, #ff9800, #f57c00);
        border: 3px solid #ff9800;
        transform: translateY(-3px);
        box-shadow: 0 6px 25px rgba(255, 167, 38, 0.6);
      }
      
      .btn-secondary {
        background: linear-gradient(45deg, #ab47bc, #9c27b0);
        border: 3px solid #ab47bc;
        font-weight: bold;
        color: #ffffff;
        font-family: 'Times New Roman', serif;
      }
      
      .btn-secondary:hover {
        background: linear-gradient(45deg, #9c27b0, #8e24aa);
        border: 3px solid #9c27b0;
        transform: translateY(-3px);
        box-shadow: 0 6px 25px rgba(171, 71, 188, 0.6);
      }
      
      h1, h2, h3 {
        color: #ffa726;
        text-shadow: 0 0 20px rgba(255, 167, 38, 0.7);
        font-family: 'Times New Roman', serif;
        font-weight: bold;
      }
      
      .surreal-info {
        background: rgba(255, 167, 38, 0.15);
        padding: 20px;
        border-radius: 12px;
        border-left: 6px solid #ffa726;
        font-family: 'Times New Roman', serif;
        margin: 18px 0;
      }
      
      .time-info {
        background: rgba(171, 71, 188, 0.15);
        padding: 18px;
        border-radius: 12px;
        border: 2px solid #ab47bc;
        margin: 18px 0;
      }
    "))
  ),
  
  # Cabeçalho principal
  div(class = "main-header",
    h1("🕰️ A PERSISTÊNCIA DA MEMÓRIA", 
       style = "margin: 0; font-size: 3.5em; font-weight: bold;"),
    h2("Reprodução Digital Interativa da Obra de Salvador Dalí (1931)", 
       style = "margin: 25px 0; font-style: italic; color: #ffcc02;"),
    p("Criado por: ", strong("Diogo Rego"), " - Estudante de Estatística UFPB", 
      style = "margin: 15px 0; font-size: 1.4em; color: #ecf0f1;"),
    p("Projeto: ", strong("Pixel Poesia R"), " - Algoritmos Surrealistas", 
      style = "margin: 15px 0; color: #bdc3c7; font-size: 1.2em;"),
    a("🔗 GitHub: pixel-poesia-r", 
      href = "https://github.com/Diogorego20/pixel-poesia-r", 
      target = "_blank", 
      style = "color: #ffa726; text-decoration: none; font-weight: bold; font-size: 1.3em;")
  ),
  
  # Layout principal
  fluidRow(
    
    # Painel de controles
    column(4,
      
      # Configurações dos Relógios
      div(class = "control-panel",
        h3("🕰️ Configurações dos Relógios"),
        
        sliderInput("num_relogios", 
                   "Número de Relógios:",
                   min = 1, max = 5, value = 3, step = 1),
        
        sliderInput("intensidade_distorcao", 
                   "Intensidade do Derretimento:",
                   min = 0.1, max = 2.0, value = 0.8, step = 0.1),
        
        colourInput("cor_relogio_1", 
                   "Cor do Primeiro Relógio:", 
                   value = "#C0C0C0"),
        
        colourInput("cor_relogio_2", 
                   "Cor do Segundo Relógio:", 
                   value = "#FFD700"),
        
        colourInput("cor_relogio_3", 
                   "Cor do Terceiro Relógio:", 
                   value = "#FFA500")
      ),
      
      # Configurações da Paisagem
      div(class = "control-panel",
        h3("🏜️ Configurações da Paisagem"),
        
        colourInput("cor_ceu", 
                   "Cor do Céu:", 
                   value = "#87CEEB"),
        
        colourInput("cor_terra", 
                   "Cor da Terra:", 
                   value = "#D2B48C"),
        
        colourInput("cor_montanha", 
                   "Cor das Montanhas:", 
                   value = "#CD853F"),
        
        selectInput("paleta_cores", 
                   "Paleta de Cores:",
                   choices = list(
                     "🎨 Dalí Original" = "dali_original",
                     "🌅 Dourado Onírico" = "dourado_onirico",
                     "🌙 Noturno Místico" = "noturno_mistico",
                     "🌈 Psicodélico" = "psicodelico"
                   ),
                   selected = "dali_original")
      ),
      
      # Configurações dos Elementos
      div(class = "control-panel",
        h3("🌳 Elementos Surrealistas"),
        
        checkboxInput("mostrar_arvore", 
                     "Mostrar Árvore Seca", 
                     value = TRUE),
        
        checkboxInput("mostrar_forma_organica", 
                     "Mostrar Forma Orgânica", 
                     value = TRUE),
        
        checkboxInput("mostrar_mosca", 
                     "Mostrar Mosca", 
                     value = TRUE),
        
        checkboxInput("mostrar_sombras", 
                     "Mostrar Sombras Impossíveis", 
                     value = TRUE),
        
        selectInput("estilo_surrealista", 
                   "Estilo Surrealista:",
                   choices = list(
                     "🎭 Clássico (Dalí)" = "classico",
                     "🌀 Onírico Fluido" = "onirico",
                     "🔮 Hiper-Realista" = "hiper_realista",
                     "🎪 Abstrato Surreal" = "abstrato"
                   ),
                   selected = "classico")
      ),
      
      # Presets Surrealistas
      div(class = "control-panel",
        h3("🎭 Presets Surrealistas"),
        
        actionButton("preset_dali_original", 
                    "🕰️ Dalí Original", 
                    class = "btn btn-primary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_sonho_dourado", 
                    "🌅 Sonho Dourado", 
                    class = "btn btn-primary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_pesadelo_noturno", 
                    "🌙 Pesadelo Noturno", 
                    class = "btn btn-primary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_tempo_fragmentado", 
                    "⏰ Tempo Fragmentado", 
                    class = "btn btn-secondary btn-block",
                    style = "margin-bottom: 12px;"),
        
        actionButton("preset_aleatorio", 
                    "🎲 Realidade Aleatória", 
                    class = "btn btn-secondary btn-block")
      ),
      
      # Botão de geração
      div(class = "control-panel", style = "text-align: center;",
        actionButton("gerar_persistencia", 
                    "🎨 GERAR PERSISTÊNCIA", 
                    class = "btn btn-primary btn-lg",
                    style = "font-size: 1.6em; padding: 22px 45px; font-weight: bold; margin: 18px;")
      )
    ),
    
    # Área de exibição da arte
    column(8,
      div(class = "art-display",
        h3("🖼️ Sua Realidade Surrealista"),
        
        # Área inicial
        conditionalPanel(
          condition = "input.gerar_persistencia == 0",
          div(style = "padding: 90px; text-align: center;",
            h4("👆 Configure os parâmetros e clique em 'GERAR PERSISTÊNCIA'", 
               style = "color: #ecf0f1; font-style: italic; margin-bottom: 30px;"),
            p("Explore as dimensões impossíveis do Surrealismo", 
              style = "color: #bdc3c7; margin-bottom: 20px; font-size: 1.2em;"),
            p("e crie sua própria interpretação desta obra atemporal!", 
              style = "color: #bdc3c7; margin-bottom: 35px; font-size: 1.2em;"),
            
            div(class = "surreal-info",
              h5("🎭 Sobre o Surrealismo:", style = "color: #ffa726; margin-bottom: 20px;"),
              p("O Surrealismo explorou o inconsciente e os sonhos,", 
                style = "text-align: justify; margin-bottom: 15px;"),
              p("criando imagens impossíveis que desafiam a lógica", 
                style = "text-align: justify; margin-bottom: 15px;"),
              p("e revelam verdades ocultas da mente humana.", 
                style = "text-align: justify; font-style: italic;")
            ),
            
            div(class = "time-info",
              h5("🕰️ 'A Persistência da Memória' (1931):", style = "color: #ab47bc; margin-bottom: 20px;"),
              p("Os relógios derretidos simbolizam a relatividade do tempo", 
                style = "text-align: justify; margin-bottom: 15px;"),
              p("e a natureza fluida da memória e dos sonhos,", 
                style = "text-align: justify; margin-bottom: 15px;"),
              p("questionando nossa percepção da realidade.", 
                style = "text-align: justify; font-style: italic;")
            )
          )
        ),
        
        # Área da arte gerada
        conditionalPanel(
          condition = "input.gerar_persistencia > 0",
          div(
            plotOutput("persistencia_plot", 
                      width = "100%", 
                      height = "450px"),
            
            br(),
            
            # Informações técnicas
            div(style = "background: rgba(44,44,84,0.7); padding: 22px; border-radius: 15px; margin-top: 30px; border: 3px solid #ab47bc;",
              h5("📊 Análise Surrealista da Obra:", style = "color: #ffa726; margin-bottom: 20px;"),
              verbatimTextOutput("info_tecnica_persistencia"),
              br(),
              div(style = "text-align: center;",
                downloadButton("download_persistencia", 
                             "💾 Download da Obra", 
                             class = "btn btn-success",
                             style = "font-weight: bold; margin-right: 25px; font-size: 1.2em;"),
                
                actionButton("nova_distorcao", 
                           "🌀 Nova Distorção", 
                           class = "btn btn-info",
                           style = "font-weight: bold; font-size: 1.2em;")
              )
            )
          )
        )
      ),
      
      # Seção educativa sobre surrealismo
      div(class = "control-panel", style = "margin-top: 35px;",
        h3("📚 Técnicas Surrealistas Implementadas"),
        
        fluidRow(
          column(6,
            h5("🕰️ Distorção Temporal:", style = "color: #ffa726;"),
            p("• Relógios derretidos algorítmicos"),
            p("• Deformação baseada em funções"),
            p("• Variação estocástica controlada"),
            
            h5("🎨 Método Paranoico-Crítico:", style = "color: #ffa726;"),
            p("• Imagens duplas e múltiplas"),
            p("• Associações livres visuais"),
            p("• Lógica onírica implementada")
          ),
          column(6,
            h5("🌀 Automatismo Surrealista:", style = "color: #ab47bc;"),
            p("• Geração procedural de formas"),
            p("• Elementos aleatórios controlados"),
            p("• Composição inconsciente simulada"),
            
            h5("🔮 Hiper-Realismo:", style = "color: #ab47bc;"),
            p("• Detalhamento fotográfico"),
            p("• Precisão técnica impossível"),
            p("• Realidade aumentada digital")
          )
        )
      )
    )
  ),
  
  # Rodapé
  hr(style = "border-color: #ab47bc; margin-top: 70px;"),
  
  div(style = "text-align: center; padding: 35px; color: #95a5a6;",
    p("Desenvolvido com 🧠 em R por Diogo Rego - UFPB", 
      style = "margin: 12px 0; font-size: 1.3em; font-family: 'Times New Roman', serif;"),
    p("Projeto Pixel Poesia R - Onde Surrealismo encontra Algoritmos", 
      style = "margin: 12px 0; font-style: italic; font-size: 1.2em;"),
    p("© 2025 - Explorando as dimensões impossíveis da mente através da programação", 
      style = "margin: 12px 0; font-size: 1.1em;")
  )
)

# ===============================================================================
# LÓGICA DO SERVIDOR (SERVER)
# ===============================================================================

server <- function(input, output, session) {
  
  # Variáveis reativas
  obra_atual <- reactiveVal(NULL)
  
  # Função principal simplificada para Shiny
  criar_persistencia_shiny <- function(largura, altura, intensidade_distorcao, num_relogios,
                                      cor_ceu, cor_terra, mostrar_arvore, mostrar_forma_organica,
                                      estilo_surrealista, paleta_cores, cores_relogios) {
    
    # Configuração da plotagem
    par(mar = c(0, 0, 0, 0), bg = "#f5f5dc")
    plot(0, 0, type = "n", xlim = c(0, largura), ylim = c(0, altura), 
         axes = FALSE, xlab = "", ylab = "", asp = 1)
    
    # Linha do horizonte
    horizonte_y <- altura * 0.25
    
    # 1. CRIAR PAISAGEM
    # Céu
    for (y in horizonte_y:altura) {
      proporcao <- (y - horizonte_y) / (altura - horizonte_y)
      cor_atual <- if (proporcao < 0.5) cor_ceu else "#F0F8FF"
      rect(0, y, largura, y+1, col = cor_atual, border = NA)
    }
    
    # Terra
    for (y in 0:horizonte_y) {
      rect(0, y, largura, y+1, col = cor_terra, border = NA)
    }
    
    # 2. MONTANHAS SIMPLES
    montanha_x <- seq(largura * 0.6, largura, length.out = 50)
    montanha_y <- horizonte_y + sin(seq(0, pi, length.out = 50)) * altura * 0.1
    polygon(c(montanha_x, largura, largura * 0.6), 
            c(montanha_y, horizonte_y, horizonte_y), 
            col = "#CD853F", border = "#8B7355")
    
    # 3. PLATAFORMA
    plataforma_y <- altura * 0.15
    rect(largura * 0.1, plataforma_y, largura * 0.7, plataforma_y + altura * 0.08,
         col = "#DEB887", border = "#8B7355")
    
    # 4. ÁRVORE (SE HABILITADA)
    if (mostrar_arvore) {
      arvore_x <- largura * 0.15
      arvore_y <- altura * 0.15
      
      # Tronco
      rect(arvore_x - 4, arvore_y, arvore_x + 4, arvore_y + altura * 0.25,
           col = "#8B4513", border = "#654321")
      
      # Galhos
      galhos_y <- arvore_y + altura * 0.2
      lines(c(arvore_x, arvore_x + 30), c(galhos_y, galhos_y + 20), col = "#A0522D", lwd = 3)
      lines(c(arvore_x, arvore_x - 25), c(galhos_y, galhos_y + 15), col = "#A0522D", lwd = 2)
    }
    
    # 5. RELÓGIOS DERRETIDOS
    posicoes_relogios <- list(
      list(x = largura * 0.2, y = altura * 0.23),
      list(x = largura * 0.4, y = altura * 0.18),
      list(x = largura * 0.6, y = altura * 0.16),
      list(x = largura * 0.75, y = altura * 0.14),
      list(x = largura * 0.85, y = altura * 0.12)
    )
    
    for (i in 1:min(num_relogios, length(posicoes_relogios))) {
      pos <- posicoes_relogios[[i]]
      cor_relogio <- cores_relogios[min(i, length(cores_relogios))]
      
      # Relógio derretido simplificado
      raio <- 25
      
      # Forma derretida
      angulos <- seq(0, 2*pi, length.out = 50)
      x_pontos <- numeric(length(angulos))
      y_pontos <- numeric(length(angulos))
      
      for (j in seq_along(angulos)) {
        angulo <- angulos[j]
        
        # Distorção baseada na posição
        if (angulo > pi/2 && angulo < 3*pi/2) {
          raio_local <- raio * (1 + intensidade_distorcao * 0.5)
          y_offset <- -intensidade_distorcao * 10
        } else {
          raio_local <- raio
          y_offset <- 0
        }
        
        x_pontos[j] <- pos$x + raio_local * cos(angulo)
        y_pontos[j] <- pos$y + raio_local * sin(angulo) + y_offset
      }
      
      # Desenhar relógio
      polygon(x_pontos, y_pontos, col = cor_relogio, border = "#888888")
      
      # Ponteiros
      lines(c(pos$x, pos$x + 15), c(pos$y, pos$y + 10), col = "#000000", lwd = 2)
      lines(c(pos$x, pos$x - 10), c(pos$y, pos$y + 18), col = "#000000", lwd = 1)
      points(pos$x, pos$y, pch = 19, cex = 1, col = "#000000")
    }
    
    # 6. FORMA ORGÂNICA (SE HABILITADA)
    if (mostrar_forma_organica) {
      forma_x <- largura * 0.55
      forma_y <- altura * 0.12
      
      # Forma orgânica simplificada
      angulos <- seq(0, 2*pi, length.out = 30)
      x_forma <- forma_x + 40 * cos(angulos) + 10 * sin(angulos * 2)
      y_forma <- forma_y + 20 * sin(angulos) + 5 * cos(angulos * 3)
      
      polygon(x_forma, y_forma, col = "#DEB887", border = "#CD853F")
      
      # Cílios
      for (k in 1:8) {
        angulo_cilio <- runif(1, pi/4, 3*pi/4)
        x_base <- forma_x + 20 * cos(angulo_cilio)
        y_base <- forma_y + 10 * sin(angulo_cilio)
        x_fim <- x_base + 15 * cos(angulo_cilio + 0.2)
        y_fim <- y_base + 15 * sin(angulo_cilio + 0.2)
        
        lines(c(x_base, x_fim), c(y_base, y_fim), col = "#8B4513", lwd = 1)
      }
    }
    
    # Assinatura
    text(largura * 0.02, altura * 0.02, 
         "A Persistência da Memória - Algoritmos Surrealistas", 
         col = "#8B4513", cex = 0.8, adj = 0, font = 2)
    
    text(largura * 0.02, altura * 0.06, 
         "Diogo Rego - UFPB | Pixel Poesia R", 
         col = "#654321", cex = 0.7, adj = 0)
  }
  
  # Output principal
  output$persistencia_plot <- renderPlot({
    
    if (input$gerar_persistencia == 0) return()
    
    isolate({
      
      # Obter cores dos relógios
      cores_relogios <- c(input$cor_relogio_1, input$cor_relogio_2, input$cor_relogio_3)
      
      criar_persistencia_shiny(
        largura = 600,
        altura = 450,
        intensidade_distorcao = input$intensidade_distorcao,
        num_relogios = input$num_relogios,
        cor_ceu = input$cor_ceu,
        cor_terra = input$cor_terra,
        mostrar_arvore = input$mostrar_arvore,
        mostrar_forma_organica = input$mostrar_forma_organica,
        estilo_surrealista = input$estilo_surrealista,
        paleta_cores = input$paleta_cores,
        cores_relogios = cores_relogios
      )
      
      obra_atual(list(
        intensidade_distorcao = input$intensidade_distorcao,
        num_relogios = input$num_relogios,
        estilo_surrealista = input$estilo_surrealista,
        paleta_cores = input$paleta_cores,
        timestamp = Sys.time()
      ))
    })
  })
  
  # Informações técnicas
  output$info_tecnica_persistencia <- renderText({
    req(obra_atual())
    
    obra <- obra_atual()
    paste(
      "Obra: A Persistência da Memória (1931) - Salvador Dalí",
      "\nEstilo Surrealista:", switch(obra$estilo_surrealista,
        "classico" = "Clássico (Dalí)",
        "onirico" = "Onírico Fluido", 
        "hiper_realista" = "Hiper-Realista",
        "abstrato" = "Abstrato Surreal",
        obra$estilo_surrealista
      ),
      "\nIntensidade de Distorção:", round(obra$intensidade_distorcao, 2),
      "\nNúmero de Relógios:", obra$num_relogios,
      "\nPaleta de Cores:", obra$paleta_cores,
      "\nGerado em:", format(obra$timestamp, "%d/%m/%Y %H:%M:%S"),
      "\nAutor da Reprodução: Diogo Rego - UFPB"
    )
  })
  
  # Presets
  observeEvent(input$preset_dali_original, {
    updateSliderInput(session, "intensidade_distorcao", value = 0.8)
    updateSliderInput(session, "num_relogios", value = 3)
    updateColourInput(session, "cor_ceu", value = "#87CEEB")
    updateColourInput(session, "cor_terra", value = "#D2B48C")
    updateSelectInput(session, "estilo_surrealista", selected = "classico")
    updateSelectInput(session, "paleta_cores", selected = "dali_original")
    updateCheckboxInput(session, "mostrar_arvore", value = TRUE)
    updateCheckboxInput(session, "mostrar_forma_organica", value = TRUE)
    
    showNotification("🕰️ Preset Dalí Original aplicado!", type = "success", duration = 3)
  })
  
  observeEvent(input$preset_sonho_dourado, {
    updateSliderInput(session, "intensidade_distorcao", value = 1.2)
    updateColourInput(session, "cor_ceu", value = "#FFD700")
    updateColourInput(session, "cor_terra", value = "#DAA520")
    updateSelectInput(session, "paleta_cores", selected = "dourado_onirico")
    updateSelectInput(session, "estilo_surrealista", selected = "onirico")
    
    showNotification("🌅 Preset Sonho Dourado aplicado!", type = "success", duration = 3)
  })
  
  observeEvent(input$preset_aleatorio, {
    updateSliderInput(session, "intensidade_distorcao", value = runif(1, 0.3, 1.8))
    updateSliderInput(session, "num_relogios", value = sample(1:5, 1))
    
    cores_aleatorias <- c("#FF6B6B", "#4ECDC4", "#45B7D1", "#96CEB4", "#FFEAA7", "#DDA0DD")
    updateColourInput(session, "cor_ceu", value = sample(cores_aleatorias, 1))
    updateColourInput(session, "cor_terra", value = sample(cores_aleatorias, 1))
    
    showNotification("🎲 Realidade Aleatória aplicada!", type = "info", duration = 3)
  })
  
  observeEvent(input$gerar_persistencia, {
    showNotification("🎨 Criando sua Persistência da Memória...", type = "message", duration = 3)
  })
  
  # Download
  output$download_persistencia <- downloadHandler(
    filename = function() {
      req(obra_atual())
      timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
      paste0("persistencia_memoria_", timestamp, ".png")
    },
    content = function(file) {
      req(obra_atual())
      
      png(file, width = 1200, height = 900, res = 300, bg = "#f5f5dc")
      
      cores_relogios <- c(input$cor_relogio_1, input$cor_relogio_2, input$cor_relogio_3)
      
      criar_persistencia_shiny(
        largura = 1200,
        altura = 900,
        intensidade_distorcao = input$intensidade_distorcao,
        num_relogios = input$num_relogios,
        cor_ceu = input$cor_ceu,
        cor_terra = input$cor_terra,
        mostrar_arvore = input$mostrar_arvore,
        mostrar_forma_organica = input$mostrar_forma_organica,
        estilo_surrealista = input$estilo_surrealista,
        paleta_cores = input$paleta_cores,
        cores_relogios = cores_relogios
      )
      
      dev.off()
    }
  )
}

# ===============================================================================
# EXECUÇÃO DA APLICAÇÃO
# ===============================================================================

# Executar aplicação Shiny
shinyApp(ui = ui, server = server)

