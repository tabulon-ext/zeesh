# color_switch zshfu plugin

# you can easily craft new themes using ansi escape codes
# save your new .theme in ~/.zsh/plugins/color_switch/themes
# ex to set the "black" color to #777777:
# echo -e "\e]4;00;#777777\a" | tr -d '\n' # black

# ansi color code chart:
# 00 - black
# 01 - red
# 02 - green
# 03 - yellow
# 04 - blue
# 05 - purple
# 06 - cyan
# 07 - light gray
# 08 - gray
# 09 - light red
# 10 - light green
# 11 - light yellow
# 12 - light blue
# 13 - light purple
# 14 - light cyan
# 15 - bold white

fpath=( ~/.zsh/plugins/color_switch/func $fpath )
autoload  _color_switch  _list_color_themes

# theme completion
compctl -K _list_color_themes _color_switch

# Alias for theme switcher
alias color_switch=_color_switch
alias color-switch=color_switch

# Load last theme
if [ -f ~/.zsh/local/color_switch.last ]; then
    local theme=$(cat ~/.zsh/local/color_switch.last | sed -e 's/^[ \t]*//')
    source ~/.zsh/plugins/color_switch/themes/$theme.theme  &!
    export COLOR_SWITCH_THEME=$theme
fi
