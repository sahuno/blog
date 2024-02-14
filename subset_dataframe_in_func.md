
# subset data frames in a function
```
test_func <- function(data_in, x_var, y_var){
    last_level <- tail(levels(data_in[[x_var]]), 1)
    first_level <- head(levels(data_in[[x_var]]), 1)
    print(first_level)
}

test_func(data_in=methyl_rate_dt_rlog, x_var="ntile", y_var=NULL)
```