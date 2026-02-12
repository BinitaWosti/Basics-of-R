#importing data into R using csv/ importing a dataframe
getwd()
setwd("~/Binita/Techniques II/Codes")
my_dataframe <- read.csv("maizedata.csv")
print (my_dataframe) 
summary (my_dataframe) 
#making a dataframe
my_df <- data.frame (
  Maize_Lines = c(1:4),
  Height = c(100, 120, 125, 110),
  Dry_Weight = c(50, 55, 60, 52),
  Leaf_Length = c(70, 80, 85, 75)
)

print (my_df)
summary (my_df)

#viewing the dataframe/selecting rows and columns to view
my_df$Height
my_df$Dry_Weight
my_df$Leaf_Length
my_df [1,]
my_df [2,]
my_df [3,]
my_df [4,]
my_df [,1]
my_df [,2]
my_df [,3]
my_df [,4]
my_df [3,4]
my_df [2,3]
my_df [1,3]
my_df [1:3, 3:4]
my_df [1:2, 2:3]
my_df [2:3,1:2] 
my_df$HL <- my_df$Height/my_df$Leaf_Length
summary(my_df)


#creating vector using family names
family <- c("Mom", "Dad", "Binita", "Bipina", "Aaviskar")
#creating my own dataframe
My_people <- data.frame(
  name = family,
  age = c(47, 47,26, 19, 17),
  gender = c("F", "M", "F", "F", "M"),
  commute = c(100, 90, 20, 60, 50))
#average age
mean(My_people$age)

#average commute
mean(My_people$commute)

#youngest age
min(My_people$age)
max(My_people$age)
min(My_people$commute)
max(My_people$commute)

#conditional statement
#for equivalence/equal
1 == 1 
1 == 3 #wrong
"House" == "House"
"House" == "Cake" #wrong
4 < 7
4 <= 7
7 < 4 #wrong
7 <= 4
!(4 < 7) #negation
!(7 < 4)

#Test for multiple conditions 
#&- both condition should be true, |- either of the conditions should be true
var1 <- 1
var2 <- "red"
(var1 ==1) & (var2=="red")
(var1 ==1) & (var2 == "green")
(var1 == 1) | (var2 == "red")
(var1 == 1) | (var2 == "green")

#check dataframe/ show available dataset
data()

#Load the dataset
my_df <- women 
summary(my_df)

#shows the first few rows of dataframe
head(my_df)

#shows the type of object
class(my_df)

#Shows the structure of the data frame, including data types and a preview of the values.
str(my_df)

#shows the dimension of data frame (no. of row/column)
dim(my_df)

#shows/list the names of columns
names(my_df)

#data transformation- install package
#install.packages("dplyr")
install.packages("dplyr")
library(dplyr)

#pick observation by their values
filter(women, height < 60)

# Reorder the rows
arrange(women, weight)

#Pick variables by their names
select(women, height, weight)

#Create new variables with functions of existing variables
mutate(women, BMI = weight/height)

#Collapse many values down to a single summary
summarize(women,
          mean_weight = mean(weight),
          sd_weight = sd(weight),
          median_weight = median(weight))

#Chain multiple functions using the pipe operator
women %>% 
  mutate(BMI = weight/height) %>%
filter(height < 60) 

women %>% 
  mutate(BMI = weight/height) %>%
  filter(height < 60) %>%
  summarize(mean_weight = mean(weight),
             sd_weight = sd(weight),
             median_weight = median(weight))

women %>%
  group_by(weight) %>%
  summarise(mean_weight = mean(weight))

#download nycflights13/ already downloaded
#load the packages
library(nycflights13)
library(dplyr)

#View the dataframe
data()
flights
View(flights)

my_df <- flights #optional to assign own name
summary(my_df)
summary(flights)

#Using filter(), find all flights that departed in summer (July, August, and September) using OR operator (|)
filter(flights, month == 7 | month == 8 | month == 9)
#alternative way for filter
filter(flights, month %in% c(7:9))

#sort flights to find the most delayed flights
arrange(flights, desc(dep_delay))

#sort flights to find the earliest left flights
arrange(flights, (dep_delay))

#select- create a new dataframe that contains only the month, day, and departure times of all flights in the dataframe.
new_flights <- select(flights, month, day, dep_time)

#mutate - create a new column with the speed of each flight (distance/air_time*60).
mutate(flights,
       speed = distance/arr_time * 60)

#summarize -  group data by flight origin and assess the average delay of flights from this origin.
delays <- flights %>% 
  group_by(origin) %>%
  summarize(
    delay = mean(arr_delay, na.rm = TRUE)
  )

# to view/ to see the result
delays
print(delays)

#Activity: Process your data using dplyr
#Activity/creating my mydataframe
#creating vector
Home <- c("Mother", "Father", "Me", "Sis", "Bro") 


#creating my own dataframe
My_people <- data.frame(
  name = Home,
  Income = c(30, 80, 50, 10, 0),
  Expense = c(60, 30, 70, 50, 45))

#Variate/mutate- normal way
mutate(My_people, Saving = Income-Expense)
mutate(My_people, income_expense_ratio = Income/Expense)

#variate/mutate using pipe operator
My_people %>%
  mutate(Saving = Income - Expense)

My_people %>%
  mutate(income_expense_ratio = Income/Expense) 

My_people %>% 
  mutate(Saving = Income - Expense) %>%
  mutate(income_expense_ratio= Income/Expense)

#Include filter also
My_people %>% 
  mutate(Saving = Income - Expense) %>%
  mutate(income_expense_ratio = Income/Expense) %>%
filter(Income > 40) 
   

My_people %>% 
  filter(Income > 40) %>%
  mutate(Saving = Income - Expense) %>%
  summarize(mean_income = mean(Income),
            mean_expense = mean(Expense))

#View updated dataframe 
head(My_people) #didn't show the updated version- updated temporarily before

#need to assign the variate/ to permanently add in the column
My_people <- My_people %>%
  mutate(Saving = Income - Expense,
         income_expense_ratio = Income / Expense)

#View updated dataframe how it looks - shown
head(My_people)
str(My_people)
summary(My_people)

#Save updated dataframe 
write.csv(My_people, file="My_people_updated.csv", row.names = TRUE)
