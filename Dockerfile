FROM ubuntu:latest

ENV TZ: Asia/Tokyo
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
      lua5.3 \
      language-pack-ja-base language-pack-ja

ENV LANG=ja_JP.UTF-8
