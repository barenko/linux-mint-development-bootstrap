#!/bin/bash

echo "Welcome to development (high opinioned) workstation bootstrap."

read -n 1 -p "Do you want to use a better developer tool set? [Yn] " -i "y" LMDB_TOOL_SET
read -n 1 -p "Do you want to remove bloatware? [Yn] " -i "y" LMDB_REMOVE_BLOATWARE
read -n 1 -p "Do you want to install Java tools? [Yn] " -i "y" LMDB_JAVA
read -n 1 -p "Do you want to install NodeJs tools? [Yn] " -i "y" LMDB_NODEJS
read -n 1 -p "Do you want to install Golang tools? [Yn] " -i "y" LMDB_GOLANG
read -n 1 -p "Do you want to install Python tools? [Yn] " -i "y" LMDB_PYTHON
read -n 1 -p "Do you want to install Rust tools? [Yn] " -i "y" LMDB_RUST
read -n 1 -p "Do you want to install Docker tools? [Yn] " -i "y" LMDB_DOCKER
read -n 1 -p "Do you want to use snap? [Yn] " -i "y" LMDB_SNAP


./pos-linux-install.sh
if [ "${LMDB_REMOVE_BLOATWARE:-y}" == "y" ]; then ./bloatware-remover.sh; fi
if [ "${LMDB_TOOL_SET:-y}" == "y" ]; then ./toolset.sh; fi
if [ "${LMDB_DOCKER:-y}" == "y" ]; then ./docker-tools.sh; fi
if [ "${LMDB_JAVA:-y}" == "y" ]; then ./java-tools.sh; fi
if [ "${LMDB_GOLANG:-y}" == "y" ]; then ./golang-tools.sh; fi
if [ "${LMDB_PYTHON:-y}" == "y" ]; then ./python-tools.sh; fi
if [ "${LMDB_NODEJS:-y}" == "y" ]; then ./nodejs-tools.sh; fi
if [ "${LMDB_RUST:-y}" == "y" ]; then ./rust-tools.sh; fi
if [ "${LMDB_SNAP:-y}" == "y" ]; then ./snap-tools.sh; fi
bash ./pos-install-all.sh