votes_US <- read.csv("data/votes_simi_US.csv")

year_list<-c(1960:2020)
country_group <- read.csv("data/countrygroup_treeorder.csv")
country_geo <- country_group %>% filter(GroupCate=="Geo group")
country_geo_sort <- country_geo %>% arrange(Country)
geo_group <- country_group %>% 
  filter(GroupCate=="Geo group") %>% 
  distinct(Subgroup) %>% pull() %>% append("All")

country_income <- country_group %>% filter(GroupCate=="Income group")
income_group <- country_group %>% 
  filter(GroupCate=="Income group") %>% 
  distinct(Subgroup) %>% pull() %>% append("All")


vote_body <- c("UNGA", "UNSC", "UNHRC")
issue_area <- c("All", "HR", "NU", "ME", "DI", "EC")

###
votes_US_year <- votes_US[votes_US$Year==2017,] %>% 
  e_country_names(., Country, type='country.name') %>%  na.omit()

votes_US_year_map <- votes_US_year  %>%  
  e_charts(Country) %>% 
  e_map(percent) %>% 
  e_visual_map(percent)

ts_test <- mtcars %>%
  e_charts(qsec) %>%
  e_line(mpg)