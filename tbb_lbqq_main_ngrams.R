library(tm)
library(ggplot2)
library(reshape2)
library(wordcloud)
library(RWeka)

options(mc.cores=1)

setwd("C:/Users/Erick Gonzales/Documents/2_Teaching/Others/Tu_Beca_Bolivia/Others/LaBoliviaqueQueremos")

#Read the text file
text <- readLines(file.choose())


# Load the data as a corpus
docs <- Corpus(VectorSource(text))

#Inspect
inspect(docs)


#Text transformation
#toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
#docs <- tm_map(docs, toSpace, "/")
#docs <- tm_map(docs, toSpace, "@")
#docs <- tm_map(docs, toSpace, "\\|")

#CLEANING
#Fix punctuation
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "pais", replacement = "país")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "educacion", replacement = "educación")))
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
##docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removeWords, stopwords("spanish"))
docs <- tm_map(docs, removeWords, c("cada")) 
docs <- tm_map(docs, removeWords, c("país", "ser", "sueño", "personas", "quiero", "manera", "solo", "nivel", "mas", "ver", "vida", "cambio", "años", "tener", "poder", "mejorar", "debe", "países", "sino", "mejor", "puedan", "población", "bolivianos", "mejores", "así", "nacional", "bien", "ejemplo", "proyectos", "tipo", "ciudadanos", "medio", "puede", "todas", "toda", "niños", "desarrollar", "generar", "quisiera", "veo", "demás", "tal", "mayor", "proyecto", "base", "dar", "sector", "actualmente", "públicas", "llegar", "pueden", "dejar", "hacer", "gran", "tiempo", "mismos", "área", "cambios", "cuenta", "cambiar", "forma", "parte", "podamos", "boliviana", "boliviano", "vez", "cargo", "momento", "buena", "podemos", "día", "alcanzar", "casos", "grandes", "deben", "bolivianas", "persona", "mismo", "punto", "tema", "menos", "debemos", "primer", "actual", "bajo", "mediante", "existen", "áreas", "niveles", "además", "sistema", "caso", "diferentes", "hecho", "muchas", "próximos", "creo", "lejos", "nueva", "buscar", "igual", "gracias", "último", "reducción", "espero", "siempre", "generaciones", "principios", "pueda", "falta", "evitar", "existe", "bajos", "aspectos", "personal", "decir", "lograr", "necesitamos", "implica", "hacerse", "sentido", "realmente", "cualquier"))
docs <- tm_map(docs, removeWords, c("bolivia")) 
docs <- tm_map(docs, removeWords, c("desarrollo", "calidad", "recursos", "sistema")) 
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, stripWhitespace)

minfreq_bigram<-2
bitoken <- NGramTokenizer(docs, Weka_control(min=2,max=2))
two_word <- data.frame(table(bitoken))
sort_two <- two_word[order(two_word$Freq,decreasing=TRUE),]
wordcloud(sort_two$bitoken,sort_two$Freq,random.order=FALSE,scale = 
              c(2,0.35),min.freq = minfreq_bigram,colors = brewer.pal(8,"Dark2"),max.words=150)






corpus <- Corpus(VectorSource(mydata$Comments))

length(corpus)





# N-Grams in R
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(ggplot2)
#library(dplyr)
library(data.table)
library(rJava)
library(RWeka)
library(SnowballC)

setwd("C:/Users/Erick Gonzales/Documents/2_Teaching/Others/Tu_Beca_Bolivia/Others/LaBoliviaqueQueremos")

mydata <-read.csv("word_cloud_data.csv", header = TRUE)

mycorpus <- Corpus(VectorSource(mydata$Comments))

# Text Cleaning
mycorpus <- tm_map(mycorpus, stripWhitespace)
mycorpus <- tm_map(mycorpus, tolower)
mycorpus <- tm_map(mycorpus, removeWords,stopwords("english"))
#mycorpus <- tm_map(mycorpus, removeWords, c("was"))
mycorpus <- tm_map(mycorpus, removePunctuation)
mycorpus <- tm_map(mycorpus, PlainTextDocument)

#token_delim <- " \\t\\r\\n.!?,;\"()"
bitoken <- NGramTokenizer(mycorpus, Weka_control(min=2,max=2))
two_word <- data.frame(table(bitoken))
sort_two <- two_word[order(two_word$Freq,decreasing=TRUE),]
wordcloud(sort_two$bitoken,sort_two$Freq,random.order=FALSE,scale = c(2,0.35), colors = brewer.pal(8,"Dark2"),max.words=150)


