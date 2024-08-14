# XDG Base Directories
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"


# XDG Patches
set -gx MPLAYER_HOME "$XDG_CONFIG_HOME/mplayer"
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -gx TIGRC_USER "$XDG_CONFIG_HOME/tig/tigrc"
alias svn 'snv --config-dir "$XDG_CONFIG_HOME/subversion"'

# XDG Patches - atom
set -gx ATOM_HOME "$XDG_DATA_HOME/atom"
mkdir -p "$XDG_CACHE_HOME/atom/compile-cache"
if [ ! -e "$XDG_DATA_HOME/atom/compile-cache" ] && [ -e "$XDG_DATA_HOME/atom" ];
	ln -s "$XDG_CACHE_HOME/atom/compile-cache" "$XDG_DATA_HOME/atom/compile-cache"
end


# XDG Patches - gradle
set -x GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"
# Move cache from XDG_DATA_HOME to XDG_CACHE_HOME
mkdir -p "$XDG_CACHE_HOME/gradle"
if [ ! -e "$XDG_DATA_HOME/gradle/caches" ] && [ -e "$XDG_DATA_HOME/gradle" ];
	ln -s "$XDG_CACHE_HOME/gradle" "$XDG_DATA_HOME/gradle/caches"
end

# XDG Patches - GnuPG
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
alias gpg 'gpg --homedir "$GNUPGHOME"'
alias gpg2 'gpg2 --homedir "$GNUPGHOME"'


# XDG Patches - wget
mkdir -p "$XDG_CACHE_HOME/wget"
set -gx WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
alias wget 'wget --hsts-file="$XDG_CACHE_HOME/wget/hosts"'


# XDG Patches - Python
set -gx IPYTHONDIR "$XDG_CONFIG_HOME/jupyter"
set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"
set -gx PYPIRC "$XDG_CONFIG_HOME/pip/pypirc"
set -gx PYTHONSTARTUP "$XDG_CONFIG_HOME/pythonstartup"
set -gx PYLINTHOME "$XDG_CACHE_HOME/pylint"
alias mypy 'mypy --cache-dir="$XDG_CACHE_HOME/mypy"'


# XDG Patches - Ruby
set -gx GEM_HOME "$XDG_DATA_HOME/gem"
set -gx GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"
# Patch the GEM_PATH variable with latest ruby
if command -v ruby &>/dev/null;
	set -l RUBY_VERSION (ruby --version | sed "s/.*\([0-9]\.[0-9]\)\.[0-9].*/\1.0/g")
	set -gx GEM_PATH "/usr/lib/ruby/gems/$RUBY_VERSION:$GEM_HOME/ruby/$RUBY_VERSION"
end
#set -x PATH $PATH "$GEM_HOME/bin"
# Patch the Ruby Bundler
set -gx BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME/bundle/config"
set -gx BUNDLE_USER_CACHE "$XDG_CACHE_HOME/bundle"
set -gx BUNDLE_USER_PLUGIN "$XDG_DATA_HOME/bundle"
mkdir -p (dirname $BUNDLE_USER_CONFIG) $BUNDLE_USER_CACHE $BUNDLE_USER_PLUGIN

# XDG Patches - Rust
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
# Move cache from XDG_DATA_HOME to XDG_CACHE_HOME
for dir in "registry" "binary-cache" "script-cache";
	if [ ! -e "$XDG_CACHE_HOME/cargo/$dir" ];
		mkdir -p "$XDG_CACHE_HOME/cargo/$dir"
		ln -s "$XDG_CACHE_HOME/cargo/$dir" "$XDG_DATA_HOME/cargo"
	end
end
for dir in "downloads" "tmp";
	if [ ! -e "$XDG_CACHE_HOME/rustup/$dir" ];
		mkdir -p "$XDG_CACHE_HOME/rustup/$dir"
		ln -s "$XDG_CACHE_HOME/rustup/$dir" "$XDG_DATA_HOME/rustup"
	end
end



# XDG Patches - npm
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"


# XDG Patches - Scala / Java
alias sbt='sbt -ivy "$XDG_DATA_HOME/ivy2" -sbt-dir "$XDG_DATA_HOME/sbt"'
alias mvn 'mvn -gs "$XDG_CONFIG_HOME/maven/settings.xml"'
# Move cache
mkdir -p "$XDG_CACHE_HOME/ivy2"
if [ ! -e "$XDG_DATA_HOME/ivy2/cache" ] && [ -e "$XDG_DATA_HOME/ivy2" ];
	ln -s "$XDG_CACHE_HOME/ivy2" "$XDG_DATA_HOME/ivy2/cache";
end



# XDG Patches - less
mkdir -p "$XDG_CACHE_HOME/less"
set -gx LESSKEY "$XDG_CONFIG_HOME/less/lesskey"
set -gx LESSHISTFILE "$XDG_CACHE_HOME/less/history"



# XDG Patches - R
mkdir -p "$XDG_CACHE_HOME/R"
set -gx R_ENVIRON "/etc/Renviron"
set -gx R_ENVIRON_USER "$XDG_CONFIG_HOME/R/Renviron"
set -gx R_LIBS_USER "$HOME/.local/lib/R/"
set -gx R_HISTFILE "$XDG_CACHE_HOME/R/history"
set -gx R_PROFILE_USER "$XDG_CONFIG_HOME/R/profile"
set -gx R_HOME_USER "$XDG_DATA_HOME/R"


# XDG Patch - git
mkdir "$XDG_CONFIG_HOME/git" -p
touch "$XDG_CONFIG_HOME/git/config"


# XDG Patch - TeXLive
set -gx TEXMFHOME "$XDG_DATA_HOME/texmf"


# XDG Patch - PyStow
set -gx PYSTOW_USE_APPDIRS true

# XDG Patch - CUDA
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/cuda/ComputeCache"
mkdir -p $CUDA_CACHE_PATH

# XDG Patch - rye
set -gx RYE_HOME "$XDG_DATA_HOME/rye"
mkdir -p $RYE_HOME
