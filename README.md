# Passh: a Pass fork

Pass is a simple password store. This fork changes a few things while trying to maintain most of it intact, specially the core idea. I will keep pulling pass commits, and also pushing my modifications to them.

Forked from https://git.zx2c4.com/password-store.

## About

This is a very simple password store that encrypts passwords using gpg and places the encrypted password in a directory. It can generate new passwords and keep track of old ones.

Please see the [man page](https://github.com/HacKanCuBa/passh/blob/master/man/passh.md) for documentation and examples: `man passh`.

Depends on:
- bash
  http://www.gnu.org/software/bash/
- GnuPG2
  http://www.gnupg.org/
- git
  http://www.git-scm.com/
- xclip
  http://sourceforge.net/projects/xclip/
- tree >= 1.7.0
  http://mama.indstate.edu/users/ice/tree/
- GNU getopt
  http://www.kernel.org/pub/linux/utils/util-linux/
  http://software.frodo.looijaard.name/getopt/
- qrencode
  https://fukuchi.org/works/qrencode/

The original project page is: https://www.passwordstore.org/

### Installing

Check install guide in **[latest release](https://github.com/HacKanCuBa/passh/releases/latest)**. Remember to satisfy dependencies indicated above.

You can use **passh** along with **pass** without inconvenient, and have them both installed at the same time. They both use the same password store and extensions, so you can switch from one to the other. Do note, however, that some passh extensions can't be executed by pass, but every pass extension is executable by passh.

#### Install bleeding-edge

Always prefer downloading [releases](https://github.com/HacKanCuBa/passh/releases), since those are signed and verified to work. However, if you want the bleeding-edge version, clone or download this repo and run `make install` as a privileged user:

    wget https://github.com/hackancuba/passh/archive/master.zip
    unzip master.zip
    cd passh-master
    make test && sudo make install

It's a good practice to run `make test` prior installing, to be sure that passh is working correctly.

If you don't want to `sudo make install`, you can simply copy `src/password-store.sh` to `/usr/bin/passh`. Optionally, check completion helpers in `src/completion` and man page at `man/passh.1`

### Uninstalling

Go to the same directory from where it was installed, or download the same release, and run `sudo make uninstall`:

    cd passh
    sudo make uninstall

### Testing

Clone the git repo or download latest release and run `make test` inside the directory:

    cd passh
    make test

## Extensions

A [curated list](https://github.com/HacKanCuBa/passh/blob/master/EXTENSIONS.md) of some extensions I wrote and/or recommend.

## Security notes

Check the [security notes](https://github.com/HacKanCuBa/passh/blob/master/SECURITY.md) on Passh.

## Navigating this repo

### [contrib](https://github.com/HacKanCuBa/passh/tree/master/contrib)

Scripts like menus, importers to import data from other passwords managers and stuff contributed to the pass project.

### [man](https://github.com/HacKanCuBa/passh/tree/master/man)

The man page and a [markdown version](https://github.com/HacKanCuBa/passh/blob/master/man/passh.md) for online viewing.

### [src](https://github.com/HacKanCuBa/passh/tree/master/src)

Passh source code (password-store.sh) and some helper scripts like completion and platform adapt.

### [tests](https://github.com/HacKanCuBa/passh/tree/master/tests)

Test files based on [Sharness](https://github.com/chriscool/sharness), they are named like `tNNNN-description.sh`. Simply run them individually like `./tests/tNNNN-description.sh` (optionally pass `-v` to make it verbose), or  `make test` from the main directory as explained [above](#testing) to run them all.

## Development

### Contributing

Read the [Developers](DEVELOPERS.md) section.

Since I pull changes done to pass, you might want to start [contributing there](https://www.passwordstore.org). Otherwise, you are very welcome to write an issue here, or fork and then do a pull request.

### Changes from pass-master

Rough changes from [pass-master](https://github.com/HacKanCuBa/passh/tree/pass-master), where main **pass** development is pulled:

* Rebranded pass to passh.
* Modified the way commands are interpreted in the script: replaced the switch case selection to a more flexible eval'd one.
* Changed how extensions are handled: now extensions are loaded first, before interpreting the command as an internal command. This allows extensions to override internal commands. A helper function is provided so that an overridden function can still be called from the extension.
* Issuing help command now shows help from the extensions if they implement a function named help_{extension name}(). Otherwise, it will list enabled extensions as commands.

## License

**Pass** is made by [Jason Donenfeld](mailto:Jason@zx2c4.com) and licensed under GNU GPL v2.0. **Passh** is made by [HacKan](https://hackan.net) under GNU GPL v3.0+.

    Copyright (C) 2017 HacKan (https://hackan.net)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
