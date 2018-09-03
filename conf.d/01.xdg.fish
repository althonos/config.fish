# XDG Base Directories
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"


# XDG Patches
set -x MPLAYER_HOME "$XDG_CONFIG_HOME/mplayer"
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -x TIGRC_USER "$XDG_CONFIG_HOME/tig/tigrc"
alias svn 'snv --config-dir "$XDG_CONFIG_HOME/subversion"'


# XDG Patches - atom
set -x ATOM_HOME "$XDG_DATA_HOME/atom"
mkdir -p "$XDG_CACHE_HOME/atom/compile-cache"
if [ ! -e "$XDG_DATA_HOME/atom/compile-cache" ];
	ln -s "$XDG_CACHE_HOME/atom/compile-cache" "$XDG_DATA_HOME/atom/compile-cache"
end


# XDG Patches - gradle
set -x GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"
# Move cache from XDG_DATA_HOME to XDG_CACHE_HOME
mkdir -p "$XDG_CACHE_HOME/gradle"
if [ ! -e "$XDG_DATA_HOME/gradle/caches" ];
	ln -s "$XDG_CACHE_HOME/gradle" "$XDG_DATA_HOME/gradle/caches"
end


# XDG Patches - wget
mkdir -p "$XDG_CACHE_HOME/wget"
set -x WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
alias wget 'wget --hsts-file="$XDG_CACHE_HOME/wget/hosts"'


# XDG Patches - Python
set -x IPYTHONDIR "$XDG_CONFIG_HOME/jupyter"
set -x JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"
set -x PYPIRC "$XDG_CONFIG_HOME/pip/pypirc"
set -x PYTHONSTARTUP "$XDG_CONFIG_HOME/pythonstartup"
set -x PYLINTHOME "$XDG_CACHE_HOME/pylint"
alias mypy 'mypy --cache-dir="$XDG_CACHE_HOME/mypy"'


# XDG Patches - Ruby
set -x GEM_HOME "$XDG_DATA_HOME/gem"
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"


# XDG Patches - Rust
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
# Move cache from XDG_DATA_HOME to XDG_CACHE_HOME
for dir in "registry" "binary-cache" "script-cache";
	if [ ! -e "$XDG_DATA_HOME/cargo/$dir" ];
		mkdir -p "$XDG_CACHE_HOME/cargo/$dir"
		ln -s "$XDG_CACHE_HOME/cargo/$dir" "$XDG_DATA_HOME/cargo"
	end
end


# XDG Patches - npm
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"


# XDG Patches - Scala / Java
alias sbt='sbt -ivy "$XDG_DATA_HOME/ivy2" -sbt-dir "$XDG_DATA_HOME/sbt"'
alias mvn 'mvn -gs "$XDG_CONFIG_HOME/maven/settings.xml"'
# Move cache
mkdir -p "$XDG_CACHE_HOME/ivy2"
if [ ! -e "$XDG_DATA_HOME/ivy2/cache" ];
	ln -s "$XDG_CACHE_HOME/ivy2" "$XDG_DATA_HOME/ivy2/cache";
end



# XDG Patches - less
mkdir -p "$XDG_CACHE_HOME/less"
set -x LESSKEY "$XDG_CONFIG_HOME/less/lesskey"
set -x LESSHISTFILE "$XDG_CACHE_HOME/less/history"
