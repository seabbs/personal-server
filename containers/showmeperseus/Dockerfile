FROM seabbs/showmeperseus:latest

EXPOSE 3838


CMD ["Rscript", "-e", "rmarkdown::run('/home/rstudio/ShowMePerseus/index.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"]