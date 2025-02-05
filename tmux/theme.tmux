set  -ogq @c_fg        "#8ba7a7"
set  -ogq @c_bg        "#262335"
set  -ogq @c_bgdark    "#241b2f"
set  -ogq @c_cyan      "#61e2ff"
set  -ogq @c_green     "#72f1b8"
set  -ogq @c_orange    "#ff8b39"
set  -ogq @c_pink      "#fc199a"
set  -ogq @c_purple    "#af6df9"
set  -ogq @c_red       "#fe4450"
set  -ogq @c_yellow    "#ffcc00"
set  -ogq @c_comment   "#495495"
set  -ogq @c_cursor_fg "#282a36"
set  -ogq @c_selection "#463465"
set  -ogq @c_separator "#8c57c7"

set  -ogq @window_pill_ends_style "#[fg=#{@c_bg},bg=default]"
set  -ogq @window_body_style "#[fg=#{@c_purple},bg=#{@c_bg}]"
set  -ogq @current_window_pill_ends_style "#[fg=#{@c_selection},bg=default]"
set  -ogq @current_window_body_style "#[fg=#{@c_cyan},bg=#{@c_selection}]"

# General
set  -g   visual-activity               off
set  -g   visual-bell                   off
set  -g   visual-silence                off
set  -g   bell-action                   none
setw -g   monitor-activity              off

# Panes
set  -wgF pane-active-border-style      "fg=#{@c_cyan}"
set  -wgF pane-border-style             "fg=#{@c_comment}"
set  -g   pane-border-lines             "heavy"
set  -g   pane-border-indicators        "off"

# Popups
set  -gF  popup-style                   "fg=#{@c_fg}"
set  -gF  popup-border-style            "fg=#{@c_purple}"

# Messages and Commands
set  -gF  message-style                 "fg=#{@c_cursor_fg},bg=#{@c_orange}"
set  -gF  message-command-style         "fg=#{@c_cursor_fg},bg=#{@c_orange}"

# Menus
set  -gF  menu-style                    "fg=#{@c_fg}"
set  -gF  menu-border-style             "fg=#{@c_purple}"
set  -gF  menu-selected-style           "fg=#{@c_fg},bg=#{@c_selection}"

# Status bar
set  -gF  window-status-activity-style  "bg=#{@c_green},fg=#{@c_fg}"
set  -gF  window-status-bell-style      "bg=#{@c_orange},fg=#{@c_fg}"

set  -gF  status-style                  "fg=#{@c_fg}"
set  -g   status-justify                "left"
set  -ag  status-position               "top"

set  -gF  window-status-style           "fg=default,bg=default,align=centre"
set  -gF  window-status-current-style   "fg=default,bg=default,align=centre"

set  -gF  window-status-format          "#{E:@window_pill_ends_style}#{E:@window_body_style}"
set  -ga  window-status-format          "#I #W"
set  -gaF window-status-format          "#{E:@window_pill_ends_style}"

set  -gF  window-status-current-format  "#{E:@current_window_pill_ends_style}#{E:@current_window_body_style}"
set  -ga  window-status-current-format  "#I #W"
set  -gaF window-status-current-format  "#{E:@current_window_pill_ends_style}"

set  -g   status-right                  ""
set  -gF  status-left-style             "fg=#{@c_yellow}"
set  -g   status-left                   " #S  "

set  -gF  mode-style                    "fg=#{@c_fg},bg=#{@c_selection}"
set  -gF  copy-mode-match-style         "fg=#{@c_orange},bg=#{@c_selection}"
set  -gF  copy-mode-current-match-style "fg=#{@c_green},bg=#{@c_selection}"
# Available on main not released yet
# set  -gF  copy-mode-position-format "$[fg=#{@c_cursor_fg},bg=#{@c_cyan}] COPY "
# set  -gF  copy-mode-position-style "fg=#{@c_cursor_fg},bg=#{@c_cyan}"
# set  -gF  copy-mode-selection-style      "fg=#{@c_fg},bg=#{@c_selection}"

# Unsure if I want those
# They also do not live reload work all too well...
# set -gF pane-border-format " #P #{pane_current_command} "
# set -gF pane-border-status bottom

