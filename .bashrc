# Alias
alias q='exit'
alias quit='exit'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

alias bell='echo -e "\a"'

alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'

alias l='ls -l'
alias lll='ls -l'
alias llll='la -l'
alias ls='ls --color=auto'
alias ks='ls'
alias la='ls -A'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias emacs='nvim' # Required neovim package 
alias vi='nvim'
alias vim='nvin'

alias top='htop'
alias df='df -h'

alias a='ansible'
alias en='source /usr/share/venv/ansible/bin/activate'
alias play='ansible-playbook'

# RLogin: 10秒以上かかったコマンドの完了時に通知音を鳴らす
__rlogin_precmd() {
    local exit_status=$?

    if [ -n "${__rlogin_cmd_start+x}" ]; then
        local elapsed=$((SECONDS - __rlogin_cmd_start))
        unset __rlogin_cmd_start

        if [ "$elapsed" -ge 10 ]; then
            printf '\033P#m T200 @11 O6 L16 CEGA >C4 \033\\'
        fi
    fi

    return "$exit_status"
}

# コマンド実行開始時刻を記録
trap 'if [ -z "${__rlogin_cmd_start+x}" ]; then __rlogin_cmd_start=$SECONDS; fi' DEBUG

# プロンプト表示前に経過時間を確認
PROMPT_COMMAND="__rlogin_precmd${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
