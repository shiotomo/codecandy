FROM openjdk:10

ENV TZ: Asia/Tokyo
ENV LANG=ja_JP.UTF-8

RUN apt-get update \
      && apt-get install -y task-japanese locales-all \
      time \
      binutils \
      scala

