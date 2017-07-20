#######################################################################
## This example is based on 'R for Marketing Research and Analytics' ##
## by Chris Chapman and Elea McDonnel Feit                           ##
#######################################################################

# tidyverse is a combo pack which includes lots of useful packages such as readr, stringr, ggplot2,
# tibble, rvest, dplyr, ..., so basically install one, enjoy all.
install.packages('tidyverse')

# import package
require(readr)
require(ggplot2)

# download data from the website and load it.
cust.df <- read_csv("http://goo.gl/PmPkaG")

### Supposedly this is the customers record data of chain retail store system.  
### Check quick description of each variable of data 'cust.df'
# cust.id: the serial number of every individual customer.
# age: the age of each customer.
# credit.score: the credit score of each customer.
# email: the emailbox address.
# distance.to.store: the distance from customer home to the nearest store. 
# online.visits: times of online visit.
# online.trans: times of online shopping if online visit.
# online.spend: sum of spend of all online shopping.
# store.trans: times of store shopping.
# store.spend: sum of spend of all store shopping.
# sat.service: each customer satisfaction about service.
# sat.selection: each customer satisfaction about product selection.
# take quick view to understand the stats summary and structure of the data
# summary() is a base R function. Providing rough view of data for users like extremum, mean, quartile. 
summary(cust.df)

# str() is a function from the R Utils Package. Providing a quick view to understand the data type and 
# structure of each column(variable).
str(cust.df)

# another useful function to view structure of data is 'describe()'
# install package 'psych' before using it.
install.packages('psych')

# import it and use describe() to view data
library(psych)
describe(cust.df)

# use ggplot2 plot function to plot a basic scatter plot to explore the relationship between two variables.
ggplot(data=cust.df, aes(age, credit.score, color=sat.service)) + geom_point()

p <- ggplot(data=cust.df, aes(age, credit.score))
p <- p + geom_point()
p <- p + aes(color=sat.service)


# set more plot options in order to easily understand.
p <- p + labs(x="Customer Age (years)")
p <- p + labs(y="Customer Credit Score")
p <- p + labs(title="Active Customers as of June 2014")  
p <- p + labs(colour="Satisfaction about Service")



# adds horizontal and vertical straight lines through the current plot as auxiliary
p <- p + geom_hline(yintercept=mean(cust.df$credit.score))
p <- p + geom_vline(xintercept=mean(cust.df$age), color="dark blue", linetype="dotted")

# Let's consider a general scenario. Is it negative correlated between online.spend and store.spend?
# Which means customer will buy less in store if more online purchase.
ggplot(data=cust.df, aes(x=store.spend, y=online.spend, color=sat.service)) + 
  geom_point() + 
  labs(title="Customer as of June 2014", 
       x="Prior 12 months in-store sales ($)", 
       y="Prior 12 months online sales ($)",
       colour="Satisfaction about Service")
