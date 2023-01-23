CD_TO_PROJECT_PATHS=($HOME/p)

_cd_to_project () {
    local path=$(fd -t d -d 1 . $CD_TO_PROJECT_PATHS | fzf)

    if [[ ! -z $path ]]; then
        cd $path
    fi
    
    zle reset-prompt
}

# Make widget from function
zle -N _cd_to_project

bindkey '^p' '_cd_to_project'
