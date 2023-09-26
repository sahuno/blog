#name: samuel ahuno
#how do quotign work in R base, tidyverse and dplyr
#tidyverse - use `{{var_name}}` while within the function to get col names
#data.table - use `get(var_name)` while within the function to get col names

library(tidyverse)
library(dplyr)



#### generate random numbers
random_numb_generator = function(x, numb=25){
    treatment_x1 = runif(n=numb, min=-5, max=5)
    treatment_x2 = runif(n=numb, min=0, max=5)
    return(cbind(treatment_x1,treatment_x2))
}

n_unique_samples <- 5
ls <- lapply(1:n_unique_samples, random_numb_generator, numb=25)

# convert list to dataframe 
df <- do.call(data.frame, ls)


##rename columns of data frame
names_raw <- c(paste0("treatment_", letters[1:n_unique_samples],1:2),
paste0("treatment_", letters[1:n_unique_samples],c(2,1)))
names(df) <- sort(names_raw)

#add tag 
df <- df %>% mutate(gene.symbol = paste0("gene", row_number()))


plot_exp <- function(dat_in, y_var, labels_col){
    y_var <- enquo(y_var)
    y_var_name = quo_name(y_var)
  #enquo variables
  # labels_col <- enquo(labels_col)
  # #y_var_sym <- ensym(y_var)
  # y_var <- enquo(y_var)
  # ggsave_tag <- quo_name(y_var)
  #multiple_vars <- enquos(...)
  # print(paste0("enquo - y_var -> ",y_var))
  # print(paste0("quo_name - y_var -> ",ggsave_tag))
# print("{{labels_col}}")
  #mutate df to allow plotting
dat_log2 <- dat_in %>% mutate(labels = case_when({{labels_col}} >= abs(2) ~ as.character(gene.symbol),
                                                TRUE ~ ""),
                              color_codes = case_when(labels == "" ~ "Log2FC_below2",
                                                TRUE ~ "Log2FC_above2")) %>% 
                                                select(c({{y_var}}, {{labels_col}}, labels, color_codes, gene.symbol))

#head(dat_log2)
print(paste0("/path/to/save/",{{y_var_name}},".pdf"))
return(dat_log2)
}

#test function
plot_exp(dat_in=df, y_var=treatment_a2, labels_col=treatment_a1)




#create separate vectors
col1 <- sort(names_raw)[str_detect(sort(names_raw),"1")]
col2 <- sort(names_raw)[str_detect(sort(names_raw),"2")]

map2(col1,col2, ~paste0(.x, .y))
map2(col1,col2, ~plot_exp(dat_in=df, y_var=!!sym(.x), labels_col=!!sym(.y))) #this works 

#map2(col1,col2, ~plot_exp(dat_in=df, y_var=all_of(.x), labels_col=all_of(.y))) # this doesnot work