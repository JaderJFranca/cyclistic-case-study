# ============================================================
# PROJETO: Cyclistic - Preparação e Limpeza dos Dados
# OBJETIVO: Consolidar, limpar e estruturar os dados de viagens
# FERRAMENTA: RStudio
# SAÍDA: Arquivo CSV final para análise no Tableau
# ============================================================


# ============================================================
# 1. CARREGAMENTO DE PACOTES
# ============================================================

# tidyverse: conjunto de pacotes para manipulação, leitura e
# transformação de dados (dplyr, readr, purrr, etc.)
library(tidyverse)

# lubridate: facilita o trabalho com datas e horas
library(lubridate)


# ============================================================
# 2. DEFINIÇÃO DO CAMINHO DOS ARQUIVOS
# ============================================================

# Define o caminho da pasta onde estão armazenados
# todos os arquivos CSV mensais do projeto Cyclistic
# Utilize o caminho do seu diretório aqui
pasta_csv <- "C:/Users/TI02/Downloads/Cyclistic/all_data_cyclistic"


# ============================================================
# 3. LISTAGEM DOS ARQUIVOS CSV
# ============================================================

# Lista automaticamente todos os arquivos com extensão .csv
# dentro da pasta definida acima
# full.names = TRUE retorna o caminho completo do arquivo,
# necessário para que o R consiga localizar corretamente os dados
arquivos_csv <- list.files(
  path = pasta_csv,
  pattern = "\\.csv$",
  full.names = TRUE
)


# ============================================================
# 4. DEFINIÇÃO DO ESQUEMA PADRÃO DAS COLUNAS
# ============================================================

# Define explicitamente o conjunto padrão de colunas
# do dataset Cyclistic
# Essa abordagem garante consistência estrutural e evita
# problemas de leitura causados por arquivos com cabeçalhos
# inconsistentes ou colunas extras
colunas_padrao <- c(
  "ride_id",
  "rideable_type",
  "started_at",
  "ended_at",
  "start_station_name",
  "start_station_id",
  "end_station_name",
  "end_station_id",
  "start_lat",
  "start_lng",
  "end_lat",
  "end_lng",
  "member_casual"
)


# ============================================================
# 5. IMPORTAÇÃO E CONSOLIDAÇÃO DOS DADOS
# ============================================================

# Lê todos os arquivos CSV listados e os combina em um único
# data frame
# map_dfr percorre cada arquivo e empilha os dados linha a linha
# read_delim é utilizado com delimitador ","
# col_names força o uso do esquema de colunas definido
# skip = 1 ignora o cabeçalho original de cada arquivo
# show_col_types = FALSE evita mensagens excessivas no console
dados_cyclistic <- arquivos_csv %>%
  map_dfr(~ read_delim(
    .x,
    delim = ",",
    col_names = colunas_padrao,
    skip = 1,
    show_col_types = FALSE
  ))


# ============================================================
# 6. INSPEÇÃO INICIAL DOS DADOS (OPCIONAL)
# ============================================================

# Visualiza os dados no formato de planilha para conferência
# inicial da estrutura e das colunas
# Recomenda-se utilizar apenas para validação, pois bases
# grandes podem demandar mais recursos
view(dados_cyclistic)


# ============================================================
# 7. LIMPEZA E TRANSFORMAÇÃO DOS DADOS
# ============================================================

# Criação de variáveis derivadas e tratamento dos dados
dados_cyclistic <- dados_cyclistic %>%
  mutate(
    # Conversão das colunas de início e término da viagem
    # do formato texto para data e hora
    started_at = ymd_hms(started_at),
    ended_at   = ymd_hms(ended_at),
    
    # Cálculo da duração do passeio em minutos
    # difftime calcula a diferença entre datas
    # as.numeric converte o resultado para valor numérico
    duracao_min = as.numeric(
      difftime(ended_at, started_at, units = "mins")
    ),
    
    # Cálculo da duração do passeio em horas
    # Útil para análises e visualizações no Tableau
    duracao_horas = as.numeric(
      difftime(ended_at, started_at, units = "hours")
    ),
    
    # Extração do dia da semana com base na data de início
    # label = TRUE retorna o nome do dia
    # abbr = FALSE retorna o nome completo
    dia_semana = wday(started_at, label = TRUE, abbr = FALSE)
  ) %>%
  
  # Remoção de registros inválidos
  # Corridas com duração zero ou negativa indicam inconsistências
  # nos dados e são excluídas da análise
  filter(duracao_min > 0)

kpi_geral <- dados_cyclistic %>%
  summarise(
    total_viagens = n(),
    duracao_media_min = mean(duracao_min),
    perc_membros = mean(member_casual == "member") * 100,
    perc_casuais = mean(member_casual == "casual") * 100
  )
corridas_dia_semana <- dados_cyclistic %>%
  group_by(member_casual, dia_semana) %>%
  summarise(
    total_corridas = n(),
    .groups = "drop"
  )
duracao_dia_semana <- dados_cyclistic %>%
  group_by(member_casual, dia_semana) %>%
  summarise(
    duracao_media_min = mean(duracao_min),
    .groups = "drop"
  )
dados_cyclistic <- dados_cyclistic %>%
  mutate(
    mes = floor_date(started_at, "month"),
    trimestre = paste0("Q", quarter(started_at)),
    semestre = if_else(month(started_at) <= 6, "S1", "S2")
  )
corridas_mes <- dados_cyclistic %>%
  group_by(member_casual, mes) %>%
  summarise(
    total_corridas = n(),
    .groups = "drop"
  )
duracao_mes <- dados_cyclistic %>%
  group_by(member_casual, mes) %>%
  summarise(
    duracao_media_min = mean(duracao_min),
    .groups = "drop"
  )
tipo_bike <- dados_cyclistic %>%
  group_by(member_casual, rideable_type) %>%
  summarise(
    total_corridas = n(),
    .groups = "drop"
  )
write_csv(kpi_geral, "kpi_geral.csv")
write_csv(corridas_dia_semana, "corridas_dia_semana.csv")
write_csv(duracao_dia_semana, "duracao_dia_semana.csv")
write_csv(corridas_mes, "corridas_mes.csv")
write_csv(duracao_mes, "duracao_mes.csv")
write_csv(tipo_bike, "tipo_bike.csv")
