#!/bin/bash

sudo apt install -y python3-dev
sudo apt install -y python3-pip
pip3 install virtualenv
pip3 install --upgrade pip
virtualenv -p python3 ~/mypy3
echo "\nsource ~/mypy3/bin/activate" >> ~/.bashrc
echo "\nsource ~/mypy3/bin/activate" >> ~/.zshrc
source ~/mypy3/bin/activate

sudo apt install -y dkms
# install CUDA
# https://askubuntu.com/questions/799184/how-can-i-install-cuda-on-ubuntu-16-04
# uninstall CUDA
# https://devtalk.nvidia.com/default/topic/994466/how-to-uninstall-cuda-toolkit-and-cudnn-under-linux-/
echo "export PATH=/usr/local/cuda/bin:$PATH" >> ~/.bashrc
echo "export PATH=/usr/local/cuda/bin:$PATH" >> ~/.zshrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.zshrc

# install CuDNN
# https://askubuntu.com/questions/767269/how-can-i-install-cudnn-on-ubuntu-16-04



# pytorch
#pip3 install http://download.pytorch.org/whl/cu90/torch-0.3.0.post4-cp35-cp35m-linux_x86_64.whl
#pip3 install torchvision

# tensorflow
export CUDA_HOME=/usr/local/cuda
sudo apt install -y libcupti-dev
# easy-mode
# pip3 install tensorflow-gpu

# keras
# pip3 install keras

pip3 install -r requirements.txt
