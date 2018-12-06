
mkdir -p ~/workdir/projects
mkdir -p ~/repos


# system
sudo apt-get update

sudo apt-get -y install git
sudo apt-get -y install gnome-tweek-tool
sudo apt-get -y install compizconfig-settings-manager 
sudo apt-get -y install rsnapshot
sudo apt-get -y install emacs
sudo apt-get -y install thunderbird
sudo apt-get -y install tlp
sudo apt-get -y install tlp-rdw
sudo apt-get -y install power-top
sudo apt-get -y install ctop
sudo apt-get -y install htop
sudo apt-get -y install texlive-full
sudo apt-get -y install yakuake
sudo apt-get -y install snap
sudo apt-get -y install synaptic

sudo snap install vlc

# add ppas
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo add-apt-repository ppa:serge-rider/dbeaver-ce

sudo apt-get update

sudo apt-get -y install dbeaver-ce
sudo apt-get -y install remmina
sudo apt-get -y install remmina-plugin-rdp
sudo apt-get -y install libfreerdp-plugins-standard

# python
sudo apt-get -y upgrade python3
sudo apt-get -y install python3-pip

sudo apt-get -y upgrade python
sudo apt-get -y install python-pip

cd /repos/build_scripts
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

# skype
sudo apt-get install gdebi-core
cd ~/Downloads
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo gdebi skypeforlinux-64.deb


# gitstats repo
cd ~/wordir/repos
git clone git://github.com/hoxu/gitstats.git

# tensorflow repo
cd /workdir/repos
git clone https://github.com/tensorflow/tensorflow.git
git checkout r1.12


# ctop
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop


# bezel
wget https://github.com/bazelbuild/bazel/releases/download/0.17.2/bazel-0.17.2-installer-linux-x86_64.sh
chmod +x bazel-0.17.2-installer-linux-x86_64.sh
./bazel-0.17.2-installer-linux-x86_64.sh --user
echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc

source ~/.bashrc
sudo ldconfig

# todo
#   setup and run rsnapshot backup
#  