# add a dir to PATH if it exists and is not already in PATH
add_path() {
  dir="$1"
  [ -d "$dir" ] || return
  case ":$PATH:" in
    *:"$dir":*) ;;
    *) PATH="$PATH:$dir" ;;
  esac
}

add_path /opt/me/bin
