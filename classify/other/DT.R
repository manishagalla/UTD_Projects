library(rpart)

tae <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/tae/tae.data", header=FALSE)
colnames(tae) <- c('native_speaker','instructor','course','semester','size','class')
tae_data <- as.data.frame(tae)

maxs <-	apply(tae_data,	MARGIN	=	2,	max)
mins <- apply(tae_data, MARGIN=2,min)
instances <- sample(1:nrow(tae),size=0.8*nrow(tae))
scaled =	 as.data.frame(scale(tae_data,	center	=	mins,	scale	=	maxs	- mins))
trainInstances <- scaled[instances,]
trainInstances <- na.omit(trainInstances)
testInstances <- scaled[-instances,]
testInstances <- na.omit(testInstances)

n <- names(trainInstances)
f <- as.formula(paste("class	~",	paste(n[!n	%in%	"class"],	collapse	=	"	+	")))
fit <- rpart(f,  data = trainInstances,  method="class",parms	=	list(split	=	"information"))
pred <- predict(fit,testInstances, type="class")
pruneDT <- prune(fit,cp=fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"])
predicted_value <- predict(pruneDT,testInstances, type="class")
actual_value <- testInstances[,as.integer(ncol(scaled))]
cmpr <- cbind(predicted_value,actual_value)
correct_predictions <- length(cmpr[predicted_value==actual_value])/2
total_predictions <- length(cmpr)/2
accuracy <- (correct_predictions/total_predictions)*100
cat("accuracy:",accuracy)


nn <-neuralnet(f, data=trainInstances,hidden=4,threshold = 0.1)
#plot(nn)
nn$result.matrix
test_nn <- subset(testInstances,select = c(paste(c(n[!n %in% colnames(trainInstances)[as.integer(ncol(tae_data))]]))))
pred <- compute(nn,test_nn)
pred_scaled <- pred$net.result*(max(tae_data$class)-min(tae_data$class))+min(tae_data$class)
real_scaled	<- (testInstances$class)*(max(tae_data$class)-min(tae_data$class))+min(tae_data$class)
output_nn <- data.frame(actual = real_scaled,prediction= pred_scaled)
accuracy_nn <- sum(output_nn[,2]==output_nn[,1])/nrow(testInstances)
#cat("NN",accuracy_nn*100)

