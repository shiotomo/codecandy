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
      lua5.3 \
      haskell-platform \
      npm \
      lazarus \
      time \
      binutils \
      swi-prolog \
      language-pack-ja-base language-pack-ja

RUN npm install -g typescript

ENV LANG=ja_JP.UTF-8
