#!/bin/bash
# TOPST D3-G용 Ymir 빌드 (2026-04 설치 노트의 명령 그대로, 빌드 디렉토리만 분리)
set -e
cd "$(dirname "$0")"
BD=${1:-build-v033}
CMAKE_MAKE_PROGRAM=/usr/bin/make cmake -S . -B $BD -G "Unix Makefiles" \
  -DCMAKE_MAKE_PROGRAM=/usr/bin/make -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_TOOLCHAIN_FILE=vcpkg/scripts/buildsystems/vcpkg.cmake \
  -DCMAKE_C_COMPILER=clang-15 -DCMAKE_CXX_COMPILER=clang++-15 \
  -DYmir_ENABLE_TESTS=OFF -DYmir_ENABLE_SANDBOX=OFF -DYmir_ENABLE_YMDASM=OFF \
  -DYmir_ENABLE_DEVLOG=OFF -DYmir_ENABLE_IMGUI_DEMO=OFF
make -C $BD -j4
