
mkdir ~/workdir/projects/tensorflow-cpu/
mkdir ~/workdir/projects/pytorch-gpu/

mkvirtualenv -a ~/workdir/projects/tensorflow-cpu/  -p python3.6 tensorflow-cpu
mkvirtualenv -a ~/workdir/projects/pytorch-gpu  -p python3.6 pytorch-gpu

mkvirtualenv -a  -p python3.6 -i scikit-learn sklearn
mkvirtualenv -a  -p python3.6 -i iminuit iminuit
