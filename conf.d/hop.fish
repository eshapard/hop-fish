if not set -q HOPPATH
  set -gx HOPPATH $HOME/.local/share/hop
  command mkdir -p $HOPPATH
end
