# Use pkgconf
set -gx PKG_CONFIG "/usr/bin/pkgconf"

# Rust
#set -x RUSTC_WRAPPER "sccache"
set -x RUST_TARGET_PATH "$RUSTUP_HOME/targets"
set -x CARGO_INSTALL_ROOT "$HOME/.local"

# Ruby
if command -v ruby &>/dev/null
	set -gx GEM_PATH (ruby -r rubygems -e 'puts Gem.user_dir')
	set -gx PATH "$GEM_PATH/bin" "$GEM_HOME/bin" $PATH
end

# Vita SDK
set -x VITASDK "$XDG_DATA_HOME/vitasdk"
set -x AR_armv7_vita_eabi "arm-vita-eabi-ar"
set -x CC_armv7_vita_eabi "arm-vita-eabi-gcc"
set -x CXX_armv7_vita_eabi "arm-vita-eabi-g++"

# Miscellaneous
set -x EDITOR nano
set -x VISUAL nano

# Path extension
set -x PATH "$HOME/.local/bin" "$HOME/.local/scripts" "$VITASDK/bin" $PATH

# Fix electron trash command
set -gx ELECTRON_TRASH "gio"

# devkitPro
set -gx DEVKITPRO "/opt/devkitpro"
set -x PATH "$DEVKITPRO/tools/bin" "$DEVKITPRO/devkitA64/bin" $PATH

# disable virtualenv prompt since BobTheFish has one
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# disable pip error about "breaking system packages" even with --user install
set -x PIP_BREAK_SYSTEM_PACKAGES 1
