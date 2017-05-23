library(neuralnet)
spam_data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data", header=FALSE)
spam_dataframe <- as.data.frame(spam_data)

for (i in 1:5){
  instances <- sample(1:nrow(spam_data),size=0.8*nrow(spam_data))
  trainInstances <- spam_dataframe[instances,]
  trainInstances <- na.omit(trainInstances)
  testInstances <- spam_dataframe[-instances,]
  testInstances <- na.omit(testInstances)
  col_val <- as.integer(ncol(spam_dataframe))
  n <- names(trainInstances)
  actual_values <- testInstances[,as.integer(col_val)]
  trainInstances<-sapply(trainInstances,as.numeric)
  testInstances<-sapply(testInstances,as.numeric)
  nu_net <- as.formula(paste(colnames(trainInstances)[as.integer(col_val)],"~", paste(n[!n %in% colnames(trainInstances)[as.integer(col_val)]], collapse = " + ")))
  net<-paste(c(n[!n %in% colnames(trainInstances)[as.integer(col_val)]]))
  p_fit <- neuralnet(nu_net ,trainInstances, hidden = 0, threshold = 0.01)
  temp_test <- subset(testInstances, select = c(net))
  p_pred <- compute(p_fit, temp_test)
  results <- data.frame(actual = testInstances[,as.integer(col_val)], prediction = p_pred$net.result)
  results$prediction <- round(results$prediction)
  p_accuracy<-(sum(results[,2]==testInstances[,as.integer(col_val)])/nrow(testInstances))*100
  cat(" accuracy of Perceptron: ",p_accuracy,"\n")
  
 }