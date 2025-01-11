set -g @tpm_plugins '       \
    tmux-plugins/tpm        \
    jimeh/tmux-themepack    \
'

set -g @themepack               'powerline/double/purple'
set -g @powerline-color-main-1  '#AF6DF9'
set -g @powerline-color-main-2  '#AF6DF9'
set -g @powerline-color-main-3  '#61E2FF'

# Ensure tpm is installed
if "test ! -d $TMUX_CONFIG_FOLDER/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm $TMUX_CONFIG_FOLDER/plugins/tpm && $TMUX_CONFIG_FOLDER/plugins/tpm/bin/install_plugins'"

# Run tpm
run '$TMUX_CONFIG_FOLDER/plugins/tpm/tpm'
