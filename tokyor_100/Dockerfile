FROM rocker/verse:4.2.1@sha256:f44717bf71222787b96cead2f1731397e4c06ca6796e8384195cbb76aa266a4e
RUN /rocker_scripts/setup_R.sh https://packagemanager.rstudio.com/cran/__linux__/focal/2022-07-20 \
    && /rocker_scripts/install_quarto.sh 1.0.35 \
    && install2.r -n -1 bench
