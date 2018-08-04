FROM php

ENV TZ: Asia/Tokyo

RUN apt-get update \
      && apt-get install -y task-japanese locales-all \
      time \
      binutils

ENV LANG=ja_JP.UTF-8
