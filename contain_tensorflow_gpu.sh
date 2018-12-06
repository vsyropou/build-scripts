


# sourse: https://github.com/NVIDIA/nvidia-docker


# If you have nvidia-docker 1.0 installed: we need to remove it and all existing GPU containers
docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
sudo apt-get purge -y nvidia-docker

# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

# Test nvidia-smi with the latest official CUDA image
docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi




# source: https://www.tensorflow.org/install/docker#gpu_support

docker run --runtime=nvidia -it --rm tensorflow/tensorflow:latest-gpu \
   python -c "import tensorflow as tf; tf.enable_eager_execution(); print(tf.reduce_sum(tf.random_normal([1000, 1000])))"



# test
git clone https://github.com/tensorflow/models.git

mv  models/tutorials/image/cifar10 tensorflow-benchmark
rm -rf models



docker run --runtime=nvidia -it -v ~/repos/tensorflow-benchmark:/repos -p 8888:8888 -p 6006:6006 tensorflow/tensorflow:latest-gpu
export CONTAINER_ID=`docker ps | grep "tensorflow/tensorflow:latest-gpu" | awk '{ print $1 }'`
docker exec -it ${CONTAINER_ID} mkdir /workdir
docker cp tensorflow-benchmark ${CONTAINER_ID}:/workdir
docker exec -it ${CONTAINER_ID} python /workdir/tensorflow-benchmark/cifar10_train.py

docker exec -it ${CONTAINER_ID} tensorboard --logdir=/tmp



# w/o jupiter
docker build -f ~/repos/tensorflow/tensorflow/tools/dockerfiles/dockerfiles/gpu.Dockerfile --build-arg TF_PACKAGE=tensorflow-gpu -t tfgpu .
export CONTAINER_ID=`docker ps | grep "tfgpu" | awk '{ print $1 }'`
docker exec -it ${CONTAINER_ID} python /workdir/tensorflow-benchmark/cifar10_train.py
docker run --runtime=nvidia -it -v ~/repos/tensorflow-benchmark:/my-devel  -p 6006:6006 tfgpu
docker exec -it ${CONTAINER_ID} tensorboard --logdir=/tmp

