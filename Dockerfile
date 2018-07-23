From rocker/tidyverse

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  # for Mongolite
  libsasl2-dev \
  # for DBI
  libjpeg62-turbo-dev \
  # change to China mirror
  && R -e 'chooseCRANmirror(graphics = FALSE, ind = 37)' \
  && install2.r --error \
  --deps TRUE \
  mongolite \
  DBI \
  yaml

# Set working directory
WORKDIR /app

# Add scripts and stuffs
ADD . /app

CMD ["Rscript", "test.R"]
