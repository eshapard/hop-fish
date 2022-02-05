if not set -q HOPPATH
  set -gx HOPPATH $HOME/.hop
  command mkdir -p $HOPPATH
end
