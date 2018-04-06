# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employee <- paste("Employee",seq(1:100))
employee

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
init_salary <- round(runif(100,40000,50000),0)

# Create a vector of 100 salaries in 2018 that have changed from 2017
# Use `runif()` to add a random number between -5000 and 10000 to each of 2017's
# salaries (the negative number means that a salary may have decreased!)
new_salary <- init_salary + round(runif(100,-5000,10000),0)

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employee,init_salary,new_salary)

# Create a column 'change' that stores each person's change in salary between
# 2017 and 2018
salaries$change <- new_salary - init_salary

# Create a column 'got_raise' that is TRUE if the person got a raise (their
# salary went up)
salaries$got_raise <- salaries$change > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of employee 57
salaries[salaries$employee == "Employee 57", "new_salary"]

# How many employees got a raise?
nrow(salaries[salaries$got_raise == "TRUE",])

# What was the dollar value of the highest raise?
max(salaries$change)

# What was the "name" of the employee who received the highest raise?
salaries[salaries$change == "9966","employee"]

# What was the largest decrease in salaries between the two years?
min(salaries$change)

# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries$change == min(salaries$change),"employee"]

# What was the average salary change?
mean(salaries$change)

# For people who did not get a raise, how much money did they lose on average?
mean(salaries$change[salaries$change < 0])

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
##  yes, their values are near each other
# Write a .csv file of your salary data to your working directory
write.csv(salaries,'salaries.csv')
