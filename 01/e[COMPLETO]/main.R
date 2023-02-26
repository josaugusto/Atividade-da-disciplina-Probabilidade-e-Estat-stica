# lendo e atribuindo o conteúdo do arquivo na variável Enem
Enem <- read.csv("ENEM-AL-2019.csv", header=TRUE, sep =",")


# obtendo um subconjunto do data frame(tabela) Enem de um múnicipio Maceió
maceio <- subset(Enem, Enem$NO_MUNICIPIO_RESIDENCIA == "Maceió")

# NU_NOTA_REDACAO e NU_NOTA_ENEM

NotasRedacao <- c(maceio$NU_NOTA_REDACAO)
NotasFinalEnem <- c(as.numeric(gsub(",", ".", maceio$NU_NOTA_ENEM)))

cv_Redacao <- sd(NotasRedacao)/mean(NotasRedacao)*100 # coeficiente de correlação das notas de Redação
cv_Redacao # 32.22155
cv_FinalEnem <- sd(NotasFinalEnem)/mean(NotasFinalEnem)*100 # coeficiente de correlação das notas de Final Enem
cv_FinalEnem # 16.78886

plot(NotasRedacao, NotasFinalEnem, main="Gráfico de dispersão", xlab="Redação",
ylab="Media Final", xlim=c(0, 1000), ylim=c(0, 800), col="blue")


# Fim