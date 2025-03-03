# Dockerfile

# Use an official Python runtime as a parent image
FROM --platform=linux/amd64 python:3.12-slim

# Set environment variables
ENV CXXFLAGS="-std=c++14"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        ladspa-sdk pkg-config \
        libsndfile1 \
        libx11-dev libxrandr-dev libxinerama-dev \
        libxrender-dev libxcomposite-dev libxcb-xinerama0-dev \
        libxcursor-dev libfreetype6 libfreetype6-dev \
        libasound2-dev \
        ccache \
        gdb \
    && rm -rf /var/lib/apt/lists/*

# gdb-peta
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

# Set work directory
RUN mkdir /app
WORKDIR /app

# Enable to install new packages
COPY ./init.sh ./
RUN chmod +x ./init.sh
