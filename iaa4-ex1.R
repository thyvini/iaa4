# install packages
# install.packages('car')
# install.packages('fdth')

library(car)
library(fdth)

load('./data/salarios.RData')

# charts
Boxplot(~ age + husage, names = c('Mulheres', 'Homens'), data = salarios, id = list(method='y'), ylab = 'Idades')

hist(salarios$age, main = 'Histograma da Idade das Mulheres', xlab = 'Idade', ylab = 'Frequência')
hist(salarios$husage, main = 'Histograma da Idade dos Homens', xlab = 'Idade', ylab = 'Frequência')

# frequency tables
ageTable <- fdt(salarios$age)
print(ageTable)

husageTable <- fdt(salarios$husage)
print(husageTable)
