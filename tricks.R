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
