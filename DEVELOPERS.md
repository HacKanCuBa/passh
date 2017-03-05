# Developers

[![Ballmer "developers!"](https://passh.hackan.net/img/developers.png)](http://www.youtube.com/watch?v=V-FkalybggA "Developers")

This sections is intended for Passh developers and extensions developers.

## Developing Passh

Same as Pass, the idea is not to change the main core commands. If you think a command should do something different, simply develope an extension. However, fixes and improvements are very welcome. You can start by writing an [issue](https://github.com/hackancuba/passh/issues) and then, if you want to provide the solution, do a [pull request](https://github.com/hackancuba/passh/pulls) and [mark it as it that solves the issue](https://github.com/blog/1506-closing-issues-via-pull-requests). That's a general guideline for any kind of project.

Do not write changes directly to master. Create a new branch, do the necesary changes and then do the pull request. If you merge it first, make sure to use `--no-ff` (no fastforward).

## Developing extensions

### What is an extension?

An extension is a bash script file that extends the functionality of Passh. Check the ones I recommend at the appropiate section.

### How do I write one?

The filename is always `command.bash` where `command` is the command that triggers the extensions from Passh. I.E.: if your extension is named `insertfiles.bash` then it will be executed when the user issues `passh insertfile ...`.

There are two locations for extensions to be:

* in the system wide directory: */usr/lib/password-store/extensions/*
* in the user's password store: *.extensions/* inside the password store dir, which defaults to *~/.password-store/* (so, *~/.password-store/.extensions/*).

For an extensions to be used, it must exist in one of those two directories. If it exists in both, the one in the user's password store has priority and is loaded, where the other one is ommited.

Besides being there, it must have the executable bit on. This means issuing `chmod +x extension.bash`. Extensions without the executable bit on are ommited and won't be used by Passh.

#### Example extension

Here's a very simple extension, named `example.bash`. This is a very complete example:

```bash
#!/usr/bin/env bash
# An example extension
# License...

help_example()
{
    cat <<-_EOF
    $PROGRAM example
        This is an example extension.
_EOF    
}

usage_example() {
    cat <<-_EOF
Usage:
$(help_example)

More information may be found in the passh-example(1) man page.
_EOF
}

cmd_example()
{
    echo "This is an example extension. It does nothing but showing this..."
}

[[ "$1" == "help" || "$1" == "--help" || "$1" == "-h" ]] && usage_example && exit 0

cmd_example "$@"
```

There are two key functions here: `help_...()` and `cmd_...()`. The help function is used from Passh to show extensions help when `passh help` is issued. The cmd function is the command per se, and does whatever the extension needs to do. Note that the `cmd_...()` function is called at the end of the extension; Passh simply `source`s the file, nothing else.

### How do I write an extension for Passh or Pass?

Extensions are the same for both! That's the point. However, since Passh supports internal command override, an extension named, I.E., [init](https://github.com/HacKanCuBa/passh-extension-init), can only be used by Passh since Pass won't load it. But if you implement an extension with a non internal command, then it can be used by both. If you implement the help function, Passh will show the extension help; but if you don't, it will simply show a *no help available* message. Pass shows nothing so it doesn't care about any function.
