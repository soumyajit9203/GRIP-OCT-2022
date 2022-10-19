Task1-Prediction of percentage of a student on the number of study hours (supervised ML)
We have to predict the percentage of a student based on the number of study hours.As a result we have to bulid a regression model which will predict the percentage of a student on the number of study hours. 
Here Scores refers to the percentage of marks obtained by the student and Hours refers to the number of hours a student studies in a day.
We first load the data set for our work and then read the dataset.
#loading the data 
data<-read.csv('http://bit.ly/w-data',header=T)
#Now we have to know about the data to do the Analysis or Prediction.
dim(data)#the dimensions of the dataset.
head(data)#a brief preview of the dataset.
names(data)#column names of the dataset
Now we plot scatterplot of the data to observe  if there's any visible correlation between the variables Scores and Hours.
#Plotting the distribution of the scores
plot(data$Hours,data$Scores,
     xlab="Hours studied",ylab="Precentage Score",
     main="Hours vs. Percentage")
legend(x=1,y=95,'Scores',pch=16)
From the scatterplot we can see that  the relation between the number of hours studied and percentage of score is  linear. 
Based on the observations from the scatterplot we proceed to fit a linear regression model.
## The linear regression model:

Now,we divide the data into two parts randomly- referring one to train data and the other to test data. We divide the data into 4:1 ratio.That is 80% data for traing set and 20% data for test set to get the better predictions.
x=data$Hours ; y=data$Scores 
rsample=sample(nrow(data),floor(0.8*nrow(data)),replace=F)
xtrain=x[rsample];ytrain=y[rsample]
xtest=x[-rsample];ytest=y[-rsample]
Now we have to fit a linear regression model to the train data:
model=lm(ytrain~xtrain,data=data)
summary(model)
With the help of R, the linear regression model has come out to be :
      Scores=4.1436 + 9.4468 Hours
the value of Adjusted R-squared for the above regression model is 0.9421  which is high.
That is, the above linear regression model explains  the total variation in Scores due to the number of hours of studying by a student very well. 
Since the Adjusted R-squared is very high we can say that the fit is good.
##ploting of the fitted model with the scatterplot of the data set 
plot(data$Hours,data$Scores,
     xlab="Hours studied",ylab="Precentage Score",
     main="Hours vs. Percentage")
legend(x=1,y=95,'Scores',pch=16)
abline(model,col="red")
Here the redline is the regression line which is passes through the data points.
Now we test this model on our test data.
Now its time to make comparison between the observed vales for test data set and predicted values on test data set using the linear model.
ypred=predict(model,newdata=data.frame(xtrain=xtest))
ypred
df=data.frame("Hours"=xtest,"Actual Score"=ytest,"Predicted Score"=ypred)
df
from the above table we can see that the difference between actual/observed values and the Predicted values using the linera model is less.
so we can say that our linear model is not bad in the context of prediction.
Now we have to predict the score of a student who studied for 9.25 hrs.
pred=predict(model,newdata=data.frame(xtrain=9.25))
x=data.frame("Hours"=9.25,"Predicted Score"=pred)
x
That is, if a student studies 9.5 hours per day then he/she can be expected to score approximately 91.53% in the exam.

With that the first task of my data science and business analytics internship is completed.