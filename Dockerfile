FROM jupyter/datascience-notebook
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

Run rm requirements.txt
# Fix permissions on /etc/jupyter as root
USER root
RUN fix-permissions /etc/jupyter/

# Switch back to avoid accidental container runs as root
USER $NB_UID