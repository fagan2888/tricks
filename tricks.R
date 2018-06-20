# Initalize R Markdown File
---
title: "Project Title"
author: "Anthony Federico"
output:
  html_document:
    theme: united
    toc: yes
  html_notebook:
    toc: yes
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

# Get and set env variables in R
Sys.getenv("envar")
Sys.setenv(envar="")

# Knit markdown files on SCC
module load R/3.4.2; R
$SCC_PANDOC_DIR # Get the output of this
Sys.setenv(RSTUDIO_PANDOC="/share/pkg/pandoc/2.2.1")
rmarkdown::render('markdown.file.Rmd')


