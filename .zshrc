export HOMEBREW_NO_ANALYTICS=1

# PROMPT=""

# # Change cursor to I-beam
# printf '\033[5 q\r'
#
# # Move prompt to the bottom
# repeat $LINES print


# Path to your oh-my-zsh installation.
export ZSH="/Users/Klutchevski/.oh-my-zsh"

CASE_SENSITIVE="true"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# If pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git macos tumult fzf fzf-tab iterm2 magic-enter zsh-autosuggestions zsh-completions colored-man-pages web-search copypath jsontools)
source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
source $ZSH/oh-my-zsh.sh

source ~/CLI/enhancd/init.sh
export ENHANCD_FILTER='fzf'
export ENHANCD_DISABLE_DOT=1
export ENHANCD_HYPHEN_NUM=80

# export MANPATH="/usr/local/man:$MANPATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

export PATH="/usr/local/sbin:/opt/homebrew/bin:/usr/local/opt/m4/bin:/Users/Klutchevski/CLI:/Users/Klutchevski/go/bin:/Users/Klutchevski/.local/bin/:$PATH"
# PATH="/Users/Klutchevski/.google-drive-upload/bin:${PATH}"     /Users/Klutchevski/Library/Python/3.9/bin:

export GOPATH="/Users/Klutchevski/Go"

alias z="micro ~/.zshrc"
alias ohmyzsh="micro ~/.oh-my-zsh"

export EDITOR="micro"
export VISUAL="micro"
export BROWSER="open -a Vivaldi"
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias ll="ls -alG"
alias port='sudo lsof -i -n -P | grep TCP'
alias q='exit'
# alias adobe='ps axuwww | grep Adobe --exclude='grep' | awk '{print $2}' | xargs kill -9'
alias adobe="pkill -9 -fi \'core sync\'; pkill -9 -fi \'creative cloud\'; pkill -9 -fi \'adobe desktop service\'; pkill -9 -fi \'adobeipcbroker\'; pkill -9 -fi \'logtransport\'"
alias weather='curl http://wttr.in/Moscow'
alias w="watch -d -n 2 'ls -rtlh | tail'"
# alias w='curl http://v2n.wttr.in/Moscow'
alias W='curl -s "wttr.in/?format=3"'
alias wm='curl v3.wttr.in/Moscow.sxl'
alias moon='curl wttr.in/moon'
alias powermac='wakeonlan 00:0A:95:A7:D6:AE'
alias freeram='sudo purge'

# Delete local Time Machine snapshots
alias clean='sudo tmutil deletelocalsnapshots /Volumes/Macintosh\ HD/'
alias cleanlist='tmutil listlocalsnapshots /Volumes/Macintosh\ HD'

