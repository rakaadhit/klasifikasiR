install.packages("party")
library(party)
View(wine)
set.seed(1234)
ind <- sample(2, nrow(wine), replace = TRUE, prob = c(0.7,0.30))
train.data <- wine[ind==1,]
test.data <- wine[ind==2,]
myf <- X.Type ~ Malic_Acid+Ash+Ash_Alcalinity+Nonflavanoid_phenols+Proanthocyanins
wine_ctree <- ctree(myf, data=train.data)
table(predict(wine_ctree), train.data$X.Type)
plot(wine_ctree)
testpred <- predict(wine_ctree, newdata=test.data)
table(testpred, test.data$X.Type)
