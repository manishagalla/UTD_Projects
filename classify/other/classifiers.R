library(rpart)
library(neuralnet)
library(e1071)

tae <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data", header=FALSE)
#colnames(tae) <- c('native_speaker','instructor','course','semester','size','class')
tae_data <- as.data.frame(tae)

for  (i in 1:5) {
  #maxs <-	apply(tae_data,	MARGIN	=	2,	max)
  #mins <- apply(tae_data, MARGIN=2,min)
  instances <- sample(1:nrow(tae),size=0.8*nrow(tae))
  scaled <- tae_data
  #scaled =	 as.data.frame(scale(tae_data,	center	=	TRUE,	scale	=	maxs	- mins))
  trainInstances <- scaled[instances,]
  trainInstances <- na.omit(trainInstances)
  testInstances <- scaled[-instances,]
  testInstances <- na.omit(testInstances)
  col_val <- as.integer(ncol(tae_data))
  actual_values <- testInstances[,as.integer(col_val)]
  n <- names(trainInstances)
  f <- as.formula(paste0("as.factor(", colnames(tae_data)[col_val], ") ~ ."))
  
  #Decision Tree
  
  fit_DT <- rpart(f,  data = trainInstances,  method="class",parms	=	list(split	=	"information"))
  pred <- predict(fit_DT,testInstances, type="class")
  pruneDT <- prune(fit_DT,cp=fit_DT$cptable[which.min(fit_DT$cptable[,"xerror"]),"CP"])
  DT_pred <- predict(pruneDT,testInstances, type="class")
  #actual_value <- testInstances[,as.integer(ncol(scaled))]
  cmpr <- cbind(DT_pred,actual_values)
  correct_predictions <- length(cmpr[DT_pred==actual_values])/2
  total_predictions <- length(cmpr)/2
  DT_accuracy <- (correct_predictions/total_predictions)*100
  cat("accuracy of DT: ",DT_accuracy,"\n")
  #Support Vector Machines
  fit_SVM <- svm(as.formula(paste0("as.factor(", colnames(tae_data)[col_val], ") ~ .")), data=trainInstances, cost	=	100,	gamma	=	1)
  svm_pred	<- predict(fit_SVM,	testInstances)
  cmpr <- cbind(svm_pred,actual_values)
  correct_predictions <- length(cmpr[svm_pred==actual_values])/2
  total_predictions <- length(cmpr)/2
  svm_accuracy <- (correct_predictions/total_predictions)*100
  cat("accuracy of SVM:", svm_accuracy,"\n")
  
  #Naive Bayes
  fit_NB <- naiveBayes(as.formula(paste0("as.factor(", colnames(tae_data)[col_val], ") ~ .")), data = trainInstances)
  nb_pred <- predict(fit_NB,testInstances,type="class")
  cmpr <- cbind(nb_pred,actual_values)
  correct_predictions <- length(cmpr[nb_pred==actual_values])/2
  total_predictions <- length(cmpr)/2
  nb_accuracy <- (correct_predictions/total_predictions)*100
  cat("accuracy of NB:",nb_accuracy,"\n")
  
  #Neural Networks
  trainInstances<-sapply(trainInstances,as.numeric)
  testInstances<-sapply(testInstances,as.numeric)
  nu_net <- as.formula(paste(colnames(trainInstances)[as.integer(col_val)],"~", paste(n[!n %in% colnames(trainInstances)[as.integer(col_val)]], collapse = " + ")))
  net<-paste(c(n[!n %in% colnames(trainInstances)[as.integer(col_val)]]))
  nn_fit <- neuralnet(nu_net ,trainInstances, hidden = 3, threshold = 0.1)
  temp_test <- subset(testInstances, select = c(net))
  nn_pred <- compute(nn_fit, temp_test)
  results <- data.frame(actual = testInstances[,as.integer(col_val)], prediction = nn_pred$net.result)
  results$prediction <- round(results$prediction)
  nn_accuracy<-(sum(results[,2]==testInstances[,as.integer(col_val)])/nrow(testInstances))*100
  cat(" accuracy of NN: ",nn_accuracy,"\n")
  
  #Perceptron
  p_fit <- neuralnet(nu_net ,trainInstances, hidden = 0, threshold = 0.1)
  temp_test <- subset(testInstances, select = c(net))
  p_pred <- compute(p_fit, temp_test)
  results <- data.frame(actual = testInstances[,as.integer(col_val)], prediction = p_pred$net.result)
  results$prediction <- round(results$prediction)
  p_accuracy<-(sum(results[,2]==testInstances[,as.integer(col_val)])/nrow(testInstances))*100
  cat(" accuracy of Perceptron: ",p_accuracy,"\n")
}

