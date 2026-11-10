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


if type -q ab-av1
        if [ ! -e "$COMPLETIONS_DIR/ab-av1.fish" ]
                ab-av1 print-completions fish > "$COMPLETIONS_DIR/ab-av1.fish"
        end
end
