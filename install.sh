#!/bin/bash

meson setup --prefix=/usr builddir/ --reconfigure
sudo ninja -C builddir/
sudo ninja -C builddir/ install
