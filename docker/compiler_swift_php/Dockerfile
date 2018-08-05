FROM swift

ENV TZ: Asia/Tokyo

RUN apt-get update \
    && apt-get install -y language-pack-ja-base language-pack-ja \
    time \
    php \
    binutils

ENV LANG=ja_JP.UTF-8
