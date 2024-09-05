FROM jupyter/base-notebook
COPY requirements.txt requirements.txt

##Install gcc and build-essential for llama-cpp to work in Ubuntu
USER root
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    gcc \
    build-essential \
    wget \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --no-cache -r requirements.txt
RUN mkdir models
RUN wget https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q2_K.gguf?download=true -P /home/jovyan/models
Run rm requirements.txt
# Fix permissions on /etc/jupyter as root
USER root
RUN fix-permissions /etc/jupyter/

# Switch back to avoid accidental container runs as root
USER $NB_UID