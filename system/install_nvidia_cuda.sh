

# disable default driver
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf
echo "The output should look like this:"
echo " blacklist nouveau"
echo " options nouveau modeset=0panagia"

sudo update-initramfs -u


# Install latest display driver
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update

# or check this site for the package manager installation:
https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-10-cosmic-cuttlefish-linux
# remember to choose the driver from the software and updates
# or use jockey once it is release for bionic 

# use integrated gpu for display service
sudo cp xorg.conf /etc/X11/xorg.conf

# verify that gpu is not used
# sudo reboot
# nvidia-smi


# install cuda
sudo apt-get update
sudo apt-get upgrade

lspci | grep -i nvidia         # gpu has to appear here
uname -m && cat /etc/*release  # need 64bit arch

sudo apt-get -y install build-essential 
sudo apt-get -y install

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb

sudo apt-get purge nvidia*
sudo apt-get autoremove
sudo apt-get autoclean
sudo rm -rf /usr/local/cuda*

sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list

sudo apt-get update

sudo apt-get install cuda


echo 'export PATH=/usr/local/cuda-10.0/bin:${PATH}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:${LD_LIBRARY_PATH}' >> ~/.bashrc

sudo ldconfig

nvidia-smi

# cudnn
tar -xf cudnn-10.0-linux-x64-v7.4.1.5.tgz
sudo cp -R cuda/include/* /usr/local/cuda-10.0/include
sudo cp -R cuda/lib64/* /usr/local/cuda-10.0/lib64

#nccl
tar -xf nccl_2.3.5-2+cuda10.0_x86_64.txz
sudo cp -R * /usr/local/cuda-10.0/targets/x86_64-linux/
sudo ldconfig



# tensorRT
sudo dpkg -i nv-tensorrt-repo-ubuntu1804-cuda10.0-trt5.0.2.6-ga-20181009_1-1_amd64.deb
sudo apt-key add /var/nv-tensorrt-repo-cuda10.0-trt5.0.2.6-ga-20181009/7fa2af80.pub

sudo apt-get update
sudo apt-get install tensorrt

sudo apt-get install python3-libnvinfer-dev
sudo apt-get install python-libnvinfer-dev

sudo apt-get install uff-converter-tf

dpkg -l | grep TensorRT
