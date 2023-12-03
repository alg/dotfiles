get_tmux_option() {
  local option value default
  option="$1"
  default="$2"
  value=$(tmux show-option -gqv "$option")

  if [ -n "$value" ]
  then
    if [ "$value" = "null" ]
    then
      echo ""

    else
      echo "$value"
    fi

  else
    echo "$default"

  fi
}

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

main() {
  IFS=\;
  local paths=$(get_tmux_option "@maildir_paths" "")
  local template=$(get_tmux_option "@maildir_template" "")

  if [ -z "$paths" ] || [ -z "$template" ]
  then
    echo "no paths or template"
    exit
  fi

  local paths_array=($paths)
  local index=1

  for path in $paths;
  do
    local maildir="$path"
    local count=0

    if [ -d "$maildir" ]
    then
      count=$(find "$maildir" -type f | wc -l | xargs)
    fi

    local placeholder="maildir_count_N"
    local var="{${placeholder/N/$index}}"

    template=${template/$var/$count}
    index=$((index + 1))
  done

  echo $template
}

main