alias stealth='log stream --source | grep -iE "Stealth"'
alias warnings='log stream --source | grep -iE "Warning"'
alias errors='log stream --source | egrep -iE "warning|Error"'
alias stream='sudo log stream'
alias showlog='tail -f /var/log/system.log'
alias shtop='sudo htop'
alias youtube='yt-dlp'
# alias ytfzf='ytfzf -l -f --detach --url-handler='/Applications/IINA.app/Contents/MacOS/iina-cli''
alias ytfzf='ytfzf -l -f --detach --url-handler='/Applications/VLC.app/Contents/MacOS/VLC''
alias ym='ytmdl --title-as-name'
alias f=ofd
alias finder=ofd
alias F=cdf
alias n=newsboat
alias o=open
alias h=navi
alias gdrive='rclone cmount --daemon --allow-other --vfs-read-chunk-size 64M --vfs-cache-mode full --no-checksum --dir-cache-time 96h --umask 002 --vfs-write-wait 10s --write-back-cache Exchange: /Users/Klutchevski/Exchange'
# alias M=musikcube
# alias m=cmus
alias M='~/.config/cmus/cmus-cover-art/display.sh'
alias music='cmus'
alias lyrics='~/.config/cmus/cmus-lyrics | lolcat-c'
alias ml='~/.config/cmus/cmus-lyrics | lolcat-c'
alias e='source ranger'
alias search="fzf --prompt=' ' --bind 'alt-c:execute-silent(echo {} | pbcopy)+abort'"
alias win='sh /Users/Klutchevski/.config/windows.sh'
alias powermode='sh /Users/Klutchevski/.config/powermode.sh'
alias p='sh /Users/Klutchevski/.config/powermode.sh'
alias torrent='/Users/Klutchevski/CLI/cli-torrent-dl/tordl.sh'
alias t='/Users/Klutchevski/CLI/cli-torrent-dl/tordl.sh'
alias mt='mac-torrents'
alias kino='cliflix'
alias play='cliflix'
alias c='cliflix'
alias d='aria2p top'
alias dl='aria2p add'
alias dr='aria2p resume -a'
alias dp='aria2p pause -a -f'
alias download='aria2p add'
alias check='lynis audit system'
alias sherlock='cd ~/CLI/Sherlock && python3 sherlock'
# alias upload='transfersh'
# alias up='ffsend upload'
alias up='upload'
alias u='upload'
alias code='open -a visual\ studio\ code'
alias su='sudo '
alias ..='cd ..'
alias vpn='sh /Users/Klutchevski/.config/VPN.sh'
alias empty='trash -e -y'
alias b='open -a Vivaldi'
alias vivaldi='open -a Vivaldi'
alias snano='sudo nano --rcfile=/Users/Klutchevski/.nanorc'
alias k="ps -aevr | grep -v 'iTerm\|zsh\|WindowServer' | fzf --layout=reverse-list | xargs kill -9"
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias a='ascii-image-converter -C'
alias C='cd ~/.config'
alias D='cd ~/Downloads'
alias map='telnet mapscii.me'
alias jrnl='jrnl --config-override editor "micro"'
alias lessvim="vim -u /opt/homebrew/share/vim/vim82/macros/less.vim "+set background=dark""
alias rn="mmv *"
alias space=diskonaut
alias keycodes="xxd -psd"
alias keycodes2="sed -n l"
alias keycodes3="infocmp -cL"
# alias "rm -rf"=trash
# alias "rm"=trash
alias oscilloscope='catnip -b ffmpeg-avfoundation -fg 029 -ct 029'
alias osc='catnip -b ffmpeg-avfoundation -fg 029 -ct 029'
alias remove='mdfind -name $1 | vipe | xargs -L 1 -I {} rm -rf {}'
alias edit='ttab -w micro'
alias excel=sc-im
alias whatsapp='nchat -d ~/.nchatwhatsapp'
alias wa='nchat -d ~/.nchatwhatsapp'
alias telegram='nchat'
alias tg='nchat'
alias spotoff='mdutil -i off'
alias choose-files='ranger --choosefiles=/Users/Klutchevski/CLI/choosen-files'
alias calendar=calcure
alias cal=calcure
alias note='notes add -e'
alias iphone-reboot='idevicediagnostics restart'
# alias pass='security find-generic-password -wa'
alias pass=wifi-pass
# Sum of 3rd column of a file
alias summa="awk '{ x += $3 } END { print x }'"

# Global abbriviations / links
alias -g docs=~/Documents
alias -g shots=~/Pictures/Screenshots
alias -g projects=~/Projects
alias -g sd=/Volumes/Untitled


# File exstensions handling
alias -s lua="micro"
alias -s txt="micro"
alias -s conf="micro"
alias -s cfg="micro"
alias -s ini="micro"
alias -s app="open -a"
alias -s jpg="ascii-image-converter -C"
alias -s jpeg="ascii-image-converter -C"
alias -s png="ascii-image-converter -C"
alias -s tiff="ascii-image-converter -C"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080,bg=black"


# Ranger file manager running indicator
if [ -n "$RANGER_LEVEL" ]; then export PS1="[]$PS1"; fi


