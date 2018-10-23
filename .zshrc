setopt PROMPT_SUBST
# https://unix.stackexchange.com/questions/297578/how-to-update-prompt-on-directory-change#297700

git_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1; then
    color='%F{255}'
    if git diff --quiet 2>/dev/null >&2
      then
        color='%F{10}'
    else
      color='%F{196}'
    fi
  else
    return 0
  fi

  echo -ne $color
}

export PS1="[%F{214}20%D%F{255}|%F{214}%*%F{255}] %F{45}%d%F{255} $(git_color)$%F{255} "

# where
# PS1=prompt value in shell
# %F{214} is foreground (font) yellow/orange
# %D is the date in YY-MM-DD format
# %F{255} is font white
# %* is the time in HH:MM:SS 24-hour format
# %F{45} is font sky-blue
# %d is the current pwd

eval "$(rbenv init -)"
