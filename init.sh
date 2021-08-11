#!/bin/bash

path=`pwd`

echo "source ${path}/vte.sh"    >> ~/.bashrc
echo "source ${path}/bashrc.sh" >> ~/.bashrc

source ~/.bashrc

echo set bell-style none >> /home/$USER/.inputrc
echo '"\e[5~": history-search-backward' >> /home/$USER/.inputrc
echo '"\e[6~": history-search-forward'  >> /home/$USER/.inputrc

cat vimrc >> ~/.vimrc
