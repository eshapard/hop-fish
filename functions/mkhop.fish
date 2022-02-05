function mkhop
  if test (count $argv) -eq 0 -o (count $argv) -gt 2
    echo "Usage: mkhop <HOP_NAME> [DIRECTORY]"
  else if test -e $HOPPATH/$argv[1]
    if test -d $HOPPATH/$argv[1] -a -L $HOPPATH/$argv[1]
      echo "A hop named $argv[1] already exists."
    else
      echo "$HOPPATH/$argv[1] already exists."
    end
  else if test (count $argv) -eq 1
    command ln -s (pwd) $HOPPATH/$argv[1]
  else if test (count $argv) -eq 2
    if test -d $argv[2]
      set -l current_dir (pwd)
      cd $argv[2]
      command ln -s (pwd) $HOPPATH/$argv[1]
      cd $current_dir
    else
      echo "$argv[2] is not a valid directory."
    end
  end
end
