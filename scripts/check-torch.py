#!/usr/bin/env python

import torch


if __name__ == '__main__':

    print("Is CUDA available:", torch.cuda.is_available())
    print("PyTorch version:", torch.__version__)
    print("CUDA version:", torch.version.cuda)
    print("cuDNN version:", torch.backends.cudnn.version())

    if torch.cuda.is_available():
        print("CUDA Device Name:", torch.cuda.get_device_name(0))

