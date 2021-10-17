# conda prompt @Jinyi
local conda_prompt='$(conda_prompt_info)'
conda_prompt_info() {
    if [ -n "$CONDA_DEFAULT_ENV" ]; then
        echo -n "%{$FG[040]%}($CONDA_DEFAULT_ENV) %{$reset_color%}"
    else
        echo -n ''
    fi
}

# terminal coloring
export CLICOLOR=1
export LSCOLORS=dxFxCxDxBxegedabagacad

local git_branch='$(git_prompt_info)%{$reset_color%}$(git_remote_status)'

PROMPT="%{$FG[040]%}╭─${conda_prompt}%{$FG[040]%}%n@%m %{$reset_color%}%{$terminfo[bold]$FG[226]%}%c %{$reset_color%}${git_branch}
%{$FG[040]%}╰○ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$FG[033]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$terminfo[bold]$FG[033]%})${FG[202]} ✘ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$terminfo[bold]$FG[033]%})${FG[040]} ✔ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%{$FG[239]%}("
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{$FG[239]%})%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" +"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=%{$FG[239]%}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" -"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=%{$FG[239]%}

