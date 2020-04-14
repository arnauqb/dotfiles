autoload -U promptinit; promptinit
prompt pure
# MY CONFIGS
## sweet silence ##
unsetopt BEEP
# export variables
export EDITOR="vim"
export BROWSER="firefox"
export PATH="$PATH:/home/arnau/julia/bin"
export CLOUDY_DATA_PATH="/home/arnau/cloudy17/data"


# z 
. /home/arnau/dotfiles/z.sh

### aliases ##
alias vi="nvim"
alias vim="nvim"
alias l="ls --color=auto -lh"
alias ls="ls --color=auto"
alias cosma6="ssh dc-quer1@login6.cosma.dur.ac.uk -X"
alias cosma="ssh dc-quer1@login7a.cosma.dur.ac.uk"
alias cosma5="ssh -l dc-quer1 login.cosma.dur.ac.uk"
alias jupycosma="ssh -v dc-quer1@login7a.cosma.dur.ac.uk -L 8892:127.0.0.1:8892 -N"
#alias astro="conda activate astro"
alias astro="source ~/Documents/qwind/env/bin/activate"
alias doodle="docker run -v $(pwd)/samples:/nd/samples -v $(pwd)/frames:/nd/frames -it alexjc/neural-doodle"
alias dualmonitor='xrandr --auto --output HDMI2 --mode 1920x1080 --rate 75 --left-of eDP1'
alias dualmonitor2='xrandr --auto --output HDMI2 --mode 1920x1080 --rate 75 --right-of eDP1'
alias dualup='xrandr --auto --output HDMI2 --mode 1920x1080 --rate 75 --above eDP1'
alias dualleft='xrandr --auto --output HDMI2 --mode 1920x1080 --rate 75 --left-of eDP1'
alias dualright='xrandr --auto --output HDMI2 --mode 1920x1080 --rate 75 --right-of eDP1'
alias singlemonitor='xrandr --auto --output HDMI2 --off'
alias screenonly='xrandr --auto --output eDP1 --off'
alias mountcosma='sshfs dc-quer1@login7a.cosma.dur.ac.uk:/cosma7/data/dp004/dc-quer1 ~/mnt/cosma'
prompt_context(){}
