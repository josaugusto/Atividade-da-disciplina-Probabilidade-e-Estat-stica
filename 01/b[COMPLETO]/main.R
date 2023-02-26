# lendo e atribuindo o conteúdo do arquivo na variável Enem
Enem <- read.csv("ENEM-AL-2019.csv", header=TRUE, sep =",", dec=",")

# obtendo um subconjunto do data frame(tabela) Enem de um múnicipio Maceió
maceio <- subset(Enem, Enem$NO_MUNICIPIO_RESIDENCIA == "Maceió")

# trocando , por . com a função gsub(), depois convertendo a string para número(as.numeric()) e atribuindo nas variáveis
notasdoEnem <- c(as.numeric(gsub(",", ".", maceio$NU_NOTA_ENEM))) 
notasdoEnem

# usando a função quantile para obter os quartis da nota do Enem, a função
limitesclas <- unname(quantile(notasdoEnem)) 
limitesclas
classes <- c("165.70 - 465.42", "465.42 - 519.60", "519.60 - 589.45", "589.45 - 786.86")

# Criando uma tabela de frequências com as notas do Enem em suas determinadas classes
freq <- table(cut(notasdoEnem, breaks=limitesclas, right=FALSE, labels=classes)) 
freq
freqrel <- prop.table(freq) # frequência relativa
freqrel
freqAc <- cumsum(freq) # frequência acumulada
freqAc
freqrelAc <- cumsum(freqrel) # frequência acumulada relativa
freqrelAc

tabelaEnem <- cbind(freq,
                    freqAc = round(freqAc, digits=2),
                    freqrel = round(freqrel*100, digits=2),
                    freqrelAc = round(freqrelAc*100, digits=2)
)

tabelaEnem


grafico_hist <- hist(notasdoEnem, breaks=limitesclas, freq=TRUE, xlab="Notas", ylab="Frequências absolutas",
labels=classes, main="Histograma das Notas do ENEM", xlim=c(100, 800), ylim=c(0, 1200), col="orange")


# Fim