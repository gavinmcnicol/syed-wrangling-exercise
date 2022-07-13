# e-04 solutions

### Exercise 2.

catch_data %>%
  filter(
    lake == "Michigan",
    region == "U.S. Total"
  ) %>% 
  slice_max(
    order_by = values, 
    n = 5
  )

### Exercise 3.

catch_data %>%
  filter(
    region == "U.S. Total",
    year >= 1950
  ) %>% 
  arrange(desc(values)) %>% 
  slice(1:5) %>% 
  select(year, species, values)

### Exercise 4.

catch_data_us %>% 
  filter(
    lake == "Michigan",
    year == 2015 | year == 1975
  ) %>% 
  arrange(desc(values)) %>% 
  select(year, species, values) 


catch_data_us %>% 
  filter(
    lake == "Michigan",
    year == 2015 | year == 1975
    ) %>% 
  arrange(desc(values)) %>% 
  select(year, species, values) %>% 
  pivot_wider(names_from = "year",
              values_from = "values")

### Exercise 7.

catch_data_us %>% 
  filter(
    species == "Chinook Salmon",
    lake == "Michigan"
  ) %>% 
  summarize(
    minimum = min(values, na.rm = TRUE),
    mean = mean(values, na.rm = TRUE),
    median = median(values, na.rm = TRUE),
    maximum = max(values, na.rm = TRUE)
  )

### Exercise 8.

catch_data_us %>% 
  filter(
    lake == "Michigan",
    species == "Chinook Salmon",
    values == 57
  ) 

### Exercise 9.

catch_data_us %>% 
  filter(
    lake == "Michigan",
    year %in% c(1975, 1985, 1995, 2005, 2015)
  ) %>% 
  group_by(year) %>% 
  summarize(total_catch = sum(values, na.rm = TRUE))

### Exercise 10.

catch_data_us_v2 <- catch_data_us %>% 
  filter(
    lake == "Michigan",
    year %in% c(1975, 1985, 1995, 2005, 2015)
  ) %>% 
  group_by(year) %>% 
  summarize(total_catch = sum(values, na.rm = TRUE))


