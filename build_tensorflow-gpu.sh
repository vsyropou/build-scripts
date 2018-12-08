
pip install -U --user pip six numpy wheel mock
pip install -U --user keras_applications==1.0.5 --no-deps
pip install -U --user keras_preprocessing==1.0.3 --no-deps


./configure

bazel build --config=opt --config=cuda --cxxopt="-D_GLIBCXX_USE_CXX11_ABI=0" //tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package ../tensorflow_pkg


cd tensorflow_pkg

mkvirtualenv -p python3.6 tensorflow-gpu

pip install tensorflow*.whl