, delimiters = token_delim

tokPromote <- function(x) NGramTokenizer(x, Weka_control(min=2, max=3))

token_delim <- " \\t\\r\\n.!?,;\"()¿¡"
tritoken <- NGramTokenizer(mycorpus, Weka_control(min=3,max=3, delimiters = token_delim))
three_word <- data.frame(table(tritoken))
sort_three <- three_word[order(three_word$Freq,decreasing=TRUE),]
wordcloud(sort_three$tritoken, sort_three$Freq, random.order=FALSE,min.freq = minfreq_trigram,scale = c(1.2,0.35),colors = brewer.pal(8,"Dark2"),max.words=150)








BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
tdm.bigram = TermDocumentMatrix(mycorpus, control = list(tokenize = BigramTokenizer))

freq = sort(rowSums(as.matrix(tdm.bigram)),decreasing = TRUE)
freq.df = data.frame(word=names(freq), freq=freq)
head(freq.df, 20)


token_delim <- " \\t\\r\\n.!?,;\"()"
bitoken <- NGramTokenizer(mycorpus, Weka_control(min=2,max=2, delimiters = token_delim))
two_word <- data.frame(table(bitoken))
sort_two <- two_word[order(two_word$Freq,decreasing=TRUE),]
wordcloud(sort_two$bitoken,sort_two$Freq,random.order=FALSE,scale = c(2,0.35),min.freq = minfreq_bigram,colors = brewer.pal(8,"Dark2"),max.words=150)

tokPromote <- function(x) NGramTokenizer(x, Weka_control(min=2, max=2))
tdmPromote <- TermDocumentMatrix(mycorpus,control = list(tokenize = tokPromote))
two_word <- data.frame(table(tdmPromote))
sort_two <- two_word[order(two_word$Freq,decreasing=TRUE),]
wordcloud(sort_two$bitoken,sort_two$Freq,random.order=FALSE,scale = c(2,0.35),min.freq = minfreq_bigram,colors = brewer.pal(8,"Dark2"),max.words=150)




termFreqPromote <- rowSums(as.matrix(tdmPromote))
termFreqVectorPromote <- as.list(termFreqPromote)



as.character(mycorpus[[1]])

# Bigrams 
minfreq_bigram<-2

token_delim <- " \\t\\r\\n.!?,;\"()"
bitoken <- NGramTokenizer(mycorpus, Weka_control(min=2,max=2, delimiters = token_delim))
two_word <- data.frame(table(bitoken))
sort_two <- two_word[order(two_word$Freq,decreasing=TRUE),]
wordcloud(sort_two$bitoken,sort_two$Freq,random.order=FALSE,scale = c(2,0.35),min.freq = minfreq_bigram,colors = brewer.pal(8,"Dark2"),max.words=150)


minfreq_trigram <- 5

token_delim <- " \\t\\r\\n.!?,;\"()"
tritoken <- NGramTokenizer(mycorpus, Weka_control(min=3,max=3, delimiters = token_delim))
three_word <- data.frame(table(tritoken))
sort_three <- three_word[order(three_word$Freq,decreasing=TRUE),]
wordcloud(sort_three$tritoken, sort_three$Freq, random.order=FALSE,min.freq = minfreq_trigram,scale = c(1.2,0.35),colors = brewer.pal(8,"Dark2"),max.words=150)




# Trigrams 

minfreq_trigram <- 5

token_delim <- " \\t\\r\\n.!?,;\"()"
tritoken <- NGramTokenizer(mycorpus, Weka_control(min=3,max=3, delimiters = token_delim))
three_word <- data.frame(table(tritoken))
sort_three <- three_word[order(three_word$Freq,decreasing=TRUE),]
wordcloud(sort_three$tritoken, sort_three$Freq, random.order=FALSE,min.freq = minfreq_trigram,scale = c(1.2,0.35),colors = brewer.pal(8,"Dark2"),max.words=150)






#ngrams
library(tm)
library(ggplot2)
library(reshape2)
library(wordcloud)
library(RWeka)

#Read the text file
text <- readLines(file.choose())

# Load the data as a corpus
corpus <- Corpus(VectorSource(text))

corpus.ng = tm_map(corpus,removeWords,c(stopwords(),"s","ve"))
corpus.ng = tm_map(corpus.ng,removePunctuation)
corpus.ng = tm_map(corpus.ng,removeNumbers)

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
tdm.bigram = TermDocumentMatrix(corpus.ng,
                                control = list(tokenize = BigramTokenizer))

