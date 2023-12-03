CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CHECK_SCRIPT="$CURRENT_DIR/maildir-check.sh"

show_maildir() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_maildir_icon" "#[fg=white]")"
  local color="$(get_tmux_option "@catppuccin_maildir_color" "$thm_gray")"
  local text="#( $CHECK_SCRIPT )"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}

