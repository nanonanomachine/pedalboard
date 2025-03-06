#!/bin/bash

# Exit on fail
set -e

cd /app

pip3 install numpy pybind11 setuptools wheel tox
pip3 install -r test-requirements.txt
pip3 install -r docs-requirements.txt

# pip3 install .

# Finally call command issued to the docker service
exec bash
