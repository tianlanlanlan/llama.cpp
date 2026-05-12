#!/bin/bash
set -e
# set -x

readonly cur_dir=$(cd -- "$(dirname -- BASH_SOURCE[0])" &>/dev/null && pwd)
readonly build_dir=$cur_dir/build
readonly install_dir=$cur_dir/output

rm -rf $build_dir $install_dir
cmake -S . -B $build_dir \
     -DGGML_BACKEND_DL=ON \
     -DGGML_CPU_ALL_VARIANTS=ON \
     -DCMAKE_INSTALL_RPATH='$ORIGIN' \
     -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
     -DGGML_BACKEND_DL=ON \
     -DCMAKE_INSTALL_PREFIX=$install_dir \
     -DCMAKE_BUILD_TYPE=Debug
cmake --build $build_dir -j 8
cmake --build $build_dir --target install
