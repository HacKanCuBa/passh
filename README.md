# Passh: a Pass fork

Pass is a simple password store. This fork changes a few things while trying to maintain most of it intact, specially the core idea. I will keep pulling pass commits, and also pushing my modifications to them.

Forked from https://git.zx2c4.com/password-store.

### About

This is a very simple password store that encrypts passwords using gpg and
places the encrypted password in a directory. It can generate new passwords
and keep track of old ones.

Please see the [man page](https://github.com/HacKanCuBa/passh/blob/master/man/pass.md) for documentation and examples: `man passh`

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

Currently, you need to clone this repo and install it manually:

        git clone https://github.com/HacKanCuBa/passh.git
        cd passh
        sudo make install

You can use it along with **pass** without inconvenient, and have them both installed at the same time. They both use the same password store and extensions, so you can switch from one to the other.

Do note however that some passh extensions can't be executed by pass, but every pass extension is executable by passh.

## Extensions

Some extensions I wrote and/or recommend.

### Passh

* [insert](https://github.com/HacKanCuBa/passh-extension-insert): provides a convenient solution to insert a file or password into the store, overriding native insert command.
* [init](https://github.com/HacKanCuBa/passh-extension-init): provides a convenient solution to init the store along with its git repo, overriding native init command.

### Pass

* [insertfile](https://github.com/HacKanCuBa/pass-extension-insertfile): provides a convenient solution to insert a file into the store.
* [initgit](https://github.com/HacKanCuBa/pass-extension-initgit): provides a convenient solution to init the store along with its git repo.

## Development

Currently working on branch [improve-extensions-support](https://github.com/HacKanCuBa/passh/tree/improve-extensions-support).

Ongoing changes from [pass-master](https://github.com/HacKanCuBa/passh/tree/pass-master), where main **pass** development is pulled:

* Modified the way commands are interpreted in the script: replaced a switch case selection to a more flexible eval'd one.
* Changed how extensions are handled: now extensions are loaded first, before iterpreting the command as an internal command. This allows extensions to override internal command. A helper function is provided so that an overrided function can still be called from the extension.
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