freq = sort(rowSums(as.matrix(tdm.bigram)),decreasing = TRUE)
freq.df = data.frame(word=names(freq), freq=freq)
head(freq.df, 20)


#Inspect
inspect(docs)

#CLEANING
docs <- tm_map(docs,removeWords,c(stopwords(),"s","ve"))
docs <- tm_map(docs,removePunctuation)
docs <- tm_map(docs,removeNumbers)


#Text transformation
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
#Fix punctuation
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "pais", replacement = "país")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "educacion", replacement = "educación")))
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
docs <- tm_map(docs, removeWords, stopwords("spanish"))
# specify your stopwords as a character vector
#docs <- tm_map(docs, removeWords, c("cada")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
#docs <- tm_map(docs, stripWhitespace)


BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
tdm.bigram = TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))

freq = sort(rowSums(as.matrix(tdm.bigram)),decreasing = TRUE)
freq.df = data.frame(word=names(freq), freq=freq)
head(freq.df, 20)


#Term matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 100)

BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
tdm.bigram = TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))

freq = sort(rowSums(as.matrix(tdm.bigram)),decreasing = TRUE)
freq.df = data.frame(word=names(freq), freq=freq)
head(freq.df, 20)



















#N-grams (trigram)
#Text transformation
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")


#Fix punctuation
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "pais", replacement = "país")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "educacion", replacement = "educación")))
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
#docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
#docs <- tm_map(docs, removeWords, stopwords("spanish"))
# specify your stopwords as a character vector
#docs <- tm_map(docs, removeWords, c("cada")) 
#docs <- tm_map(docs, removeWords, c("país", "ser", "sueño", "personas", "quiero", "manera", "solo", "nivel", "mas", "ver", "vida", "cambio", "años", "tener", "poder", "mejorar", "debe", "países", "sino", "mejor", "puedan", "población", "bolivianos", "mejores", "así", "nacional", "bien", "ejemplo", "proyectos", "tipo", "ciudadanos", "medio", "puede", "todas", "toda", "niños", "desarrollar", "generar", "quisiera", "veo", "demás", "tal", "mayor", "proyecto", "base", "dar", "sector", "actualmente", "públicas", "llegar", "pueden", "dejar", "hacer", "gran", "tiempo", "mismos", "área", "cambios", "cuenta", "cambiar", "forma", "parte", "podamos", "boliviana", "boliviano", "vez", "cargo", "momento", "buena", "podemos", "día", "alcanzar", "casos", "grandes", "deben", "bolivianas", "persona", "mismo", "punto", "tema", "menos", "debemos", "primer", "actual", "bajo", "mediante", "existen", "áreas", "niveles", "además", "sistema", "caso", "diferentes", "hecho", "muchas", "próximos", "creo", "lejos", "nueva", "buscar", "igual", "gracias", "último", "reducción", "espero", "siempre", "generaciones", "principios", "pueda", "falta", "evitar", "existe", "bajos", "aspectos", "personal", "decir", "lograr", "necesitamos", "implica", "hacerse", "sentido", "realmente", "cualquier"))
#docs <- tm_map(docs, removeWords, c("bolivia")) 
#docs <- tm_map(docs, removeWords, c("desarrollo", "calidad", "recursos", "sistema")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
#docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)
tok <- function(x) NGramTokenizer(x, Weka_control(min=3, max=10))
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 100)



tdm <- TermDocumentMatrix(test,control = list(tokenize = tok))

termFreq <- rowSums(as.matrix(tdm))
termFreqVector <- as.list(termFreq)






token_delim <- " \\t\\r\\n.!?,;\"()¿¡"
tritoken <- NGramTokenizer(mycorpus, Weka_control(min=3,max=3, delimiters = token_delim))
three_word <- data.frame(table(tritoken))
sort_three <- three_word[order(three_word$Freq,decreasing=TRUE),]
wordcloud(sort_three$tritoken, sort_three$Freq, random.order=FALSE,min.freq = minfreq_trigram,scale = c(1.2,0.35),colors = brewer.pal(8,"Dark2"),max.words=150)



library(rvest)
library(stringr)
library(dplyr)
library(ggplot2)
library(colorRamps)
require(SnowballC)
require(tidyr)
require(gridExtra)
require(tidytext)
require(RColorBrewer)
require(wordcloud)

