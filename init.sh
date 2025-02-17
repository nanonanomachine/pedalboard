#!/bin/bash

# Exit on fail
set -e

cd /app

pip3 install numpy pybind11 setuptools wheel

# pip3 install .

# Finally call command issued to the docker service
exec bash
