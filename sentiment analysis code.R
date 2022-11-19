#installing the packages required fpr sentiment analysis
install.packages("tidyverse")
install.packages("tidytext")
install.packages("syuzhet")
install.packages("stringr")

#load the libraries 
library(tidyverse)
library(tidytext)
library(syuzhet)
library(stringr)

#importing the dataset 
df <- read.csv("flipkart_review_data_2022_02.csv")
text.df <- tibble(df$averageRating)

#analysing sentiments using syuzhet package
emotions <- get_nrc_sentiment(df$reviewDescription)
emo_bar <- colSums(emotions)
emo_sum <- data.frame(count = emo_bar ,emotion=names(emo_bar))

#barplot showcasing emotions and negative/positive rating
ggplot(emo_sum, aes(x = reorder(emotion, -count), y=count)) + geom_bar(stat = "identity")


                                                                        