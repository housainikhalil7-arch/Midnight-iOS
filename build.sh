#!/bin/bash

# Build script for Midnight-iOS targeting iOS 13.4
# This script compiles the dylib for injection into Fortnite IPA

set -e

echo "Building Midnight-iOS for iOS 13.4..."

# Create build directory
mkdir -p build

# Compile the dylib
clang++ -dynamiclib \
  -std=c++17 \
  -x objective-c++ \
  -arch arm64 \
  -miphoneos-version-min=13.4 \
  -isysroot "$(xcrun --sdk iphoneos --show-sdk-path)" \
  -I includes \
  main.cpp src/protocol.cpp \
  -o build/libmidnight.dylib \
  -framework Foundation

echo "✓ Build complete!"
echo "Output: build/libmidnight.dylib"
ls -lh build/libmidnight.dylib
