FROM rocker/r-ubuntu as base

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir output
RUN mkdir data

COPY code code
COPY data data
COPY Makefile .
COPY sjc_final_2.Rmd .

RUN mkdir -p renv
COPY .Rprofile .Rprofile
COPY renv.lock renv.lock
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir final_report

CMD make && mv sjc_final_2.html final_report
#RUN mkdir renv/.cache
#ENV RENV_PATHS_CACHE renv/.cache
