# Python Based Docker
FROM python:latest

# Installing Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN sudo apt-get update && sudo apt-get install postgresql

# Updating Pip Packages
RUN pip3 install -U pip

# Copying Requirements
COPY requirements.txt /requirements.txt

# Installing Requirements
RUN cd /
RUN pip3 install -U -r requirements.txt
RUN mkdir /Dingdi
WORKDIR /Dingdi
COPY start.sh /start.sh

# Running movie-search-bot
CMD ["/bin/bash", "/start.sh"]
