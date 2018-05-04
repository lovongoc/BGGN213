Functions again
===============

We can source any file of R code with the 'source()' function.

    source("http://tinyurl.com/rescale-R")

Let's make sure things are here

    ls()

    ##  [1] "both_na"         "both_na2"        "both_na3"       
    ##  [4] "df1"             "df2"             "df3"            
    ##  [7] "gene_intersect"  "gene_intersect2" "gene_intersect3"
    ## [10] "gene_intersect4" "rescale"         "rescale2"

Check our 'rescale()' function is working

    rescale(0:10)

    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

    rescale(c(0:10,NA))

    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0  NA

use {r,eval=FALSE} to knit through the error

    rescale( c(1:10,"word"))

### Revisit 'rescale()', with warning() and stop(): rescale2

Add an if() condition to check if x is numeric with 'is.numeric()'.

    is.numeric(c(1:10,NA))

    ## [1] TRUE

    is.numeric(c(1:10,"word"))

    ## [1] FALSE

    !is.numeric(1:10)

    ## [1] FALSE

test rescale2()

    rescale2(c(0:10,NA))

    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0  NA

    rescale2(c(0:10,"word"))

\#\#\#both\_na() function

    x <- c(1:3, NA, NA)
    y <- c(3, 4, 5, NA, 2)
    both_na(x, y)

    y2 <-  c(3, 4, 5, NA, 2, NA)
    both_na(x, y2)

    x <- c(1:3, NA, NA)
    y <- c(3, 4, 5, NA, 2)
    both_na3(x,y)

    ## Found 1 NA's at position(s):4

    ## $number
    ## [1] 1
    ## 
    ## $which
    ## [1] 4

### gene\_intersect()

    x <- df1$IDs
    y <- df2$IDs
    x

    ## [1] "gene1" "gene2" "gene3"

    y

    ## [1] "gene2" "gene4" "gene3" "gene5"

    intersect(x,y)

    ## [1] "gene2" "gene3"

    x %in% y

    ## [1] FALSE  TRUE  TRUE

We can use the logical output in '%in%' to get at our matching data

    x[ x %in% y]

    ## [1] "gene2" "gene3"

    y[ y %in% x]

    ## [1] "gene2" "gene3"

Let's put these together as columns of a matrix

    cbind(x[x %in% y], y[y %in% x])

    ##      [,1]    [,2]   
    ## [1,] "gene2" "gene2"
    ## [2,] "gene3" "gene3"

    cbind(c("bla","blou"), c("cra","crou"))

    ##      [,1]   [,2]  
    ## [1,] "bla"  "cra" 
    ## [2,] "blou" "crou"

    rbind(c("bla","blou"), c("cra","crou"))

    ##      [,1]  [,2]  
    ## [1,] "bla" "blou"
    ## [2,] "cra" "crou"

Use prewritten gene\_intersect() on x and y

    gene_intersect(x,y)

    ##      [,1]    [,2]   
    ## [1,] "gene2" "gene2"
    ## [2,] "gene3" "gene3"

Use gene\_intersect2() this time, which returns the expression data as
well.

    gene_intersect2(df1,df2)

    ##     IDs exp df2[df2$IDs %in% df1$IDs, "exp"]
    ## 2 gene2   1                               -2
    ## 3 gene3   1                                1

Make the output look better with gene\_intersect3()

    gene_intersect3(df1,df2)

    ##     IDs exp exp2
    ## 2 gene2   1   -2
    ## 3 gene3   1    1

Make the code look clearer with gene\_intersect4() (make it obviously
correct)

Use the 'merge()' function

    ?merge
    merge(df1, df2)

    ##     IDs exp
    ## 1 gene3   1
