# lendo e atribuindo o conteúdo do arquivo na variável Enem
Enem <- read.csv("ENEM-AL-2019.csv", header=TRUE, sep =",", dec=",")


# obtendo um subconjunto do data frame(tabela) Enem de um múnicipio Maceió
maceio <- subset(Enem, Enem$NO_MUNICIPIO_RESIDENCIA == "Maceió")


# TP_ESCOLA(qualitativa) e NU_NOTA_REDACAO(quantitativa)

tipodeEscola <- table(maceio$TP_ESCOLA)
tipodeEscola
names(tipodeEscola) <- c("Pública", "Privada") # renomeando os valores 2 e 3 para Pública e Privada respectivamente
tipodeEscola

pie(tipodeEscola, main="Tipo de escola do Ensino Médio que fizeram a prova do Enem",
col=c("blue", "orange"))

notasdaRedacao <- c(maceio$NU_NOTA_REDACAO)
notasdaRedacao
# intervalos das notas do Enem
limitesclas <- unname(quantile(notasdaRedacao)) 
limitesclas # 0 520 620 740 980
classes <- c("0 - 520", "520 - 620", "620 - 740", "740 - 980") 
freq <- table(cut(notasdaRedacao, breaks=limitesclas, right=FALSE, labels=classes))
freq

barplot(freq, main="Gráfico de barras com as frequências das Notas de redação do Enem",
xlab="Notas do Enem", ylab="Frequência absoluta", ylim=c(0, 1200), col=rainbow(4))


# Fim