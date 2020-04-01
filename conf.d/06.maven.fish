if [ ! -e "$XDG_CONFIG_HOME/maven/settings.xml" ];
        set CFG "$XDG_CONFIG_HOME/maven/settings.xml"
	echo '<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0">'   > $CFG
	echo "  <localRepository>$XDG_CACHE_HOME/maven/</localRepository>" > $CFG
	echo '</settings>'                                                 > $CFG
end
