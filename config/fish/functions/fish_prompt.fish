function fish_prompt
  set -l prompt_symbol '>'
  echo -s (set_color blue)(prompt_pwd) ' ' (set_color yellow) $prompt_symbol (set_color normal) ' '
end
