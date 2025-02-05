unbind x
unbind r
unbind s
unbind p

bind                 -N "New Window"                    |      new-window
bind                 -N "Split vertical"                \\     split-window -h -c "#{pane_current_path}"
bind                 -N "Split horizontal"              -      split-window -v -c "#{pane_current_path}"
bind                 -N "Close Pane"                    x      kill-pane
bind                 -N "Reload config"                 r      source $HOME/.config/tmux/tmux.conf
bind                 -N "Focus right Pane"              h      select-pane -L
bind                 -N "Focus bottom Pane"             j      select-pane -D 
bind                 -N "Focus top Pane"                k      select-pane -U
bind                 -N "Focus left Pane"               l      select-pane -R
bind                 -N "Create new Window from Pane"   +      break-pane -t :
bind                 -N "Switch session"                s      choose-tree -O "time" -s -Z
bind                 -N "Select previous Window"        BSpace last-window
bind              -r -N "Resize pane leftwards"         Left   resize-pane -L 1
bind              -r -N "Resize pane downwars"          Down   resize-pane -D 1
bind              -r -N "Resize pane upwards"           Up     resize-pane -U 1
bind              -r -N "Resize pane rightwards"        Right  resize-pane -R 1
bind -T copy-mode-vi -N "Exit copy mode with Escape"    Escape send -X cancel
bind -T copy-mode-vi -N "Start visual copy mode with v" v      send -X begin-selection
bind -T copy-mode-vi -N "Copy with y in copy mode"      y      send -X copy-selection

bind                 -N "Find paths in copy mode"       p      {
    copy-mode
    send-keys -X "search-backward" "([^ ]*/)([^/ ]*)"
    send-keys n
}
