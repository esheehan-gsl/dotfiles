function prompt {
  # Load first line of git status for branch info
  local st=$(git status --porcelain -b 2>/dev/null | head -n 1)

  # An empty string means we're not in a git repo and can skip this part
  if [[ -n $st ]]; then
    local branchname=$(echo $st | sed -nE "s/^## ([^.]+).*/\1/p")

    # Add count of commits we are ahead
    local ahead=$(echo $st | sed -nE "s/^##.*ahead ([0-9]+).*/\1/p")
    if [[ -n $ahead ]]; then
      ahead=" \[\e[0;31m\]▲$ahead"
    fi

    # Add count of commits we are behind
    local behind=$(echo $st | sed -nE "s/^##.*behind ([0-9]+).*/\1/p")
    if [[ -n $behind ]]; then
      behind=" ▼$behind"
    fi

    # Count number of changed/unstaged files
    local delta=$(git status --porcelain -b | wc -l)
    if [[ $delta -gt 1 ]]; then
      local dirty=$(printf " \[\e[0;31m\]𝚫%d" $(($delta - 1)))
    fi

    # Forat the git message
    local git_msg="[\[\e[0;32m\]$branchname$behind$ahead$dirty\[\e[m\]] "
  fi

  # Build a string for the CWD by replacing $HOME with ~
  local CWD=${PWD/$HOME/'~'}
  
  # Tokenize path
  IFS="/" read -a NODES <<< $(sed -E "s/^\/?(.*)\/?$/\1/" <<< $CWD)
  
  # Truncate long paths by inserting an ellipsis instead of enumerating
  # full path
  if [[ ${#NODES[@]} -gt 3 ]]; then
    local IDX=$(expr ${#NODES[@]} - 1)
    local CWD=${NODES[0]}"/…/"${NODES[$IDX]}
    
    if [[ ${NODES[0]} != "~" ]]; then
      local CWD="/"$CWD
    fi
  fi
  
  if [[ -n "$VIRTUAL_ENV" ]]; then
    local env_name="("`basename $VIRTUAL_ENV`") "
  fi
  
  # Set prompt, using echo to ensure that unicode character at the end is
  # printed correctly in the terminal
  export PS1=$(echo -e "$CWD $git_msg$env_name\xC2\xA7 ")
}

export PROMPT_COMMAND=prompt
