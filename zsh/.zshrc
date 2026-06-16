export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# vi-mode config
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    printf '\e[2 q'
  else
    printf '\e[1 q'
  fi
}

precmd() {
  printf '\e[1 q'
}

zle -N zle-keymap-select

# /bin
export PATH="$HOME/.local/bin:$PATH"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--layout=reverse"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# java
export JAVA_HOME=/opt/homebrew/opt/openjdk
export PATH="$JAVA_HOME/bin:$PATH"

# c#
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# nvim
alias vim="nvim"

# obsidian
alias vaultpush="~/.config/scripts/vault-backup.sh"

# love2d
alias love="/Applications/love.app/Contents/MacOS/love"

# yt-dlp
alias mp4='yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" -o "~/Documents/Videos/%(title)s.%(ext)s"'
alias mp3='yt-dlp -f "bestaudio" --extract-audio --audio-format mp3 -o "~/Music/%(title)s.%(ext)s"'
alias wav='yt-dlp -f "bestaudio" --extract-audio --audio-format wav -o "~/Music/%(title)s.%(ext)s"'

# functions
nic() {
  local session_name="${1:-$(basename "$PWD")}"

  if [[ -n "$TMUX" ]]; then
    echo "Already in a tmux session. Detach first or run from outside tmux."
    return 1
  fi

  if tmux has-session -t "$session_name" 2>/dev/null; then
    tmux attach-session -t "$session_name"
    return
  fi

  tmux new-session -d -s "$session_name" -c "$PWD" -x "$(tput cols)" -y "$(tput lines)"
  tmux split-window -h -t "$session_name":1.0 -c "$PWD" -l 30%
  tmux send-keys -t "$session_name":1.0 'nvim' C-m
  tmux send-keys -t "$session_name":1.1 'claude' C-m
  tmux select-pane -t "$session_name":1.0
  tmux attach-session -t "$session_name"
}
