# ai-hayasaka.zsh-theme
#   @copyright None
#   @author Matthieu GOSSET
#   @maintainers
#     Matthieu GOSSET <matthieu.gosset.dev@outlook.com>
#   @purpose ...
#   @usage
#     Tested on `Fedora 38`.
#     Tested with terminal theme of VSCode using `IBM Carbon Color Theme`

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#   -> fino
#

# PERSONALIZATION -------------------------------
# Don't hesitate to personalize as much as you want using those vars

# COLORS ----------------------------------------
# Why Hayasaka ? Because I made it with a lil bit of yellow and blue, looks like the Kaguya-sama character.
# (Maybe I also watched the anime quite recently)

# Colors came from Material UI Design (best from my POV)
# BLOND: #FFE57F
# BLUE EYES: #40C4FF
# RED RIBON: #E57373
local keywords_prompt='%F{#9E9E9E}'
local arrow_prompt='%F{#E57373}'
local separator_prompt='%F{#888888}'
local cmd_prompt='%F{#40C4FF}'
local path_prompt='%F{#FFE57F}'
local git_prompt='%F{#40C4FF}'
local invalid_prompt='%F{#EF5350}'
local valid_command_prompt='%F{#40C4FF}'
local valid_prompt='%F{#00e676}'

# Fino used to print name and host, I didn't need them, but in case...
# local name_prompt='%F{#00FF99}'
# local host_prompt='%F{#26C6DA}'
# -----------------------------------------------

# KEYWORDS --------------------------------------
# COOL KAWAII CHARS: ♨, ♫, ⛁,  ҉, ⚿, ❆, ❄
local kawaii_char=' ⛁ '
local on_prompt='on'
local using_prompt='using'

# Same for those keyworkds used in name/host printing
# local at_prompt='at'
# local in_prompt='in'

# MAIN LINE CHARS
# COOL CHARS
# ⇁, ⇀, ━, ┅
local git_char_prompt='━'
local no_git_char_prompt=' '

# GIT DIRTY?
# COOL CHARS
# CROSS: ✖, ˟, 🕱, ☠, ⎇,
# CHECK: ✔, 🗸, 🗹, ⌥, ⏦, ⌲
local git_dirty=' ⎇'
local git_clean=' ⏦'

# SEPARATOR BETWEEN COMMANDS
local separator='
'
# -----------------------------------------------

# ARROW -----------------------------------------
# Linking characters

# NORMAL: ╭─, ╰──
# COOL ALTERNATIVE: ⌠, ⌡, ⎾, ⎿, ⎲, ⎳, ╔═, ╚═,, ╓, ╙
local top_arrow='╭─'
local bottom_arrow='╰─╼'
# -----------------------------------------------

# PATH ------------------------------------------
# I prefer short path, but you can put back long path:
#   `%c` for short path, `~%B` for long path
local path_printing='%c'
# -----------------------------------------------

# SPACING ---------------------------------------
local spacing_before_cmd_prompt=' '
# -----------------------------------------------

# I don't do ruby
function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function prompt_char {
  command git branch &>/dev/null && echo "${git_char_prompt}" || echo "${no_git_char_prompt}"
}

# OLD CODE TO PUT BACK IN PROMPT IF YOU WANT NAME / HOST BACK
# function box_name {
#   local box="${SHORT_HOST:-$HOST}"
#   [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
#   echo "${box:gs/%/%%}"
# }
# (${name_prompt}%n ${keywords_prompt}${at_prompt} ${host_prompt}$(box_name)${separator_prompt} ${in_prompt})

local ruby_env='$(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local virtualenv_info='$(virtualenv_prompt_info)'
local prompt_char='%(?:%{${valid_command_prompt}%}$(prompt_char):%{${invalid_prompt}%}$(prompt_char))%{$reset_color%}'

PROMPT="${separator_prompt}${separator}${arrow_prompt}${top_arrow} %B${path_prompt}%${kawaii_char}${path_printing}%{$reset_color%} ${git_info}${ruby_env}${virtualenv_info}
${arrow_prompt}${bottom_arrow}${cmd_prompt}${prompt_char}%{$reset_color%}${spacing_before_cmd_prompt}"

# KEYWORDS COLOR HERE
ZSH_THEME_GIT_PROMPT_PREFIX="${keywords_prompt}${on_prompt}%{$reset_color%} %B${git_prompt}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="${invalid_prompt}${git_dirty}"
ZSH_THEME_GIT_PROMPT_CLEAN="${valid_prompt}${git_clean}"

ZSH_THEME_RUBY_PROMPT_PREFIX=" ${keywords_prompt}${using_prompt}${git_prompt} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_VIRTUALENV_PREFIX=" ${keywords_prompt}${using_prompt}${git_prompt} «"
ZSH_THEME_VIRTUALENV_SUFFIX="»%{$reset_color%}"