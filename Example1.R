# Author - Steve Markham - 28 August 14
# Example of Simple Analysis of Data using base r

# The Load data r sript needs to be run first to get results

# Common Pipistrelle and Noctule Bat passes per night 
# Recorded in the middle of a field and next to a hedge
# Bat passes/day recorded

# Load data into r vectors 
# Common Pipistrelle
Common.Field <- c(2, 2, 0, 17, 4, 4, 3, 11, 1, 9)
Common.Hedge <- c(10, 1, 5, 2, 11, 6, 13, 16, 20)

# Noctule
Noctule.Hedge <- c(9, 1, 1, 3, 3, 8, 8, 0, 17)
Noctule.Field <- c(1, 2, 1, 1, 4, 9, 12, 12, 0)

# Calulate Mean bat passes for the Field and Hedge
# Common Pipistrelle
mean(Common.Field)
mean(Common.Hedge)
# Noctule
mean(Noctule.Field)
mean(Noctule.Hedge)

# Median for Field and Hedge
# Common Pipistrelle
median(Common.Field)
median(Common.Hedge)
# Noctule
median(Noctule.Field)
median(Noctule.Hedge)

# Display data with a Boxplot (run one boxplot at at time)
# Common Pipistrelle
boxplot(Common.Field, Common.Hedge, names=c("Field", "Hedge"), ylab="Bat passes/day", main="Common Pipistrell")

# Noctule
boxplot(Noctule.Field, Noctule.Hedge, names=c("Field", "Hedge"), ylab="Bat passes/day", main="Noctule")

# Is the data normal? Check using Shapiro-Wilk test 
# if p.value <0.05 accept as normal (the p.value for both field and hedge data need to be <0.05)
# Common Pipistrelle
shapiro.test(Common.Field)
shapiro.test(Common.Hedge)
# Noctule
shapiro.test(Noctule.Field)
shapiro.test(Noctule.Hedge)

# Mann- Whitney U-test

# The Mann-Whitney U-test is a non-parametric technique for comparing the medians of two unmatched samples. 
# It may be used with as few as four observations in each sample. 
# The sample size can be unequal.
# The values of observations are converted to their ranks. 
# The test is  distribution-free and is suitable for data which is not normally distributed. 


# The question - Is the Field and Hedge activity for the Common Pipistrelle or Noctule the same?

# Null hypothesis- Field and Hedge bat activity (as measured by passes per day) come from distributions with the same median.
# Alternative hypothesis - Field and Hedge bat activity come from distributions with a different median.


# Common Pipistrelle
wilcox.test(Common.Field, Common.Hedge, exact=FALSE)

# Noctule
wilcox.test(Noctule.Field, Noctule.Hedge, exact=FALSE)


# If the resulting p-value is <0.05  you to reject the null hypothesis: i.e. Field and Hedge do not have similar levels of bat activity.

# If the resulting p-value is >0.05  you cannot reject the null hypothesis: i.e. Field and Hedge do have similar levels of bat activity.
