if [[ "$isWs" == true ]]; then
  open() {
    local target_path=$(wslpath -r -s -w $1)
    (cd /mnt/c && /mnt/c/Windows/explorer.exe $target_path)
  }
fi