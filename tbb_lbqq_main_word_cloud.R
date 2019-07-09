# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes

#Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

#Read the text file
text <- readLines(file.choose())

# Load the data as a corpus
docs <- Corpus(VectorSource(text))

#Inspect
inspect(docs)

#Text transformation
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

#CLEANING
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
docs <- tm_map(docs, removeWords, c("cada")) 
docs <- tm_map(docs, removeWords, c("país", "ser", "sueño", "personas", "quiero", "manera", "solo", "nivel", "mas", "ver", "vida", "cambio", "años", "tener", "poder", "mejorar", "debe", "países", "sino", "mejor", "puedan", "población", "bolivianos", "mejores", "así", "nacional", "bien", "ejemplo", "proyectos", "tipo", "ciudadanos", "medio", "puede", "todas", "toda", "niños", "desarrollar", "generar", "quisiera", "veo", "demás", "tal", "mayor", "proyecto", "base", "dar", "sector", "actualmente", "públicas", "llegar", "pueden", "dejar", "hacer", "gran", "tiempo", "mismos", "área", "cambios", "cuenta", "cambiar", "forma", "parte", "podamos", "boliviana", "boliviano", "vez", "cargo", "momento", "buena", "podemos", "día", "alcanzar", "casos", "grandes", "deben", "bolivianas", "persona", "mismo", "punto", "tema", "menos", "debemos", "primer", "actual", "bajo", "mediante", "existen", "áreas", "niveles", "además", "sistema", "caso", "diferentes", "hecho", "muchas", "próximos", "creo", "lejos", "nueva", "buscar", "igual", "gracias", "último", "reducción", "espero", "siempre", "generaciones", "principios", "pueda", "falta", "evitar", "existe", "bajos", "aspectos", "personal", "decir", "lograr", "necesitamos", "implica", "hacerse", "sentido", "realmente", "cualquier"))
docs <- tm_map(docs, removeWords, c("bolivia")) 
docs <- tm_map(docs, removeWords, c("desarrollo", "calidad", "recursos", "sistema")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)

#Term matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 100)
#write.csv((as.matrix(dtm)), "test.csv")

#Word cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=100, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

#Second filter
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "educativo", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "trabajar", replacement = "trabajo")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "empleo", replacement = "trabajo")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "formación", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "sistemas", replacement = "sistema")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "empleos", replacement = "trabajo")))

#Term matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 100)

#Word cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=100, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

#Third filter
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "gobierno", replacement = "instituciones")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "políticas", replacement = "instituciones")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "corrupción", replacement = "instituciones")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "profesionales", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "igualdad", replacement = "oportunidades")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "educativo", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "ley", replacement = "justicia")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "capacidades", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "empresas", replacement = "industria")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "empleo", replacement = "trabajo")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "talento", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "capacidad", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "conocimientos", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "potencial", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "industrias", replacement = "industria")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "formación", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "derechos", replacement = "justicia")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "sistemas", replacement = "sistema")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "democracia", replacement = "instituciones")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "empleos", replacement = "trabajo")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "empresarial", replacement = "industria")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "emprendedor", replacement = "industria")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "empresa", replacement = "industria")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "alumnos", replacement = "educación")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "mercado", replacement = "industria")))
docs <- tm_map(docs, content_transformer(function(x, pattern) gsub(x, pattern = "maestros", replacement = "educación")))

#Term matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 100)

#Word cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=100, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))