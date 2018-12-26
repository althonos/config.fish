# Use pkgconf
set -gx PKG_CONFIG "/usr/bin/pkgconf"

# Rust
#set -x RUSTC_WRAPPER "sccache"
set -x RUST_TARGET_PATH "$RUSTUP_HOME/targets"
set -x CARGO_INSTALL_ROOT "$HOME/.local"

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
