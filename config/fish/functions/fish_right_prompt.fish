function fish_right_prompt
  set -g __fish_git_prompt_showdirtystate
  set -g __fish_git_prompt_showcolorhints
  set -g __fish_git_prompt_showstashstate
  set -g __fish_git_prompt_use_informative_chars

  echo -s (fish_git_prompt)
end
