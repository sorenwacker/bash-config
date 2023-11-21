# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#############################
# Standard BASH configuration 
export LANG=en_US.UTF-8
export EDITOR=vi
export DISPLAY=localhost:0.0 

shopt -s checkwinsize

###Alias
alias ll='ls -alF'
alias la='ls -A'
alias ls='ls --color=auto'
alias l='ls -rtlh --full-time'
alias md='mkdir'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .rc='vi ~/.bashrc'
alias src='source ~/.bashrc'
alias ipaddress='ifconfig | grep inet | F 2 | sed s/addr:// | head -1'

alias pdf2png='convert -density 300x300 -resize 1000x1000 '
alias ps2pdf='ps2pdf -dEPSCrop'
alias eps2pdf='for i in `ls *eps`;do ps2pdf -dESPCrop $i;done'
alias joinpdf='gs  -dPDFFitPage -dFIXEDMEDIA -sPAPERSIZE=a4 -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=joined.pdf'
alias jlab='nohup jupyter-lab --no-browser>> /dev/null'
alias ca='conda activate'

alias docker-stop-all='sudo docker stop $(sudo docker ps -a -q)'
alias docker-rm-all='sudo docker rm $(sudo docker ps -a -q)'
alias docker-ls='sudo docker container ls'
alias docker-prune='sudo docker rm $(sudo docker images -q) -f && sudo docker system prune -f'

alias set-ssh-permissions='chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys && chmod 600 ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub'

if [ -f /usr/bin/vimx ];then 
    alias vi='vimx'
else
    alias vi='vim'
fi 

# Write commands to .localhistory files
if declare -F __vte_prompt_command >/dev/null 2>&1; then
    export PROMPT_COMMAND='__vte_prompt_command; hpwd=$(history 1); hpwd="${hpwd# *[0-9]*  }"; printf "$hpwd\n" >> ~/.localhistory'
else
    export PROMPT_COMMAND='hpwd=$(history 1); hpwd="${hpwd# *[0-9]*  }"; printf "$hpwd\n" >> ~/.localhistory'
fi



####################################################################################
# General BASH configuration
export PATH=$PATH:$SYSTEM/scripts


## Shellstyle
PS1='\[\033[02;0m\]\u@\h:\[\033[03;92m\]\w>\[\033[00m\]'


## ls style
LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

export LS_COLORS


## History
shopt -s histappend # make history non-overwriting
HISTSIZE=100000
HISTFILESIZE=100000
export HISTIGNORE="ll:ls:la:cd*:[bf]g*:exit"
export HISTCONTROL=erasedups
# export HISTCONTROL=ignoredups

# history with comments:
# export PROMPT_COMMAND='hpwd=$(history 1); hpwd="${hpwd# *[0-9]*  }"; if [[ ${hpwd%% *} == "cd" ]]; then cwd=$OLDPWD; else cwd=$PWD; fi; hpwd="${hpwd% ### *} ### $cwd"; history -s "$hpwd"'

# Matplotlib config
export MATPLOTLIBRC=/home/swacker/System/config/matplotlibrc


###Functions

F() {	tmp=""
	for i in $@; do tmp="$tmp\$$i\"\t\"" ;done
	awk '{print '$tmp'}' | sed 's/\t$//g' 
}

Basename() { 
	basename $1 | awk -F . '{print $1}'
}

Extname() { 
        basename $1 | awk -F . '{print $2}'
}

lsd() {
  while [ $# -gt 0 ]; do
  echo "`pwd`/$1"
  shift
  done 
}

wo() {
	find . -name "$1*"
}

eq() { 
	gawk 'BEGIN {print '"$*"'}' < /dev/null; 
}


extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

function apt-history(){

      case "$1" in
        install)
              grep 'install ' /var/log/dpkg.log
              ;;
        upgrade|remove)
              grep $1 /var/log/dpkg.log
              ;;
        rollback)
              grep upgrade /var/log/dpkg.log | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}


if [ `pwd` == "/mnt/c/Windows/System32" ]; then
    cd ~
fi


## For WSL users

_beep () {
  for i in seq 3 ; do
    powershell.exe "[console]::beep($1,$2)"
  done
}

alias  beep="_beep 500 80"  # Quick yet noticeable beeps
alias  beeep="_beep 1000 200"  # Longer beeps

alias install_miniconda='wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && eval "$(/home/$USER/miniconda3/bin/conda shell.bash  hook)"\
    && conda init'
    
alias mamba_create_py3='mamba create -y -n py3 -c plotly -c conda-forge jupyterlab \
    tqdm pycaret scikit-learn seaborn pandas tqdm openpyxl xlsxwriter plotly beautifulsoup4 pandas \
    python-wget black pytest pytest-cov' 
    
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
