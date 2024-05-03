# install packages
# install.packages('BSDA')
# install.packages('onewaytests')
# install.packages('tigerstats')
# install.packages('misty')
# install.packages('nortest')
# install.packages('dplyr')

library('BSDA')
library('onewaytests')
library('tigerstats')
library('misty')
library('nortest')
library('dplyr')
library('tidyr')

load('./data/salarios.RData')

options(scipen = 999)

lillie.test(salarios$age)
lillie.test(salarios$husage)
# ambas as variáveis não possuem distribuição normal

ages_w <- sort(salarios$age)
ages_h <- sort(salarios$husage)

ages_combined <- data.frame(ages_w, ages_h) %>% pivot_longer(1:2, names_to = 'group', values_to = 'age_v')
ages_combined$group <- ages_combined$group %>% as.factor

result <- wilcox.test(age_v ~ group, data = ages_combined, exact = FALSE, conf.int = TRUE, paired = FALSE)
# p-value menor que 0.05, as medianas não são iguais (Rejeita-se H0)
print(result)

result_l <- wilcox.test(age_v ~ group, data = ages_combined, alternative = 'greater', exact = FALSE, conf.int = TRUE, paired = FALSE)
# p-value menor que 0.05, a mediana da idade das mulheres não é menor que a mediana da idade dos homens (Rejeita-se H0)
print(result_l)

result_g <- wilcox.test(age_v ~ group, data = ages_combined, alternative = 'less', exact = FALSE, conf.int = TRUE, paired = FALSE)
# p-value maior que 0.05, a mediana da idade dos homens é maior que a mediana da idade das mulheres (Não rejeita-se H0)
print(result_g)
