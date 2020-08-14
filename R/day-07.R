#Zhongchang Yao
#August 13, 2020
#Daily Exercise #7

library(tidyverse)

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)

region = data.frame(state = state.name, region = state.region)

covid_region = covid %>%
  right_join(region, by = "state") %>%
  group_by(region, date) %>%
  summarize(cases  = sum(cases),
            deaths = sum(deaths)) %>%
  pivot_longer(cols = c('cases', 'deaths'))


ggplot(covid_region, aes(x = date, y = value)) +
  geom_line(aes(col = region)) +
  facet_grid(name~region, scale = "free_y") +
  theme_linedraw() +
  theme(legend.position = "bottom") +
  labs(title = "Cummulative Cases and Deaths: Region",
       y = "Daily Cumulative Count",
       x = "Date",
       caption = "Daily Exercise 07",
       subtitle = "COVID-19 Data: NY-Times" )

