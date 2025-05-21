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



ggdag(causal, layout = "circle")


ggdag_paths(causal) # CAMINOS QUE ESTAN ABIERTOS. FIJATE Q DICE CORREGIR POR EDUCACION
# Corrigiendo educacion corregis un camino.

ggdag(causal, layout = "nicely") + 
  theme_dag() +
  ggtitle("DAG ordenado automáticamente")


ggdag(causal, layout = "stress") + 
  theme_dag() +
  ggtitle("DAG con layout Stress") +
  theme(legend.position = "none")


ggdag(causal, layout = "manual") + 
  theme_dag() +
  ggtitle("DAG mejorado con posiciones manuales") +
  theme(legend.position = "none", 
        text = element_text(size = 12),  # Tamaño de texto
        plot.title = element_text(size = 14, face = "bold"))  # Título más grande



ggdag(causal, layout = "stress") + 
  theme_dag() +
  ggtitle("DAG con Layout Stress y Caminos Abiertos") +
  theme(legend.position = "none", 
        text = element_text(size = 12), 
        plot.title = element_text(size = 14, face = "bold")) +
  geom_dag_text(aes(label = name), size = 4, color = "darkred") +  # Texto más grande y de color
  geom_dag_point(aes(color = name), size = 5) +  # Nodos con color más intenso
  ggdag_paths(causal, shadow = TRUE)  # Muestra los caminos abiertos