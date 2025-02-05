set -g @tpm_plugins '       \
    tmux-plugins/tpm        \
'

# Ensure tpm is installed
if "test ! -d $TMUX_CONFIG_FOLDER/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm $TMUX_CONFIG_FOLDER/plugins/tpm && $TMUX_CONFIG_FOLDER/plugins/tpm/bin/install_plugins'"

# Run tpm
run '$TMUX_CONFIG_FOLDER/plugins/tpm/tpm'
