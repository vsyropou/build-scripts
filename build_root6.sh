
# git clone https://github.com/root-project/root.git
# cd root
# git checkout -b v<blah> v<foo>

sudo apt-get install -y dpkg-dev
sudo apt-get install -y make
sudo apt-get install -y g++
sudo apt-get install -y gcc
sudo apt-get install -y binutils
sudo apt-get install -y libx11-dev
sudo apt-get install -y libxpm-dev
sudo apt-get install -y libxft-dev
sudo apt-get install -y libxext-dev
sudo apt-get install -y libpng-dev
sudo apt-get install -y libjpeg-dev

sudo apt-get install -y xlibmesa-glu-dev
sudo apt-get install -y libcfitsio-dev
sudo apt-get install -y gfortran
sudo apt-get install -y libssl-dev
sudo apt-get install -y libpcre3-dev
sudo apt-get install -y libglew1.5-dev
sudo apt-get install -y libftgl-dev
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libfftw3-dev
sudo apt-get install -y graphviz-dev
sudo apt-get install -y libavahi-compat-libdnssd-dev
sudo apt-get install -y libldap2-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y libgsl0-dev
sudo apt-get install -y libqt4-dev



cd build
cmake -DCMAKE_INSTALL_PREFIX=/home/vsyropou/root-v6-12-00-patches \
      -Dbuiltin_fftw3=ON -Dbuiltin_ftgl=ON -Dbuiltin_gsl=ON \
      -Dgdml=ON -Dunuran=ON -Dminuit2=ON -Dtable=ON -Droofit=ON \
      -Dmathmore=ON -Dcxx17=ON ../

sudo cmake --build . --target install -- -j8

echo source /path/to/install-or-build/dir/bin/thisroot.sh >> ~/.bashrc