# FZF default options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--reverse --prompt='' -e -s -m --margin 1 --bind 'alt-d:reload(find . -type d),alt-s:reload($FZF_DEFAULT_COMMAND)' --bind 'alt-c:execute-silent(echo {} | pbcopy)+abort' --bind 'alt-e:execute-silent(micro "$(echo {})")+abort' --bind "alt-q:abort" --preview='[[ ! -z {} ]] && rga --pretty --context 5 {q} {}' --bind shift-up:preview-page-up,shift-down:preview-page-down --preview-window="70%:wrap" --preview-window noborder --preview-window='right:hidden:wrap' --bind=alt-w:toggle-preview"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#00a10e,hl:#3aa6ff,bg+:#00a10e
 --color=fg+:black,hl+:#3aa6ff,query:#00a10e,prompt:#000000
 --color=info:#3aa6ff,pointer:#00a10e,gutter:-1
 --color=marker:#3aa6ff,spinner:#3aa6ff,header:#3aa6ff'


## Other preview methods for fzf
#
# --preview='bat -p --color=always --paging=never {}' --bind shift-up:preview-page-up,shift-down:preview-page-down --preview-window="70%:wrap" --preview-window noborder
# --preview='[[ ! -z {} ]] && rga --rga-adapters=+pdfpages --pretty --context 5 {q} {}' --bind shift-up:preview-page-up,shift-down:preview-page-down --preview-window="70%:wrap" --preview-window noborder

enable-fzf-tab

export HOMEBREW_NO_AUTO_UPDATE=1

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' continuous-trigger 'SPACE'

# bind to double tab?
fzf-tab-partial-and-complete() {
    if [[ $LASTWIDGET = 'fzf-tab-partial-and-complete' ]]; then
        fzf-tab-complete
    else
        zle complete-word
    fi
}
# # Double Tab
# tb_cd() {
    # ls -L | fzf -m
# }
# zle -N tb_cd
# # bindkey '^I^I' fzf-tab-partial-and-complete
# bindkey '^I^I' fzf-cd-widget


# insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
# Ctrl + V / Option + I / Insert last output
bindkey -r '\ei'
bindkey '\ei' insert-last-command-output
bindkey -r '\Cv'
bindkey '\Cv' insert-last-command-output

# FZF History
bindkey "${key[Up]}" fzf-history-widget


# FZF Kill
fzf-kill() {
ps -aevrc | fzf --layout=reverse-list --bind "alt-w:reload(ps -aevr)" | xargs kill -9 &> /dev/null
}
zle -N fzf-kill
bindkey '\ek' fzf-kill

# bindkey -s '\eq' 'ps -aevrc | fzf --layout=reverse-list | xargs kill -9\n'
# bindkey -s '\ew' 'ps -aevr | fzf --layout=reverse-list | xargs kill -9\n'

# Escape = reset prompt line
# Double Escape = quit
double_escape() {
zle kill-whole-line
exit
}
zle -N double_escape
bindkey '\E' kill-whole-line
bindkey '\E\E' double_escape


zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'


# Edit command line {{{
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line
# }}}


# listen port
listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}


# Alt+G Browse vivaldi history
vivaldi-history() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Vivaldi/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi --bind 'alt-c:execute-silent(echo {} | sed "s/.* //" | pbcopy)' | sed 's#.*\(https*://\)#\1#' | xargs open
}
zle     -N   vivaldi-history
bindkey '\eg' vivaldi-history


bindkey '\eq' double_escape
bindkey '\ez' undo


# cd into the directory of the selected file
s() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}


# Open path in finder
function ofd_bind {
    ofd
}
zle -N ofd_bind
bindkey "\e/" ofd_bind

# cd into Finders path
function cdf_bind {
prefix="cd"
BUFFER="$prefix '$(pfd)'"
zle accept-line
}
zle -N cdf_bind
bindkey "^[?" cdf_bind


# find-in-file - usage: fif <searchTerm>
# fif() {
  # if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  # rg --files-with-matches --no-messages "$1" | fzf --border=none --preview-window nohidden --multi --preview "highlight -O ansi -l {} 2> /dev/null | rg --no-line-number --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
# }

fif() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --border=none --preview-window nohidden --multi --preview "highlight -O ansi -l {} 2> /dev/null | rg --no-line-number --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	open "$file"
}

function _fif() {
prefix="fif"
BUFFER="$prefix $BUFFER"
CURSOR+=5
zle accept-line
}
zle -N _fif
bindkey '\es' '_fif'


