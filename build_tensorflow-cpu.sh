

sudo -H pip install -U --user pip six numpy wheel mock
sudo -H pip install -U --user keras_applications==1.0.5 --no-deps
sudo -H pip install -U --user keras_preprocessing==1.0.3 --no-deps


cd tensorflow

./configure


bazel build --config=opt --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" //tensorflow/tools/pip_package:build_pip_package


./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

mkvirtualenv  -p python3.6 tensorflow-cpu

pip install <tensorflow whl>

