FROM seabbs/tb_england_wales:latest

EXPOSE 3838

CMD ["Rscript", "-e", "rmarkdown::run('/home/rstudio/TB_England_Wales/index.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"]