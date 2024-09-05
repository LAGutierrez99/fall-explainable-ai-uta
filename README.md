# Setup Guide for Docker Environment

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Setup Instructions](#setup-instructions)
    - [Mac](#mac)
    - [Windows](#windows)

## Prerequisites
Before starting, ensure you have the following installed/ signed up:
- [Git](https://git-scm.com/downloads)
- [GitLab Account](https://gitlab.com/users/sign_in)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Setup Instructions

### Mac

1. **Create Directory**
   - Create a directory on your local computer for class (i.e XAI-Fall).
   - This will be used to store all your notebooks (and is seperate from the diretory used to clone the repo in the below steps)

2. **Install Docker Desktop**
   - Ensure Docker Desktop is installed and running in the background.

3. **Clone the Repo**
   - Open Terminal and navigate to a directory where you want to clone your repo (not the one used in step 1):
   - git clone "this repo"  (use the HTTPS if you haven't set up ssh keys)

4. **Build Docker Image**
   - Navigate to the directory of the cloned repo (optional create branch)
   - This step is for building the Docker image. Run the following command for the first time setup or everytime after pulling changes:
     ```bash
     docker build . -t xai_dev
     ```

5. **Run Docker Container**
   - Ensure Docker Desktop is running in the background, and the build in the previous step completely successfully. Run the following command to start the container:
     ```bash
     docker container run -it -p 10000:8888 --volume path_to_your_directory:/home/jovyan/work jupyter lab --NotebookApp.token=''
     ```

6. **Access Jupyter Lab**
   - Open your browser and go to [http://localhost:10000/lab](http://localhost:8888/lab).

### Windows
