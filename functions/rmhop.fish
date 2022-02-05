function rmhop
  if test (count $argv) -eq 0
    echo "Usage: rmhop <HOP_NAME>..."
  else
    for hop_name in $argv
      if test -d $HOPPATH/$hop_name -a -L $HOPPATH/$hop_name
        command rm -i $HOPPATH/$hop_name
      else
        echo "No such hop: $hop_name"
      end
    end
  end
end
