![][license-badge]

<br>

# 🐟️+🐰 = Hop Fish

A port of [Jeroen Janssens' "jump" utility][jump] to the fish shell. Forked from [oh-my-fish/plugin-jump][plugin-jump] and modified by eshapard.

## Description 🐰

Provides a quick way to 'hop' to directories in the [Fish Shell][fish-shell] without having to type out a long and cumbersome path.

e.g. Instead of typing `cd ~/some/very/deep/often-used/directory`, you can simply type `hop mydir` or something like that and get there instantly. 👍️

## Installation

To Install:
```
git clone https://github.com/eshapard/hop-fish.git
cd hop-fish
chmod +x install
./install
```

### Uninstall

To Uninstall:
```
find ~/.config/fish/ -name "hop.fish" -delete
rm ~/.config/fish/functions/hops.fish
rm ~/.config/fish/functions/mkhop.fish
rm ~/.config/fish/functions/rmhop.fish
```

## Usage

The functions work by making symbolic links to directories and storing them in the `$HOPPATH` directory. If you're new to linux and don't know what [symbolic links][symbolic-links] are, then you should learn about them because they're very useful! But if you use the Fish shell, then odds are, you aren't new to linux and know all about them.

To make a 'hop', navigate to the directory you'd like to be able to hop to quickly, and use the command `mkhop <hopname>` (replace *<hopname>* with a short memorable nickname). Or, you can create a hop from anywhere to any directory using the command `mkhop hopname path/to/target/dir`.

To remove a hop, just use the command `rmhop <hopname>`

If you forget what hops you've created, use the command `hops` to list them.

Finally, to hop to one of your hops, just use the command `hop <hopname>` and you'll instantly be taken there. The included fish completions file will allow you to use the fish shell's tab-completions with the `hop` command. e.g. If you have a hop named `easter`, then typing `hop ea<tab>` will fill in the rest of the word.

## Changes 🍁

I've changed the original fish implementation of `jump` in the following ways:

* Renamed `jump` to `hop` saving a letter's worth of typing and making it slightly easier to type on the dvorak layout.
* Renamed associated `mark` and `unmark` to the more unixy and more obviously related `mkhop` and `rmhop`
* Altered the completions file to use the $HOPPATH environment variable, instead of a hard-coded path
* Set default path for 'hops' to .local/share/hop (personal preference to not litter the home dir with dot files)
* Fixed `marks` (renamed to `hops`) so that it shows the true path of each hop instead of its symbolic path and added some goldfish colors 🐟️ 
* Created an install script for use outside of [oh-my-fish][omf-link]

## Configuration ⚙️

### hop directory

The location of the hop directory (where all your hops/symbolic links are stored) is stored in the environment variable `HOPPATH`.

If you want to change the location of the hop directory, you can add the following to your `~/.config/fish/before.init.fish`.

```
set -gx HOPPATH YOUR_CUSTOM_FOLDER_PATH_HERE
```

Or, of course, just edit the default path in `~/.config/fish/conf.d/hop.fish`

### hops colors 🌈

You can change the colors of the `hops` command by editing the `~/.config/fish/functions/hops.fish` file. 

* hc = hop color; the color of the hop's name
* ac = arrow color
* pc = path color; the color of the linked path

See the fish documentation on [set_color][set-color] for color options.

# License

[MIT][mit] © [bpinto][author] et [al][contributors]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/bpinto
[contributors]:   https://github.com/oh-my-fish/plugin-rbenv/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[jump]:           http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
[plugin-jump]:    https://github.com/oh-my-fish/plugin-jump
[fish-shell]:     https://fishshell.com
[set-color]:      https://fishshell.com/docs/current/cmds/set_color.html
[symbolic-links]: https://linuxhandbook.com/symbolic-link-linux/
