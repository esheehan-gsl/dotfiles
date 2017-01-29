function git_summary() {
  if [[ -e $1 ]]; then
    return
  fi

  echo $_branch
}

function prompt {
  local st=$(git status --porcelain -b 2>/dev/null | head -n 1)

  if [[ -n $st ]]; then
    local branchname=$(echo $st | sed -nE "s/^## ([^.]+).*/\1/p")

    local ahead=$(echo $st | sed -nE "s/^##.*ahead ([0-9]+).*/\1/p")
    if [[ -n $ahead ]]; then
      ahead=" \[\e[0;31m\]▲$ahead"
    fi

    local behind=$(echo $st | sed -nE "s/^##.*behind ([0-9]+).*/\1/p")
    if [[ -n $behind ]]; then
      behind=" ▼$behind"
    fi

    local delta=$(git status --porcelain -b | wc -l)
    if [[ $delta -gt 1 ]]; then
      printf -v dirty " \[\e[0;31m\]𝚫%d" $(($delta - 1))
    fi

    local git_msg="[\[\e[0;32m\]$branchname$behind$ahead$dirty\[\e[m\]] "
  fi

  export PS1="\w $git_msg "
}

export PROMPT_COMMAND=prompt
