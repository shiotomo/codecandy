FROM ubuntu

RUN apt-get update
RUN apt-get install -y ruby
RUN apt-get install -y python
RUN apt-get install -y clang
RUN apt-get install -y time
RUN apt-get install -y binutils
