#!/bin/bash

# Install basic development tools
sudo apt-get update && sudo apt-get install -y build-essential cmake git python3-dev python3-pip libopenblas-dev liblapack-dev 

# Clone PyTorch repository
git clone --recursive https://github.com/pytorch/pytorch
cd pytorch

# Install Python dependencies for PyTorch
pip install -r requirements.txt

# Export desired compiler flags
export CFLAGS="-msse4.1 -msse4.2 -mavx -mavx2 -mfma"
export CXXFLAGS="$CFLAGS"

# Optionally, set CUDA architectures if compiling with CUDA support
# Adjust the compute capabilities based on your GPU
# export TORCH_CUDA_ARCH_LIST="6.1;7.0;7.5;8.0+PTX"

# Build PyTorch
python setup.py install

# Return to the original directory
cd ..

