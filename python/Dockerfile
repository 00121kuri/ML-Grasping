FROM nvidia/cuda:12.2.2-base-ubuntu22.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3-pip \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

COPY ./ml-agents/ml-agents-envs /app/ml-agents/ml-agents-envs
COPY ./ml-agents/ml-agents /app/ml-agents/ml-agents

RUN pip install --upgrade pip
RUN pip install -e ./ml-agents/ml-agents-envs \
    ./ml-agents/ml-agents

COPY . /app/

# Set the timezone to Tokyo
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN chmod +x run.sh
RUN chmod +x tensorboard.sh
ENTRYPOINT ["./tensorboard.sh"]