Enem <- read.csv("ENEM-AL-2019.csv",
header=TRUE, sep =",", dec=",")

# obtendo um subconjunto do data frame(tabela) Enem de um múnicipio Maceió
maceio <- subset(Enem, Enem$NO_MUNICIPIO_RESIDENCIA == "Maceió")

# NU_IDADE e TP_ESTADO_CIVIL

idadesEnem <- c(maceio$NU_IDADE)
idadesEnem

#  Estava repetindo o valor 18(15 17 18 18 52), então resolvi usar a função unique para remover valores duplicados 
limitesclas <- unique(unname(quantile(idadesEnem))) 
limitesclas # 15 17 18 52
classes <- c("15 - 17", "17 - 18", "18 - 52")
freq <- table(cut(idadesEnem, breaks=limitesclas, right=FALSE, labels=classes))
freq


grafico_hist <-  hist(idadesEnem, breaks=limitesclas, freq=TRUE, xlab="Idades", 
ylab="Frequências absolutas", labels=classes, main="Idade das 
pessoas que fizeram o Enem", xlim=c(10, 60), ylim=c(0, 2500), col="green")


estadoCivilEnem <- c(maceio$TP_ESTADO_CIVIL)
estadoCivilEnem
freq <- table(estadoCivilEnem) 

# Não informado Solteiro(a) Casado(a) Divorciado(a) Viúvo(a)
names(freq) <- c("Não informado", "Solteiro(a)", "Casado(a)", "Divorciado(a)", "Viúvo(a)") 
freq
barplot(freq, main="Estado Civil de pessoas que fizeram o Enem", ylab="Frequência", 
ylim=c(0, 5000), col=rainbow(5), legend=TRUE)


redacaoEnem <- c(maceio$NU_NOTA_REDACAO)
notasMatematica <- c(maceio$NU_NOTA_MT)

# A função cor() calcula o coeficiente de correlação entre duas variáveis.
# O coeficiente de correlação varia entre -1 e 1.
# Quando é igual a 1, as variáveis estão perfeitamente correlacionadas positivamente
# Quando é igual a -1, as variáveis estão perfeitamente correlacionadas negativamente.
# Quando o valor é menor que 1 significa que a correlação não é perfeita
# Quando é igual a 0, não há correlação entre as variáveis.

correlacao <- cor(redacaoEnem, notasMatematica) 
correlacao # 0.5489052(a correlação não é perfeita)


# Fim
