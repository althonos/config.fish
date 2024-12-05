if [ ! -e "$NPM_CONFIG_USERCONFIG" ];
	mkdir -p (dirname "$NPM_CONFIG_USERCONFIG")
	echo "prefix=$XDG_DATA_HOME/npm"                           >  "$NPM_CONFIG_USERCONFIG"
	echo "cache=$XDG_CACHE_HOME/npm"                           >> "$NPM_CONFIG_USERCONFIG"
	echo "tmp=$XDG_RUNTIME_DIR/npm"                            >> "$NPM_CONFIG_USERCONFIG"
	echo "init-module=$XDG_CONFIG_HOME/npm/config/npm-init.js" >> "$NPM_CONFIG_USERCONFIG"
end
