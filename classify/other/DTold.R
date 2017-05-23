d <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/tae/tae.data", header=FALSE)
colnames(d) <- c('native_speaker','instructor','course','semester','size','class')
value <- as.integer(ncol(d) )
sampleInstances<-sample(1:nrow(d),size = 0.8*nrow(d))
trainingData<-d[sampleInstances,]
trainingData <-na.omit(trainingData)
testData<-d[-sampleInstances,]
testData <-na.omit(testData)
p<-as.factor(as.integer(value))
p2<-testData[,as.integer(value)]
model <- rpart(as.formula(paste0("as.factor(", colnames(d)[value], ") ~ .")),data=trainingData,method="class",parms = list(split = 'information'),minsplit = 2, minbucket = 1)
pruned_model1<- prune(model, cp=model$cptable[which.min(model$cptable[,"xerror"]),"CP"])
predicted_values<-predict(pruned_model1,testData,type="class")
og_vals <- p2
og_vals
attr_for_acc <- cbind(predicted_values,og_vals)
correct_predictions <- length(attr_for_acc[predicted_values==og_vals])/2
total_correct_predictions <- length(attr_for_acc)/2
accrcy <- (correct_predictions/total_correct_predictions)*100
cat("Method = ", "DT",", accuracy= ", accrcy,"\n")