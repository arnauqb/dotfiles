autoload -U promptinit; promptinit
prompt pure
# MY CONFIGS
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
## sweet silence ##
unsetopt BEEP
# export variables
export EDITOR="vim"
export BROWSER="chromium"
export PATH="$PATH:/home/arnau/julia/bin"
export PATH="$PATH:/home/arnau/.gem/ruby/2.7.0/bin"
export CLOUDY_DATA_PATH="/home/arnau/cloudy17/data"
export XDG_CONFIG_HOME="$HOME/.config"

# ssh agent
eval $(keychain --eval --quiet id_rsa)

# z 
. /home/arnau/dotfiles/z.sh

### aliases ##
alias vi="nvim"
alias vim="nvim"
alias l="ls --color=auto -lh"
alias ls="ls --color=auto"
alias cosma6="ssh -A dc-quer1@login6.cosma.dur.ac.uk -X"
alias cosma="ssh -A dc-quer1@login7a.cosma.dur.ac.uk"
alias jasmin="ssh -A -t arnau@login2.jasmin.ac.uk 'export INPUTRC=~/.inputrc.mine; /bin/bash'"
alias hartree="ssh -A -l aaq89-hxt01 hcxlogin1.hartree.stfc.ac.uk"
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
alias mountcosma6='sshfs dc-quer1@login7a.cosma.dur.ac.uk:/cosma6/data/dp004/dc-quer1 ~/mnt/cosma6'
alias mountcovid='sshfs dc-quer1@login7a.cosma.dur.ac.uk:/cosma5/data/durham/covid19 ~/mnt/covid19'
prompt_context(){}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/arnau/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/arnau/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/arnau/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/arnau/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda deactivate
