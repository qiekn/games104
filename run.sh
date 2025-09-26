#!/bin/bash

# My private run script for PiccoloEditor on macOS

# Config
BUILD_DIR="build"
DEBUGGER="lldb"
TARGET_PATH="bin/PiccoloEditor"

# If the build directory does not exist, run cmake first
if [ ! -d "${BUILD_DIR}" ]; then
  cmake -S . -B "${BUILD_DIR}" || exit 1
fi

if [ "$1" = "debug" ]; then
  ${DEBUGGER} "${TARGET_PATH}"
else
  make -j"$(nproc)" -C "${BUILD_DIR}" && "${TARGET_PATH}"
fi

# vim: ft=sh ts=2 sw=2 et
