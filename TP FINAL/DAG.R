library(dagitty)
library(ggdag)
library(ggplot2)

# Creamos el DAG
causal <- dagitty("dag {
  bb=\"0,0,1,1\"
  \"Actividad Física\" [pos=\"0.581,0.104\"]
  \"Alimentación\" [pos=\"0.424,0.618\"]
  \"Cantidad de amigos\" [pos=\"0.748,0.399\"]
  \"Consumo Familiar\" [pos=\"0.680,0.772\"]
  \"Contención familiar\" [pos=\"0.269,0.080\"]
  \"Intento de suicidio\" [outcome,pos=\"0.687,0.230\"]
  \"Pobreza extrema\" [pos=\"0.189,0.707\"]
  \"Violencia Física\" [pos=\"0.568,0.443\"]
  Bullying [pos=\"0.422,0.341\"]
  Consumo [pos=\"0.733,0.653\"]
  Edad [pos=\"0.284,0.393\"]
  IMC [pos=\"0.412,0.083\"]
  Sexo [pos=\"0.154,0.476\"]
  Soledad [exposure,pos=\"0.144,0.209\"]

  \"Actividad Física\" -> \"Intento de suicidio\"
  \"Actividad Física\" -> IMC
  \"Alimentación\" -> IMC
  \"Cantidad de amigos\" -> \"Intento de suicidio\"
  \"Cantidad de amigos\" -> Soledad
  \"Consumo Familiar\" -> \"Contención familiar\"
  \"Consumo Familiar\" -> \"Violencia Física\"
  \"Consumo Familiar\" -> Consumo
  \"Contención familiar\" -> Soledad
  \"Pobreza extrema\" -> \"Alimentación\"
  \"Pobreza extrema\" -> \"Consumo Familiar\"
  \"Pobreza extrema\" -> \"Intento de suicidio\"
  \"Pobreza extrema\" -> Consumo
  \"Violencia Física\" -> Bullying
  Bullying -> \"Intento de suicidio\"
  Bullying -> Soledad
  Consumo -> \"Intento de suicidio\"
  Consumo -> \"Violencia Física\"
  Edad -> \"Intento de suicidio\"
  Edad -> Soledad
  IMC -> \"Intento de suicidio\"
  IMC -> Bullying
  Sexo -> \"Intento de suicidio\"
  Sexo -> Soledad
  Soledad -> \"Intento de suicidio\"
}")



ggdag(causal) + theme_dag()+
  geom_dag_node(color ="pink") + 
  geom_dag_text(color = "black", size=3.5)+
  geom_dag_edges(size = 1.5)

causal %>% ggdag_paths_fan (shadow = TRUE, node_size = 18, text_size = 4, spread = 1.5, label_size = text_size, node= TRUE, text_col = "white")
