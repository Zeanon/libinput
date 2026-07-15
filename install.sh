#!/bin/bash

meson setup --prefix=/usr builddir/ --reconfigure
ninja -C builddir/
sudo ninja -C builddir/ install
