FROM openjdk:10

ENV TZ: Asia/Tokyo

RUN apt-get update \
      && apt-get install -y task-japanese locales-all \
      time \
      binutils \
      groovy \
      php \
      scala

ENV LANG=ja_JP.UTF-8
