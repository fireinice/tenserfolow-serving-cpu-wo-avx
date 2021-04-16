FROM debian:stable-slim
MAINTAINER zigler zhang <zigler.zhang@gmail.com>

RUN apt-get update && \
    apt-get install curl gnupg -y && \
    echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" > /etc/apt/sources.list.d/tensorflow-serving.list && \
    curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add - && \
    apt-get update && \
    apt-get install tensorflow-model-server-universal -y && \
    rm -rf /var/lib/apt/


EXPOSE 8500
EXPOSE 8501

ENV MODEL_BASE_PATH=/models

RUN mkdir -p ${MODEL_BASE_PATH}

ENV MODEL_NAME=model

WORKDIR	   /app
COPY tf_serving_entrypoint.sh .

ENTRYPOINT ["tf_serving_entrypoint.sh"]
