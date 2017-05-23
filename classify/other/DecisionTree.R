library(rpart)
spam_data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/spambase/spambase.data", header=FALSE)
spam_dataframe <- as.data.frame(spam_data)

for (i in 1:5){
  maxs <-	apply(spam_dataframe,	MARGIN	=	2,	max)
  mins <- apply(spam_dataframe, MARGIN=2,min)
  instances <- sample(1:nrow(spam_data),size=0.8*nrow(spam_data))
  scaled <- spam_dataframe
  scaled =	 as.data.frame(scale(spam_dataframe,	center	=	TRUE,	scale	=	maxs	- mins))
  trainInstances <- scaled[instances,]
  trainInstances <- na.omit(trainInstances)
  testInstances <- scaled[-instances,]
  testInstances <- na.omit(testInstances)
  col_val <- as.integer(ncol(spam_dataframe))
  actual_values <- testInstances[,as.integer(col_val)]
  n <- names(trainInstances)
  f <- as.formula(paste0("as.factor(", colnames(spam_dataframe)[col_val], ") ~ ."))
  fit_DT <- rpart(f,  data = trainInstances,  method="class",parms	=	list(split	=	"information"))
  pred <- predict(fit_DT,testInstances, type="class")
  pruneDT <- prune(fit_DT,cp=fit_DT$cptable[which.min(fit_DT$cptable[,"xerror"]),"CP"])
  DT_pred <- predict(pruneDT,testInstances, type="class")
  cmpr <- cbind(DT_pred,actual_values)
  correct_predictions <- length(cmpr[DT_pred==actual_values])/2
  total_predictions <- length(cmpr)/2
  DT_accuracy <- (correct_predictions/total_predictions)*100
  cat("accuracy of DT: ",DT_accuracy,"\n")
}