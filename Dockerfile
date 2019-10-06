FROM ubuntu:18.04

WORKDIR /root

ENV AUTOMATION 1

RUN apt-get update && \
  apt-get -y install vim curl git tar

RUN vim --version

RUN curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# make directories for vimrc
RUN mkdir /opt/roslyn-1.34.4 /opt/roslyn-1.32.0

RUN curl -sL \
  https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.34.4/omnisharp-linux-x64.tar.gz \
  | tar -xz -C /opt/roslyn-1.34.4

RUN curl -sL \
  https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.32.0/omnisharp-linux-x64.tar.gz \
  | tar -xz -C /opt/roslyn-1.32.0

ADD .vimrc .vimrc

# RUN vim +'PlugInstall --sync' +qall >/dev/null 2>&1
RUN vim +'PlugInstall --sync' +qall 

RUN ls -al /root/.vim/plugged/

ADD . .
