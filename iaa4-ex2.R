load('./data/salarios.RData')

# Mean, Median, Mode
ageMean <- mean(salarios$age)
print(ageMean)
ageMedian <- median(salarios$age)
print(ageMedian)
ageMode <- subset(table(salarios$age), table(salarios$age) == max(table(salarios$age)))
print(ageMode)

husageMean <- mean(salarios$husage)
print(husageMean)
husageMedian <- median(salarios$husage)
print(husageMedian)
husageMode <- subset(table(salarios$husage), table(salarios$husage) == max(table(salarios$husage)))
print(husageMode)

# Var, SD, VC
ageVar <- var(salarios$age)
print(ageVar)
ageSd <- sd(salarios$age)
print(ageSd)
ageVc <- (sd(salarios$age) / mean(salarios$age)) * 100
print(ageVc)

husageVar <- var(salarios$husage)
print(husageVar)
husageSd <- sd(salarios$husage)
print(husageSd)
husageVc <- (sd(salarios$husage) / mean(salarios$husage)) * 100
print(husageVc)