bindkey '\ef' fzf-file-widget


# Enhancd
_enhancd() {
prefix="cd"
BUFFER="$prefix $BUFFER"
CURSOR+=5
zle accept-line
}
zle -N _enhancd
bindkey '\ed' _enhancd


# Upload files and get link
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

# # Alt+U Upload file
# function _upload-file() {
# prefix="up"
# suffix="| pbcopy"
# BUFFER="$prefix $BUFFER $suffix"
# CURSOR+=5
# zle accept-line
# }
# zle -N _upload-file
# bindkey '\eu' '_upload-file'

# # Uninstall or open the webpage for the selected brew application
# uninstall() {
    # local token
    # token=$(brew list --casks | fzf-tmux --query="$1" +m --preview 'brew info {}')
#
    # if [ "x$token" != "x" ]
    # then
        # echo "(U)ninstall or open the (h)omepae of $token"
        # read input
        # if [ $input = "u" ] || [ $input = "U" ]; then
            # brew uninstall --cask $token
        # fi
        # if [ $input = "h" ] || [ $token = "h" ]; then
            # brew home $token
        # fi
    # fi
# }

# Open path in new window
function window() {
  # Must not have trailing semicolon, for iTerm compatibility
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

    osascript \
        -e 'tell application "iTerm2" to tell current window to set newWindow to (create window with default profile)'\
        -e "tell application \"iTerm2\" to tell current session of newWindow to write text \"${command} ;exit\"" \
        -e "delay 1" \
        -e "tell application \"iTerm2\" to activate" \
}
alias o='window'

# Alt+E Edit command line
zle -N 'edit-command-line'
bindkey '\ee' edit-command-line


