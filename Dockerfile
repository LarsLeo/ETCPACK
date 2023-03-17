FROM ubuntu:20.04 AS etcpack

ENV TZ="Europe/Berlin"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get upgrade -y

# preinstall some necessary tools
RUN apt-get install -y zlib1g-dev build-essential clang

RUN apt-get -y dist-upgrade && apt-get autoremove

# Create the home directory and move the necessary sources there to compile
RUN mkdir -p /app
WORKDIR /app
ENV HOME /app

ADD ./source /app

RUN g++ -O2 -w -lz -g /app/image.h /app/image.cxx /app/etcpack.cxx /app/etcdec.cxx -o etcpack

CMD ["/bin/bash"]
