#!/bin/bash

path=`pwd`

echo "source ${path}/vte.sh"    >> ~/.bashrc
echo "source ${path}/bashrc.sh" >> ~/.bashrc
echo "export PATH=\$PATH:${path}/scripts" >> ~/.bashrc

source ~/.bashrc

touch ~/.inputrc
echo set bell-style none >> ~/.inputrc
#echo '"\e[5~": history-search-backward' >> ~/.inputrc
#echo '"\e[6~": history-search-forward'  >> ~/.inputrc

touch ~/.vimrc
cat vimrc >> ~/.vimrc

