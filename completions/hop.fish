# SYNOPSIS
#   Completions for hop functions.

#complete -c hop -f -a '(command ls ~/.hop)'
#complete -c rmhop -f -a '(command ls ~/.hop)'
complete -c hop -f -a '(command ls $HOPPATH)'
complete -c rmhop -f -a '(command ls $HOPPATH)'
