confirm() {
  printf "$1 (y/n): "; read choice
  case $choice in
    y|Y ) true;;
    n|N ) false;;
    * ) echo "Wrong answer, please enter y/n"; confirm "$1" ;;
  esac
}
