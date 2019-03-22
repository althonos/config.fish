alias ccat="ccat --bg=dark"
alias open="gio open"
alias ds="du -hxd1 . | sort -h"
alias gvfs-trash="gio trash"
alias mv="mv -i"
alias getpass="python -c 'import getpass; print(getpass.getpass())'"

function docker -w docker -d "Start `docker.service` if needed when docker is launched";
	if test -z (systemctl status docker | grep "Active: active");
		systemctl start docker
	end
	/usr/bin/docker $argv
end
