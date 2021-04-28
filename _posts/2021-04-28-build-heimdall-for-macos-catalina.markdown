---
layout: post
title:  "Build Heimdall for macOS Catalina"
date:   2021-04-28 08:25:00 +0100
---

Based on https://gitlab.com/BenjaminDobell/Heimdall/-/issues/513

```
git clone https://github.com/Benjamin-Dobell/Heimdall.git
cd Heimdall
wget https://gitlab.com/BenjaminDobell/Heimdall/-/merge_requests/468.diff
git apply 468.diff
mkdir build
cd build
brew install libusb
brew install qt5
brew install cmake
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DQt5Widgets_DIR=/usr/local/opt/qt5/lib/cmake/Qt5Widgets ..
make
sudo cp bin/heimdall /usr/local/bin
```