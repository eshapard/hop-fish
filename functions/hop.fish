function hop
  if test (count $argv) -ne 1
    echo "Usage: jump <HOP_NAME>"
  else
    if test -d $HOPPATH/$argv[1] -a -L $HOPPATH/$argv[1]
      cd (readlink $HOPPATH/$argv[1])
    else
      echo "No such mark: $argv[1]"
    end
  end
end
