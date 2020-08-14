#Zhongchang Yao
#Aug 12,2020
#Exercise 6

library(tidyverse)

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'

covid = read_csv(url)

Question1

covid%>%
+ filter(date == max(date))%>%
+ group_by(state)%>%
+ summarize(cases = sum(cases, na.rm = TRUE))%>%
+ ungroup()%>%
+ slice_max(cases, n = 6)%>%
+ pul(state)->
  top_states

covid%>%
+ filter(state %in% c("California", "Florida", "Texas", "New York", "Georgia", "Illinois")) %>%
+ ggplot(aes(x = date, y = cases)) +
+ geom_line(aes(color = state)) +
+ facet_wrap(~state)

Question2
covid %>%
+ group_by(date) %>%
+ summarize(cases = sum(cases)) %>%
+ ggplot(aes(x = date, y = cases)) +
+ geom_col(fill = "darkred", color = "darkred", alpha = .25) +
+ geom_line(color = "darkred", size = 3) +
+ labs(title = "National Cummulative Case Counts",x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")

