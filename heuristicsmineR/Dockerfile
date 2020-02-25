FROM rocker/r-ver:3.6.2

# fix warning about apt-utils
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \     
# httr and curl	
  	libssl-dev \
	libcurl4-gnutls-dev \
	libxml2-dev \
# for DiagrammeRsvg	
	libv8-dev \
# for Cairo	
	libcairo2-dev libgtk2.0-dev xvfb xauth xfonts-base libxt-dev \
# for tidyverse
	libssh2-1-dev \
# for rsvg
	librsvg2-bin librsvg2-dev \
# for devtools
	libgit2-dev \
# for rmarkdown
	pandoc

RUN install2.r -e -s remotes

RUN mkdir -p /work
WORKDIR /work

# general dependencies
RUN install2.r -e -s docopt readr DiagrammeR DiagrammeRsvg

# bupaverse dependencies
RUN install2.r -e -s bupaR xesreadR petrinetR

# heuristicsmineR dependencies
RUN install2.r -e -s heuristicsmineR

# heuristicsmineR development 
RUN R -e 'remotes::install_github("bupaverse/heuristicsmineR")'

ENTRYPOINT ["Rscript"]