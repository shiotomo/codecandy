# FROM swift:latest
FROM ubuntu:latest

RUN apt-get update \
      && apt-get install -y ruby \
      python \
      python3 \
      clang \
      gcc \
      g++ \
      golang \
      nodejs \
      openjdk-8-jdk \
      scala \
      time \
      binutils \
      language-pack-ja-base language-pack-ja

 ENV LANG=ja_JP.UTF-8
