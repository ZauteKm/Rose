FROM python:3.10.0-slim-bullseye

# Don't use cached python packages
ENV PIP_NO_CACHE_DIR 1

# Installing Required Packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    bash \
    python3-dev \
    python3-lxml \
    gcc \
    git \
    make \
    && rm -rf /sample_config/lib/apt/lists /sample_config/cache/apt/archives /tmp

# Enter Workplace
RUN git clone -b master https://github.com/ZauteKm/Rose /root/Rose
WORKDIR /root/Rose

# Copy folder
COPY ./tg_bot/sample_config.py ./tg_bot/sample_config.py* /root/tg_bot/tg_bot/

ENV PATH="/home/bot/bin:$PATH"

# Install dependencies
RUN pip3 install --upgrade pip

# Install Bot Deps and stuff
RUN pip3 install -U -r requirements.txt

# Run the bot
ENTRYPOINT ["python3","-m","tg_bot"]
