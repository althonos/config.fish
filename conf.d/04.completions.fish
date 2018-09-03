set -l COMPLETIONS_DIR "$XDG_CONFIG_HOME/fish/completions"


# rustup completion
if [ ! -e "$COMPLETIONS_DIR/rustup.fish" ];
	rustup completions fish > "$COMPLETIONS_DIR/rustup.fish"
end


# pip completion
if [ ! -e "$COMPLETIONS_DIR/pip.fish" ];
	pip completion --fish > "$COMPLETIONS_DIR/pip.fish"
end


