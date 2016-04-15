ROOTWORKDIR=''
ROOTVERSION=''

sudo apt-get install cmake git dpkg-dev make g++ gcc binutils libx11-dev libxpm-dev \
libxft-dev libxext-dev

sudo apt-get install gfortran libssl-dev libpcre3-dev \
xlibmesa-glu-dev libglew1.5-dev libftgl-dev \
libmysqlclient-dev libfftw3-dev cfitsio-dev \
graphviz-dev libavahi-compat-libdnssd-dev \
libldap2-dev python-dev libxml2-dev libkrb5-dev \
libgsl0-dev libqt4-dev

cd ${ROOTWORKDIR}
git clone http://root.cern.ch/git/root.git 
cd root

cd build

cmake ${PATH_TO_SOURCE} -Dbuiltin_fftw3=ON -Dbuiltin_ftgl=ON -Dbuiltin_gsl=ON \
                        -Dgdml=ON -Dunuran=ON -Dminuit2=ON -Dtable=ON -Droofit=ON \
                        -Dmathmore=ON -Dcxx11=ON\
