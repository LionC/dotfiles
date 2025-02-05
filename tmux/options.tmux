# Windows
set     -g  renumber-windows    on
set     -g  automatic-rename    on
set     -g  base-index          1
setw    -g  pane-base-index     1
setw    -g  mode-keys           vi
set     -g  allow-rename        off
set     -sg escape-time         10
set     -g  focus-events        on
set     -g  mouse               on
set     -g  status-keys         vi
set     -g  history-limit       10000
set     -g  display-panes-time  10000
set     -g  display-time        2800
set     -g  exit-empty          off
set     -g  exit-unattached     off
set     -g  status-interval     1
# True Colors
#set     -g  default-terminal    "tmux-256color"
set     -ag terminal-overrides  ",*:RGB"
