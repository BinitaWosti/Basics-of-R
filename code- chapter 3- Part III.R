#Basic Data Visualization
#Customizing base R plots
my_people <- data.frame(  
  name = c("Lee", "Smith", "Johnson", "Brown", "Davis"),  
  age = c(28, 34, 25, 30, 27),  
  gender = c("male", "male", "male", "female", "female"),  
  commute = c(30, 45, 20, 35, 25))

#make plot-from class example
plot (my_people$age, my_people$commute)

#Activity: Customizing base R plots- class example
plot(my_people$age, my_people$commute,     
     xlab = "Age",      
     ylab = "Commute",     
     main = "Age vs Commute",     
     pch = ifelse(my_people$name == "Lee", 19, 15),     
     col = ifelse(my_people$name == "Lee", "red", "green"))  

#creating legend and assigning them color and shape-class example
legend("bottomright", c("Lee", "Others"),        
       col = c("red", "green"),        
       pch = c(19, 15))

#Create own dataframe/load data
my_people <- data.frame(  
  name = c("Parbati", "Lekh", "Binita", "Bipina", "Aaviskar"),  
  age = c(47, 47, 26, 19, 17),  
  gender = c("female", "male", "female", "female", "male"),  
  commute = c(30, 45, 20, 35, 25))

#Plot 2 variables
plot(my_people$age, my_people$commute)

#nominal variables cannot be used for making plot (does not work) 
plot(my_people$gender, my_people$commute)

#"main" - for title
#pch- for position of shape, col= for color
#customize R plots
plot(my_people$age, my_people$commute,     
     xlab = "Age",      
     ylab = "Commute",     
     main = "Age vs Commute",     
     pch = ifelse(my_people$name == "Binita", 19, 15),     
     col = ifelse(my_people$name == "Binita", "red", "green")) 

#creating legend and assigning them color and shape
legend("bottomright", c("Binita", "Others"),
col = c("red", "green"),
pch = c(19, 15))

#scatter plot & correlation
#create scatter plot #x=mtcars- built in data frame
scatter.smooth(x=mtcars$mpg, y=mtcars$disp, main="Disp ~ mpg")

#view some rows
head(mtcars)

#Test for a correlation between two variables(miles per gallon and engine displacement)- 
#perform pearson correlation test
cor.test(mtcars$mpg, mtcars$disp) 

#Save and check test results
#Runs same correlation test again & stores all results in the object cor_result for later use
cor_result <- cor.test(mtcars$mpg, mtcars$disp)

#extracts the correlation coefficient (r) from the saved test result.
cor_result$estimate

#extracts p value
cor_result$p.value 

#view correlation between many variables
#install corrplot
install.packages("corrplot")
library("corrplot")

#computes and visualize correlation matrix plot
corrplot(cor(mtcars))
head(mtcars)

#add more options for practice (?corrplot)
(?corrplot)

#Activity Correlation test - Pick any available dataframe containing multiple variables (columns)
data()

#load the dataset
data("iris")

#check the first few rows
head(iris)

#Plot correlation for all variables
#cor() only works on numeric data.
corrplot(cor(iris)) #this does not work if there is non-numeric data, so,

#For non numeric data
numeric_iris <- iris[, sapply(iris, is.numeric)]
corr_matrix <- cor(numeric_iris)
corrplot(corr_matrix)

#check correlation coefficient- 1
cor_result <- cor.test(numeric_iris$Sepal.Length,
                       numeric_iris$Petal.Length)

cor_result$estimate
cor_result$p.value

#check correlation coefficient- 2
cor_result <- cor.test(numeric_iris$Sepal.Width,
                       numeric_iris$Petal.Width)

cor_result$estimate
cor_result$p.value

#check correlation coefficient- 3
cor_result <- cor.test(numeric_iris$Sepal.Length,
                       numeric_iris$Sepal.Width)

cor_result$estimate
cor_result$p.value

#check correlation coefficient- 4
cor_result <- cor.test(numeric_iris$Petal.Length,
                       numeric_iris$Petal.Width)

cor_result$estimate
cor_result$p.value

