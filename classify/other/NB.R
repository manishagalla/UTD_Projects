library(e1071)

tae <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/tae/tae.data", header=FALSE)
colnames(tae) <- c('native_speaker','instructor','course','semester','size','class')
tae_data <- as.data.frame(tae)
maxs <-	apply(tae_data,	MARGIN	=	2,	max)
mins <- apply(tae_data, MARGIN=2,min)
instances <- sample(1:nrow(tae),size=0.8*nrow(tae))
scaled =	 as.data.frame(scale(tae_data,	center	=	mins,	scale	=	maxs	- mins))
trainInstances <- tae_data[instances,]
trainInstances <- na.omit(trainInstances)
testInstances <- tae_data[-instances,]
testInstances <- na.omit(testInstances)
col_val <- as.integer(ncol(tae_data))
actual_values <- testInstances[,as.integer(col_val)]

fit <- naiveBayes(as.formula(paste0("as.factor(", colnames(tae_data)[col_val], ") ~ .")), data = trainInstances)
nb_pred <- predict(fit,testInstances,type="class")
cmpr <- cbind(nb_pred,actual_values)
correct_predictions <- length(cmpr[nb_pred==actual_values])/2
total_predictions <- length(cmpr)/2
nb_accuracy <- (correct_predictions/total_predictions)*100
cat("NB",nb_accuracy)