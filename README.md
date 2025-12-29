# 🚲 Cyclistic — Estudo de Caso de Análise de Dados

## 📌 Visão Geral
Este repositório apresenta um estudo de caso de **Análise de Dados** baseado no programa de compartilhamento de bicicletas da **Cyclistic**, uma empresa fictícia localizada em Chicago.  
O projeto foi desenvolvido como parte da formação **Google Data Analytics**, seguindo todas as etapas do processo analítico:

**Perguntar → Preparar → Processar → Analisar → Compartilhar → Agir**

O objetivo principal é **identificar diferenças de comportamento entre usuários casuais e membros anuais**, gerando insights que apoiem estratégias de marketing voltadas ao aumento de assinaturas anuais.

---

## 🎯 Problema de Negócio
A Cyclistic deseja aumentar sua base de **membros anuais**. Para isso, é necessário compreender como os diferentes tipos de usuários utilizam o serviço, permitindo o desenvolvimento de estratégias de marketing mais eficazes e direcionadas.

---

## ❓ Perguntas de Análise
- Como membros anuais e usuários casuais utilizam as bicicletas da Cyclistic de forma diferente?
- Quais padrões de uso podem indicar oportunidades de conversão para planos anuais?
- Como o comportamento varia ao longo do tempo (dias da semana, meses e períodos)?

---

## 📊 Fonte dos Dados
- **Fonte:** Motivate International Inc. (dados públicos)
- **Período:** Últimos 12 meses de registros
- **Formato original:** Arquivos CSV mensais
- **Privacidade:** Os dados não contêm informações pessoais identificáveis

⚠️ **Observação:**  
Os dados brutos possuem mais de **5 milhões de registros** e ultrapassam **1GB**, portanto **não foram versionados neste repositório**.

---

## 🗂️ Estrutura do Repositório

```text
cyclistic-case-study/
│
├── README.md
├── scripts/
│   └── data_processing.R
│
├── data/
│   └── README.md
│
├── outputs/
│   └── corridas_dia_semana.csv
|   └── corridas_mes.csv
|   └── duracao_dia_semana.csv
|   └── duracao_mes.csv
|   └── kpi_geral.csv
|   └── tipo_bike.csv
|
├── visuals/
│   └── Cyclistic - Dashboard.png
│
└── docs/
    └── Cyclistic - Estudo de Caso.pdf
---
```
## 🔧 Preparação dos Dados
- Download dos arquivos CSV mensais referentes aos últimos 12 meses;
- Exploração inicial dos dados no Excel para compreensão da estrutura, colunas e tipos de variáveis;
- Verificação de consistência entre os arquivos mensais;
- Avaliação das limitações técnicas do Excel para consolidação de grandes volumes de dados.

---

## 🧹 Processamento e Limpeza dos Dados
Devido ao alto volume de dados, o processamento foi realizado no **RStudio**, ferramenta mais adequada para trabalhar com grandes conjuntos de dados.

As principais etapas incluíram:
- Importação de todos os arquivos CSV mensais;
- Padronização das colunas durante a leitura dos arquivos;
- Correção de inconsistências causadas por delimitadores incorretos;
- Conversão das colunas de data e hora para o formato adequado;
- Criação de variáveis derivadas:
  - Duração das viagens (minutos e horas);
  - Dia da semana;
  - Mês, trimestre e semestre;
- Remoção de registros com duração inválida (menor ou igual a zero).

Todo o processo foi aplicado de forma **padronizada e reprodutível**, garantindo a qualidade e confiabilidade dos dados utilizados na análise.

---

## 📈 Análise
A análise concentrou-se na comparação entre **usuários casuais** e **membros anuais**, considerando:

- Quantidade de corridas por dia da semana;
- Duração média das viagens por dia da semana;
- Distribuição das corridas ao longo dos meses;
- Diferenças de comportamento ao longo do tempo.

Para otimizar o desempenho das ferramentas de visualização, os dados foram **agregados e resumidos em R**, gerando arquivos finais mais leves para análise visual.

---

## 📊 Visualizações
As visualizações finais foram desenvolvidas no **Tableau**, incluindo:
- Indicadores-chave (KPIs);
- Gráficos comparativos entre membros e usuários casuais;
- Análises temporais semanais e mensais.

As imagens do dashboard estão disponíveis na pasta `/visuals`.

---

## 💡 Principais Insights
- Usuários casuais utilizam o serviço principalmente nos finais de semana;
- Membros apresentam uso mais frequente e consistente durante os dias úteis;
- A duração média das viagens de usuários casuais é maior, sugerindo uso recreativo;
- Membros utilizam o serviço de forma mais previsível ao longo do tempo.

---

## 📌 Recomendações (orientadas a ações)
- Desenvolver campanhas promocionais focadas em finais de semana;
- Oferecer planos de associação flexíveis ou testes gratuitos para usuários recorrentes;
- Intensificar campanhas em períodos sazonais de maior uso.

---

## 📚 Conclusão e Aprendizados
Este estudo de caso demonstrou como a análise de dados pode apoiar decisões estratégicas de marketing.  
O projeto permitiu consolidar conhecimentos em:
- Processamento de grandes volumes de dados;
- Uso de R para limpeza e agregação;
- Criação de dashboards no Tableau;
- Documentação e versionamento de projetos analíticos.

---

## 🛠️ Ferramentas Utilizadas
- **Excel** — Exploração inicial dos dados
- **RStudio** — Processamento, limpeza e agregação
- **Tableau** — Visualização de dados
- **GitHub** — Versionamento e portfólio

---

## 🔗 Links
- 📊 Dashboard: disponível na pasta `/visuals`
- 📄 Estudo de caso completo: `/docs/Cyclistic - Estudo de Caso.pdf`

---

📬 **Contato**  
Caso queira conversar sobre este projeto ou sobre análise de dados, fique à vontade para entrar em contato pelo LinkedIn.

