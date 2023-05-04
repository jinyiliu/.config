setenv GIT_STATUS "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'"
set prompt = "$cg%n%u@%m $cb%c2 $cy`$GIT_STATUS`$c0%B»%b "
