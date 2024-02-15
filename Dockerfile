FROM rocker/shiny:4.2.0

RUN apt-get update \
	&& apt-get install -y \
	apt-utils \
	manpages-dev \
	libnetcdf-dev \
	libxml2-dev \
	libglpk-dev \
	libnode-dev  \
	libz-dev

RUN R -e "install.packages('BiocManager')"
# RUN R -e "BiocManager::install('omicsViewer')"
RUN R -e "BiocManager::install('xcms')"
RUN R -e "BiocManager::install('MAIT')"
RUN R -e "install.packages('devtools')"
RUN R -e 'BiocManager::install(c("survminer", "survival","fastmatch","reshape2","beeswarm","grDevices","shinycssloaders","shinythemes","networkD3","httr","RColorBrewer","psych","stringr","shiny","shinydashboard","shinyWidgets","shinybusy","matrixStats","flatxml","excelR","shinyjs","shinyFiles","DT","plotly","openxlsx","yaml","curl","sortable","BiocManager","password","ggseqlogo","devtools","Matrix","RSQLite"))'
RUN R -e 'BiocManager::install(c("Biobase", "fgsea", "S4Vectors", "SummarizedExperiment"), update = FALSE)'
RUN R -e 'devtools::install_github("mengchen18/omicsViewer", dependencies = TRUE)'
RUN R -e "devtools::install_github('mengchen18/xcmsViewer', upgrade='never')"


RUN mkdir /home/shiny/data && \
	mkdir /home/shiny/app

COPY . /home/shiny/app/

ENV PORT 3838

ENV HOST "0.0.0.0"

CMD ["R", "-e", "shiny::runApp('/home/shiny/app', host = Sys.getenv(\"HOST\"), port = strtoi(Sys.getenv(\"PORT\")))"]

