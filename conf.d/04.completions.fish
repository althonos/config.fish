set -l COMPLETIONS_DIR "$XDG_CONFIG_HOME/fish/completions"


# rustup completion
if type -q rustup
	if [ ! -e "$COMPLETIONS_DIR/rustup.fish" ]
		rustup completions fish > "$COMPLETIONS_DIR/rustup.fish"
	end
end


# pip completion
if type -q pip
	if [ ! -e "$COMPLETIONS_DIR/pip.fish" ]
		pip completion --fish > "$COMPLETIONS_DIR/pip.fish"
	end
end

