# lendo e atribuindo o conteúdo do arquivo na variável Enem
Enem <- read.csv("ENEM-AL-2019.csv", header=TRUE, sep =",")


# obtendo um subconjunto do data frame(tabela) Enem de um múnicipio Maceió
maceio <- subset(Enem, Enem$NO_MUNICIPIO_RESIDENCIA == "Maceió")


# TP_SEXO e TP_COR_RACA

sexos <- table(maceio$TP_SEXO) # criando uma tabela com as frequências de homens(M) e mulheres(F) que fizeram a prova
sexos   
names(sexos) <- c("Mulheres", "Homens") # renomeando de F para "Mulheres" e M para "Homens" 
sexos
barplot(sexos, main="Mulheres e Homens", ylab="Quantidade", ylim=c(0, 3000), names=c("Mulheres", "Homens"), 
        col=c("red", "blue"), legend=TRUE) # criando um gráfico de barras para sexos

estado_civil <- table(maceio$TP_COR_RACA) # 0 - Não declarado, 1 - Branca, 2 - Preta, 3 - Parda, 4 - Amarela, 5 - Indígina
estado_civil
names(estado_civil) <- c("Não declarado", "Branca", "Preta", "Parda", "Amarela", "Indígina") # renomeando os indices
estado_civil

pie(estado_civil, main="Cor/Raça", col=rainbow(6))


# Fim