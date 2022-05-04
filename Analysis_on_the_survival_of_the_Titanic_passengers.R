#Loading CSV files
train <- read.csv("train.csv",header = TRUE)
test <- read.csv("test.csv",header = TRUE)


#Creating a new file, from coping the test file and adding a variable 'survived' to it
test.survived <- data.frame(Survived = rep("None", nrow(test)), test[,])

#Creating a combined file by rows, from test.survived and train
data.combine <- rbind(train, test.survived)


#Looking at the structure of our dataFrame
str(data.combine)

#Converting Pclass data-type to factor
data.combine$Pclass <- as.factor(data.combine$Pclass)

#Converting Survived from 'chr' to 'factor'
data.combine$Survived <- as.factor(data.combine$Survived)


#Analyzing the number of passengers based on their socio-econmic status
table(data.combine$Pclass)

#Analyzing the number of passengers who did not survive
table(data.combine$Survived)



#adding a library for visualization
library(ggplot2)


#plotting a histogram 
train$Pclass = as.factor(train$Pclass)
train$Survived = as.factor(train$Survived)
ggplot(train, aes(x = Pclass, fill = Survived)) + stat_count(width = 0.5) + 
  xlab("Pclass") + 
  ylab("Total Count") +
  labs(fill = "Survived")


################ THE END ############################################