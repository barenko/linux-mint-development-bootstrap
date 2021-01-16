#!/bin/bash
bash

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


bash ./pos-linux-install.sh
if [ "$LMDB_REMOVE_BLOATWARE" == "y" ]; then bash ./bloatware-remover.sh
if [ "$LMDB_TOOL_SET" == "y" ]; then bash ./toolset.sh
if [ "$LMDB_DOCKER" == "y" ]; then bash ./docker-tools.sh
if [ "$LMDB_JAVA" == "y" ]; then bash ./java-tools.sh
if [ "$LMDB_GOLANG" == "y" ]; then bash ./golang-tools.sh
if [ "$LMDB_PYTHON" == "y" ]; then bash ./python-tools.sh
if [ "$LMDB_NODEJS" == "y" ]; then bash ./nodejs-tools.sh
if [ "$LMDB_RUST" == "y" ]; then bash ./rust-tools.sh
if [ "$LMDB_SNAP" == "y" ]; then bash ./snap-tools.sh
bash ./pos-install-all.sh