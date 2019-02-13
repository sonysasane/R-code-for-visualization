movies <- read.csv("challenge6.csv")
head(movies)
str(movies)
colnames(movies) <- c("Day", "Director","Genre","movie","Release","studio",
                      "adjstGrossMillions","BudgetMillions","GrossMillions",
                      "IMDB.rating","movielenserating","overseasMillions",
                      "overseas","profitMillions","profit","runtime","USMillions",
                      "GrossUS")

install.packages("ggplot2")
library(ggplot2)

filter <- movies[movies$Genre == "action" | movies$Genre == "adventure" | movies$Genre == "animation" |
                   
                   movies$Genre == "comedy" | movies$Genre == "drama",]
head(filter)

filter2 <- filter[filter$studio == "Buena Vista Studios" | filter$studio == "Fox" | filter$studio == "Sony" |
                    filter$studio == "Paramount Pictures" | filter$studio == "Universal" | filter$studio == "WB",]
m <- ggplot(data = filter2, aes(x = Genre, y = GrossUS))
v <- m + geom_jitter(aes(size = BudgetMillions,color = studio)) + geom_boxplot(alpha = 0.5 , outlier.color = NA )+
  scale_size_area(max_size = 3) 
v
install.packages("extrafont")

library(extrafont)

font_import()  
v + xlab("Genre") + ylab("Gross % US") + 
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(color = "Blue", size = 20),
        axis.title.y = element_text(color = "Blue", size = 20),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        legend.title = element_text(size = 15),
        legend.text =  element_text(size = 10),
        plot.title = element_text(color = "Black", size = 20),
        text =  element_text(family = "Comic Sans MS"))
