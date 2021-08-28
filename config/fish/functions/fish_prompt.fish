function fish_prompt
  set -g __fish_git_prompt_use_informative_chars
  set -g __fish_git_prompt_showdirtystate
  set -g __fish_git_prompt_showcolorhints
  echo
  echo (prompt_pwd) (fish_git_prompt)
  echo '> '
end