# Plot strongly correlated variables
scatter.smooth(
  x = numeric_iris$Petal.Length,
  y = numeric_iris$Petal.Width,
  main = "Petal Length vs Petal Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)"
)

#T-test
#Conduct t-test (test for difference in means between two groups)
#Formula: t.test (extra ~ group, data = sleep)	# test group 1 vs 2
t.test (extra ~ group, data = sleep)

#Hypothesis testing: t.test(trees$Girth, mu = 5) 	# test mean vs 5
t.test(trees$Girth, mu = 5)

#Activity: T-test using own dataframe
#creating vector
Student <- c("Binita", "Arsh", "Binj", "Ari", "Kitty", "Pakku", "Anu", "Deo", "Ean", "Sam")

#creating my  dataframe
Student <- data.frame(
  Income = c(30, 80, 50, 55, 52,40, 35, 42, 48, 58),
  Expense = c(60, 30, 70, 62, 58, 45, 56, 61, 80, 25))

  
#perform t-test
  t_test_result <- t.test(Student$Income, Student$Expense)
  
#display the result
  print(t_test_result)
  
#show only p-value
  t_test_result$p.value
  
#ANOVA  
#Conduct ANOVA (test for difference in means between more than two groups)
  res_aov <- aov(weight ~ group, data = PlantGrowth)
  
#view ANOVA table
  summary(res_aov)
 
#Tukey Test: TukeyHSD(res_aov)
  TukeyHSD(res_aov)
  
#Activity-ANOVA
#Make a new dataframe containing 3 groups- at least 10 observations each
#rnorm(30)- random normal data
  data2 <- data.frame(
    data = rep(c("Group1", "Group2", "Group3"), each = 10),
    value = rnorm(30)) 
  
#display first few row
  head(data2)
  
#perform ANOVA
  res_aov2 <- aov(value ~ data, data = data2)
  
#display the ANOVA result
  summary(res_aov2)
  
#perform Tukey HSD test
  Tukey_result <- TukeyHSD(res_aov2)
  
#Display Tukey test result 
  print(tukey_result)
  
#Simple and Multiple Linear Regression
#Simple Linear Regression
  linear_mod <- lm(dist ~ speed, data=cars)
  
#Multiple Linear Regression
  linear_mod2 <- lm(mpg ~ disp + qsec, data=mtcars)  
  
#summary of Multiple Linear Regression
  summary(linear_mod2)
  
#Activity: Simple Statistics
#Examine dataset
data()
data(Orange)

#See the dataset
head(Orange)
str(Orange)

#Choose a dataset and ask a testable question using the data
##Simple Linear Regression #multiple linear regression not possible bcz only 2 variables
linear_mod <- lm(age ~ circumference, data=Orange) 


#summary of simple linear regression model
summary(linear_mod)

#Create a plot for my chosen hypothesis
corrplot(cor(Orange)) #doesnot work bcz of having non-numeric data also

#so, use this- basic scatter plot
plot(Orange$age, Orange$circumference,
     xlab = "Age (days)",
     ylab = "Circumference (mm)",
     main = "Effect of Age on Orange Tree Circumference")

#scatter plot + smooth curve
scatter.smooth(Orange$age, Orange$circumference,
     xlab = "Age (days)",
     ylab = "Circumference (mm)",
     main = "Effect of Age on Orange Tree Circumference")

#scatter plot + smooth curve- slightly alternative way
scatter.smooth(
  x = Orange$age,
  y = Orange$circumference,
  main = "Effect of Age on Orange Tree Circumference",
  xlab = "Age (days) (cm)",
  ylab = "Circumference (mm)")

#Activity- Simple statistics
data()
data(mtcars)
head(mtcars)

#convert am to a factor
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

#perform t-test to compare the means of mpg for cars with automatic and manual transmissions
t.test(mpg ~ am, data = mtcars)

#create boxplot
boxplot(mpg ~ am, data = mtcars, 
        main = "MPG by Transmission Type",      
        xlab = "Transmission Type",      
        ylab = "Miles Per Gallon (mpg)",      
        col = c("blue3", "orange2"))
