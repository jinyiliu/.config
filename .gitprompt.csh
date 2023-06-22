# beautify prompt
set cg = "%{\033[1;32m%}" # green
set cb = "%{\033[1;34m%}" # blue
set cy = "%{\033[0;33m%}" # yellow
set c0 = "%{\033[0m%}"

setenv GIT_STATUS "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'"
set prompt = "$cg%n%u@%m $cb%c2 $cy`$GIT_STATUS`$c0%B»%b "
