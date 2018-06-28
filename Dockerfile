FROM openjdk:10

RUN apt-get update
RUN apt-get install -y ruby
RUN apt-get install -y python
RUN apt-get install -y python3
RUN apt-get install -y clang
RUN apt-get install -y gcc
RUN apt-get install -y golang
RUN apt-get install -y nodejs
RUN apt-get install -y time
RUN apt-get install -y binutils
# RUN apt-get install -y language-pack-ja-base language-pack-ja
RUN apt-get install -y task-japanese locales-all
ENV LANG=ja_JP.UTF-8
