# Tensorflow Serving

TensorFlow Serving is a flexible, high-performance serving system for machine learning models, designed for production environments. TensorFlow Serving makes it easy to deploy new algorithms and experiments, while keeping the same server architecture and APIs. TensorFlow Serving provides out-of-the-box integration with TensorFlow models, but can be easily extended to serve other types of models and data.

Details on:
https://www.tensorflow.org/tfx/guide/serving


## Intro

For optimizing reason, official tensorflow/serving docker image requied cpu support avx instructions set.
It should not be a problem since it always is included in brand new cpus. However for some old cpus used in NAS or other special purposes not support it. This image would resolve the problem.

Typically you could find error below in docker logs:
```bash
usr/bin/tf_serving_entrypoint.sh: line 3:     6 Illegal instruction     (core dumped) tensorflow_model_server --port=8500 --rest_api_port=8501 --model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} "$@"
```

Further reference: https://stackoverflow.com/questions/56034929/how-to-solve-tf-serving-entrypoint-sh-line-3-6-illegal-instruction-core-dumpe

## How to use:

Please refer to https://www.tensorflow.org/tfx/serving/docker
