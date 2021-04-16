
#NipunAllurwar B2020031
library(arules)
library(arulesViz)

grocery <- read.transactions("Grocery.csv",sep = ',')

summary(grocery)

itemFrequencyPlot(grocery, topN=50)

View(grocery)
dim(grocery)

rules <- apriori(grocery, parameter = list(supp = 0.02,conf=0.0))

options(digits = 2)

inspect(rules)

inspect(sort(rules,by = 'lift'))

write(rules,file = 'grocery_rules.csv', sep=',')

plot(rules, method = "grouped")

plot(rules, method = "graph",control = list(type='item'),interactive = T)
