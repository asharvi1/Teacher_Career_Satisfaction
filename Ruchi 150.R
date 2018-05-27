
library(ggplot2)
library(gdata)

dataset = read.xls('Ruchi 150.xlsx', sheet = 2)

dataset$Age = factor(dataset$Age, levels = c(1,2,3,4), ordered = TRUE)
age = dataset$Age
gender = factor(dataset$Gender, labels = c('Male', 'Female'))

# Plotting Age groups
ggplot(dataset, aes(age)) +
  geom_bar(stat = 'count') +
  xlab('Age Group') + 
  labs(title = 'Age Group Faculty Count')

# Plotting Age groups with gender
ggplot(dataset, aes(gender, fill = age)) +
  geom_bar(stat = 'count') +
  labs(title = 'gender plot with age group proportion')

education = factor(dataset$Education, labels = c('D.Lit', 'PhD', 'P.G', 'Degree', 'APSET', 'UGC-NET9'))

ggplot(dataset, aes(age, fill = education)) +
  geom_bar(stat = 'count') +
  labs(title = 'Age Group with Education Proportion')

ggplot(dataset, aes(gender, fill = education)) +
  geom_bar(stat = 'count') +
  labs(title = 'Gender with Education Proportion')

ggplot(dataset, aes(education)) +
  geom_bar(stat = 'count') +
  xlab('Education') +
  labs(title = 'Facuty Education')

