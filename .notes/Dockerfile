FROM trestletech/plumber:latest
MAINTAINER Daniel Chen <chendaniely@gmail.com>

RUN echo "hello"

# https://github.com/rstudio/plumber/issues/459
RUN echo 'deb http://deb.debian.org/debian bullseye main' > /etc/apt/sources.list
RUN apt-get update && \
    apt-get -y install nano

COPY model.RDS .
COPY plumber.R .

EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8000)"]
CMD ["plumber.R"]
