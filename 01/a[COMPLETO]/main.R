# lendo e atribuindo o conteúdo do arquivo na variável Enem
Enem <- read.csv("ENEM-AL-2019.csv", header=TRUE, sep =",")


# obtendo um subconjunto do data frame(tabela) Enem de um múnicipio Maceió
maceio <- subset(Enem, Enem$NO_MUNICIPIO_RESIDENCIA == "Maceió")


# trocando , por . com a função gsub(), depois convertendo a string para número(as.numeric()) e atribuindo nas variáveis
notasdeNatureza <- c(as.numeric(gsub(",", ".", maceio$NU_NOTA_CN)))
notasdeHumanas <- c(as.numeric(gsub(",", ".", maceio$NU_NOTA_CH))) 
notasdeLinguagens <- c(as.numeric(gsub(",", ".", maceio$NU_NOTA_LC))) 
notasdeMatematica <- c(as.numeric(gsub(",", ".", maceio$NU_NOTA_MT))) 
notasdeRedacao <- c(as.numeric(gsub(",", ".",maceio$NU_NOTA_REDACAO))) 
notasdoEnem <- c(as.numeric(gsub(",", ".", maceio$NU_NOTA_ENEM))) 


# gráfico de boxplot de todas as notas do Enem e a média final do Enem
boxplot(notasdeNatureza, notasdeHumanas, notasdeLinguagens, notasdeMatematica,
notasdeRedacao, notasdoEnem, main="Notas do Enem de Maceió", names=c("Natureza",
"Humanas", "Linguagens", "Matemática", "Redação", "Final"), col=c("blue", "red", 
"yellow", "brown", "green", "purple"))

                                                                                                                                                    
# Fim