# Demographic analysis on ruchi dataset

library(gdata)
library(ggplot2)

dataset = read.xls('Ruchi 150.xlsx', sheet = 'Ruchi 150 Update')

dataset = dataset[, 2:8]
str(dataset)
head(dataset$Gender)
head(dataset$Income)

income = factor(dataset$Income, labels = c("Less than 10K",
                                           "10K to 20K",
                                           "20K to 30K",
                                           "30K to 40K",
                                           "More than 40K"))
expereince = factor(dataset$Experience, labels = c('Fresher', '1-5', '6-10', '11-15', 'More than 15'))
designation = factor(dataset$Desig, levels =  c('Lecturer', 'Asst.Prof',
                                                'Sr.Asst.Prof', 'Associate Prof',
                                                'Sr. Associate Prof', 'Professor'), 
                     labels = c('Lecturer', 'Assistant Professor', 
                                'Sr. Assitant Professor', 'Associate Professor', 
                                'Sr. Associate Professor', 'Professor'))

# Plotting the income group with respect to their gender
ggplot(dataset, aes(Gender, fill = income)) +
  geom_bar(stat = 'count') +
  xlab('Gender') + 
  labs(title = 'Gender Income')

# Plotting income equality with age group
ggplot(dataset, aes(Age, fill = income)) +
  geom_bar(stat = 'count') +
  xlab('Age Group') + 
  labs(title = 'Age Group Income')

# Plotting the designation with experience
ggplot(dataset, aes(designation, fill = expereince)) +
  geom_bar(stat = 'count') +
  xlab('Designation') + 
  labs(title = 'Designation vs Experience')

# Plotting Designation with Income
ggplot(dataset, aes(designation, fill = income)) +
  geom_bar(stat = 'count') +
  xlab('Designation') + 
  labs(title = 'Designation vs Income')

# Plotting Designation with Education
ggplot(dataset, aes(designation, fill = dataset$Education)) +
  geom_bar(stat = 'count') +
  xlab('Designation') + 
  labs(title = 'Designation vs Education')

# Workload with designation
g <- ggplot(dataset, aes(dataset$Workload)) + scale_fill_brewer(palette = "Spectral")

g + geom_histogram(aes(fill=designation), 
                   binwidth = .5, 
                   col="black", 
                   size=.1) + 
  xlab('Workload') +
  labs(title="Designation vs WorkLoad")  

# Box plot with workload and designation
g <- ggplot(dataset, aes(designation, dataset$Workload))
g + geom_boxplot(varwidth=FALSE, fill="#699ef4") + 
  labs(title="Designation vs Workload box plot",
       x="Designation",
       y="Workload")

# Income and Workload Plot
g <- ggplot(dataset, aes(dataset$Workload)) + scale_fill_brewer(palette = "RdBu")

g + geom_histogram(aes(fill=income), 
                   binwidth = .5, 
                   col="black", 
                   size=.1) + 
  xlab('Workload') +
  labs(title="Income vs WorkLoad")  

  
# Checking the workload between all the designations THIS WOULD PROBABLY BE EASIER TO PLOT IN PYTHON
# ggplot(dataset, aes(Gender, fill = income)) +
#   geom_bar(stat = 'count') +
#   xlab('Gender') + 
#   labs(title = 'Gender Income')





