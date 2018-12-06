# docker
sudo apt-get -y install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"

sudo apt-get update

sudo apt-get -y install docker-ce

sudo docker run hello-world

sudo usermod -aG docker your-user

sudo usermod -aG docker $USER

docker run hello-world

sudo systemctl enable docker

echo manual | sudo tee /etc/init/docker.override