# ALT-P - View in ASCII selected file(s)
ascii-art() {
	local files
	IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0 --preview='exiftool {}' --bind shift-up:preview-page-up,shift-down:preview-page-down --preview-window="70%:wrap" --preview-window noborder))
	[[ ${#files[@]} -ne 0 ]] && ascii-image-converter -C "${files[@]}"
}
zle -N ascii-art
bindkey -s '\ep' 'ascii-art^M'


# Alt+Shift+S to prepend "sudo " to line
function _insert_sudo {
prefix="sudo"
BUFFER="$prefix $BUFFER"
CURSOR=$(($CURSOR + $#prefix + 1))
}
zle -N insert-sudo _insert_sudo
bindkey "\eS" insert-sudo


# Alt+Shift+R Reset prompt
bindkey -s "\eR" "reset\n"


# Alt+A Command Bookmarks
# source ~/CLI/fzf-command-bookmarks.sh


# Cheat sheet Alt+H
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/cheat-fzf/cht-fzf.sh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/cheat-fzf/cht-fzf.sh"
function chtsh-fzf {
    cht-fzf
}
zle -N chtsh-fzf
bindkey "\eh" chtsh-fzf


# App cleaner / Uninstall
bindkey -s "\eu" "uninstall\n"


# Alt-Y Youtube FZF
# function youtubefzf {
# if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
# }
YTFZF_SELECTED_SUB=ru
YTFZF_ENABLE_FZF_DEFAULT_OPTS=1

function _youtubefzf {
    prefix="ytfzf"
    BUFFER="$prefix $BUFFER"
    CURSOR+=5
    zle accept-line
}
zle -N _youtubefzf
bindkey "\ey" _youtubefzf


function fzf-open {
    open "$(fzf)"
}
zle -N fzf-open
bindkey "\eo" fzf-open


# Alt+R Rename files in folder
function rename-files {
    mmv *
}
zle -N rename-files
bindkey "\er" rename-files


# # Alt+A App Launcher
# function _launcher {
    # launcher
# }
# zle -N _launcher
# bindkey "\ea" _launcher


bindkey -s '^D' ''


# Alt + Left / Right
bindkey "^[[1;9C" forward-word
bindkey "^[[1;9D" backward-word

# Copy / Paste

pb-copy-region () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | pbcopy
  ((REGION_ACTIVE = 0))
}
zle -N pb-copy-region
bindkey -e '\ec' pb-copy-region

pb-cut-region () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | pbcopy
  zle kill-region
}
zle -N pb-cut-region
bindkey -e '\ex' pb-cut-region

pb-yank () {
  CUTBUFFER=$(pbpaste)
  zle yank
}
zle -N pb-yank
bindkey '\ev' pb-yank


# Selection
shift-arrow() {
  ((REGION_ACTIVE)) || zle set-mark-command
  zle $1
}
shift-left()  shift-arrow backward-char
shift-right() shift-arrow forward-char
shift-up()    shift-arrow beginning-of-line
shift-down()  shift-arrow end-of-line
shift-alt-left()  shift-arrow backward-word
shift-alt-right() shift-arrow forward-word
zle -N shift-left
zle -N shift-right
zle -N shift-up
zle -N shift-down
zle -N shift-alt-left
zle -N shift-alt-right
bindkey "^[[1;2A" shift-up
bindkey "^[[1;2B" shift-down
bindkey "^[[1;2D" shift-left
bindkey "^[[1;2C" shift-right
bindkey "^[[1;10D" shift-alt-left
bindkey "^[[1;10C" shift-alt-right

delete-selection() {
  if ((REGION_ACTIVE)) then
     zle kill-region
  else
     zle backward-delete-char
  fi
}
zle -N delete-selection
bindkey -e "^?" delete-selection

select-all() {
    local buflen=$(echo -n "$BUFFER" | wc -m | bc)
    CURSOR=$buflen   # if this is messing up try: CURSOR=9999999
    zle set-mark-command
    while [[ $CURSOR > 0 ]]; do
        zle beginning-of-line
    done
}
zle -N select-all
bindkey -e "\ea" select-all


export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# print hex value of a number
hex() {
emulate -L zsh
if [[ -n "$1" ]]; then
printf "%x\n" $1
else
print 'Usage: hex <number-to-convert>'
return 1
fi
}

## Fish shell like syntax highlighting for Zsh
## @link: http://github.com/zsh-users/zsh-syntax-highlighting
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:export PATH="/usr/local/opt/m4/bin:$PATH"
#
# # Another syntax highlighting
source /opt/homebrew/Cellar/zsh-syntax-highlighting/0.8.0/zsh-syntax-highlighting.zsh

# # iTerm tab colors
# source ~/CLI/tabcolor.sh
# color() {
# it2-tab-color "#$(echo "#$(openssl rand -hex 3)" | sed 's/^.\{1\}//g')"
# }

# Aria2c daemon
sh /Users/Klutchevski/.config/Aria2.sh

ipp() {
  printf "Public IP: " >&2
  curl ipinfo.io/ip
}
ipl() {
  printf "Local IP: " >&2
  ifconfig | grep "inet " | grep -v 127.0.0.1 | head -n1 | cut -d' ' -f2
}
alias ip="ipl; ipp"

random_hex() { for i in $(seq 1 2); do echo -n $(echo "obase=16; $(($RANDOM % 16))" | bc | tr '[A-Z]' '[a-z]'); done; }
look_busy() { clear; while true; do head -n 500 /dev/urandom | hexdump -C | grep --color=auto "`random_hex` `random_hex`"; done; }


# Press `C-x H`, then some key combination for which you want the name of the
# zle function which is invoked, like `C-x h`, and you'll see something like:
#
#     "^Xh" is describe-key-briefly
# bindkey '\eh' describe-key-briefly

# export PS1=%B%F{green}%~/%f%b$'\n'
export PS1=%B%F{green}%~/%f%b

setopt hist_expire_dups_first # expire duplicate entries first when trimming history
setopt hist_find_no_dups      # do not display a line previously found
setopt hist_ignore_all_dups   # ignore all double commands in history
setopt hist_ignore_dups       # don't record an entry that was just recorded again
setopt hist_ignore_space      # don't add commands to history that start with space
setopt hist_reduce_blanks     # reduce blanks in history
setopt hist_save_no_dups      # don't write duplicate entries in the history file
setopt inc_append_history     # write to the history file immediately, not when the shell exits
setopt share_history          # share history between all sessions
# set +o prompt_cr +o prompt_sp
# unsetopt PROMPT_SP

setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""
