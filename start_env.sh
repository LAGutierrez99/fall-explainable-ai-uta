#!/bin/bash
docker container run \
  --rm \
  --name dev_env \
  -p 10000:8888 \
  --volume /Users/louisgutierrez/Documents/xai_dev_env:/home/jovyan/work \
  dev_env \
  jupyter lab --NotebookApp.token=''