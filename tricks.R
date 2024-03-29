# Initalize R Markdown File
---
title: "Project Title"
subtitle: "Project Subtitle"
author: "Anthony Federico"
date: "Last Modified: `r Sys.Date()`"
output:
  html_document:
    theme: united
    toc: yes
    toc_float: true
    toc_depth: 1
    code_folding: hide
    df_print: paged
---

```{r global, echo=FALSE}
knitr::opts_chunk$set(message=FALSE, warning=FALSE)
```

# CHUNK OPTIONS knitr
{..., eval = TRUE} # whether to evaluate the code chunk, it can also be numeric vector selecting which expression inside the chunk is executed c(1,3,4) or -(4:5)
{..., echo = FALSE} # hide code, it can also be numeric vector selecting which expression inside the chunk is executed c(1,3,4) or -(4:5)
{..., results='asis'} # output as text (instead of as console output), also "markup" (Sweave verbatim), "hide"
{..., warning = T} # preserve warnings? warning()
{..., error = T} # preserve errors? stop()
{..., message = T} # preserve messages? message()
{..., split = F} # split output into separate files?
{..., include = T} # execute it but include (or not) the chunk output in the final document (for example, generate the images)
{..., engine="bash"} # execute bash, python, awk, ruby, instead of R

# CHUNK OPTIONS code
{..., tidy = T} # tidy up R code
{..., comment=""} # remove any preceding text from console output, default =="##"
{..., prompt = F} # show prompt chars
{..., highlight = T} # highlight the source code?
{..., size='normalsize'} # default latex font size
{..., background='#F7F7F7'} # default latex background color

# CHUNK OPTIONS cache
{..., cache = TRUE} # only run the first time, delete the contents of the cache folder to rerun everything
{..., cache.path='cache/'} # cache dir
{..., dependson = NULL} # char vector of chunk labels (or numeric)

# Concat file path with file name
source(file.path(path.to.dir, "file.R"))

# Scatter plot with correlation statistics
scatter.plot = function(df, x_, y_, xlab_="", ylab_="") {
  r = cor.test(x_, y_)
  text = paste('\n', strrep(" ", 20), 'cor = ', round(r$estimate, 5), '\n', 
               strrep(" ", 20), 'pval = ', round(r$p.value,5 ), sep="")
  minx = min(x_, na.rm = TRUE)
  maxy = max(y_, na.rm = TRUE)
  p1 = ggplot(df, aes(x=x_, y=y_)) +
    geom_point(shape = ".", na.rm=TRUE) + 
    geom_smooth(method=lm, na.rm=TRUE) +
    xlab(xlab_) +
    ylab(ylab_) +
    annotate("text", x=minx, y=maxy, label=text, size = 3)
  p1
}

# Install package from github
library(devtools)
install_github("username/repository")

# Get and set env variables in R
Sys.getenv("envar")
Sys.setenv(envar="")

# Knit markdown files on SCC
$SCC_PANDOC_DIR # Get the output of this
module load pandoc/2.2.1
module load R/3.4.2; R
Sys.setenv(RSTUDIO_PANDOC="/share/pkg/pandoc/2.2.1")
rmarkdown::render('markdown.file.Rmd')

# Install package to specific directory
# From Github
withr::with_libpaths(new="/usr3/graduate/anfed/R_pkgs/", install_github("username/repository"))
# From Cran/Bioconductor
withr::with_libpaths(new="/usr3/graduate/anfed/R_pkgs/", install.packages("package"))
# From source
withr::with_libpaths(new="/usr3/graduate/anfed/R_pkgs/", install.packages("/usr3/graduate/anfed/R_src/package.tar.gz", type="source"))
# Load it
library(package, lib.loc="/usr3/graduate/anfed/R_pkgs/")

# Apply function to a list
is.this <- function(x) {
  if (x == this) {
    return(F)
  } else {
    return(T)
  }
}
blist <- lapply(alist, function(x) is.this(x))

# Detect number of cores
library(parallel)
cpus <- detectCores()

# Iterate through all files in directory
files <- list.files(path=path.to.dir, pattern="*.pattern", full.names=TRUE, recursive=FALSE)
lapply(files, function(fn) {
  do.something(fn)
})

# Lookup tables
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
unname(lookup[x])

# Source all files in directory
source.dir <- function(path, trace = TRUE, ...) {
    for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
       if(trace) cat(nm,":")           
       source(file.path(path, nm), ...)
       if(trace) cat("\n")
    }
}

# Python-like string formatting with one-based indexing
format_str <- function(string, ...) {
    args <- list(...)
    for (i in 1:length(args)) {
        pattern <- paste("\\{", i, "}", sep="")
        replacement <- args[[i]]
        string <- gsub(pattern, replacement, string)
    }
    return(string)
}               
