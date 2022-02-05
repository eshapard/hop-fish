function hops
  if test (count $argv) -gt 0
    echo "Usage: hops"
  else
    set hc (set_color 'green')
    set ac (set_color 'brmagenta')
    set lc (set_color 'yellow')
    set -l file_list (command ls $HOPPATH)
    if test (count $file_list) -eq 0
      echo "No hops currently defined."
    else
      set -l hop_list
      for file in $file_list
        if test -d $HOPPATH/$file -a -L $HOPPATH/$file
          set hop_list $hop_list $file
        end
      end
      if test (count $hop_list) -eq 0
        echo "No hops currently defined."
      else
        set -l output ""
        for hop_name in $hop_list
          set -l real_path (readlink -f $HOPPATH/$hop_name)
          set output "$output$hc$hop_name $ac-> $lc$real_path"\n
        end
        echo $output | column -t
        echo (set_color normal)
      end
    end
  end
end
