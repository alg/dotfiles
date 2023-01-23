# === Prompt ===

local user_host='%{$terminfo[bold]%F{2}%}%n%{$reset_color%}'
local current_dir='%{$terminfo[bold]%F{2}%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]%F{5}%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY='*'

PROMPT="
${user_host}:${current_dir} ${git_branch}
 → "

# === Right prompt ===

# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# RPS1="${return_code}"

