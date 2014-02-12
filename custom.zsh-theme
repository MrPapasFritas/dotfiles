# Grab the current date (%W) and time (%t):
TIME_="%{$fg_bold[yellow]%}%T%{$reset_color%}"

# Grab the current machine name 
MACHINE_="%{$fg[blue]%}%m%{$reset_color%}"

# Grab the current username 
CURRENT_USER_="%{$fg_bold[blue]%}%n%{$reset_color%}"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
LOCA_="%c"
GIT_="\$(git_prompt_info)%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[red]%}"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"

# Do nothing if the branch is clean (no changes).
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# Add 3 cyan ✗s if this branch is diiirrrty! Dirty branch!
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗✗✗"

ARROW_INDEX_="%{$fg[blue]%}>%{$reset_color%}> "

# Put it all together!
PROMPT="[$CURRENT_USER_ at $MACHINE_] [$LOCA_] [$TIME_] $GIT_
$ARROW_INDEX_"
