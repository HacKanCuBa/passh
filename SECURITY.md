# Security notes on Passh

Some notes about security and secure practices with Passh. If you have questions or sugestions, please write an [e-mail](https://www.google.com/recaptcha/mailhide/d?k=01bt-LqbeJUffVVpvkr-XGtQ==&c=FkaqHW50ArpN6q7yFv1yASHVeJHBBpcEZj3SJvj0jVQ=) or open an [issue](https://github.com/hackancuba/passh/issues).

## Encryption

Passh's security is based on GPG. Passwords and files inserted into the storage are GPG encrypted, using parameters defined in the user's key configuration. This behavior can be modified by enviroment variable [`PASSWORD_STORE_GPG_OPTS`](/man.html#environment-variables), where options set there are passed directly to GPG.

I.E.: `PASSWORD_STORE_GPG_OPTS="--cipher-algo AES256 --digest-algo SHA512"`

## Authentication

Authentication is used by signing _.gpg-id_ file, extension files and (optionally) git commits. To enable authentication, the enviroment variable [`PASSWORD_STORE_SIGNING_KEY`](/man.html#environment-variables) must be set to the 40 hex-digit GPG key fingerprint used to sign (probably the same one used to encrypt), without spaces! Multiple keys can be set, separated by a single space.

I.E.: `PASSWORD_STORE_SIGNING_KEY=5D05EA ... 560BEABA`

## Storage model

The storage model is plain, so when you insert a password in, say, Webs/Facebook, a file is created in ~/.password-store/Webs/Facebook.gpg. This leaks meta data regarding user's sites and similar, so users must be very careful not publishing their storage. If git is used remotely, use a private git repository (gitlab is a good choice).

# Recommended settings regarding security

To ensure authentication and better encryption parameters, I recommend setting the following options:

* Ensure secure GPG options: `PASSWORD_STORE_GPG_OPTS="--cipher-algo AES256 --digest-algo SHA512"`
* Ensure store authentication: `PASSWORD_STORE_SIGNING_KEY=5D05EA ... 560BEABA`
* Ensure git authentication: run just once the following commands:
  * Set the git singing key `passh git config --local user.signingkey 5D05EA...560BEABA`
  * Set signing commits to true: `passh git config --local --bool pass.signcommits true`
* Ensure secure default password generation lenght: `PASSWORD_STORE_GENERATED_LENGTH=16`
* Reduce the time passwords stays on clipboard (in seconds, defaults to 45): `PASSWORD_STORE_CLIP_TIME=12`

Note: to get your GPG signing key 40 hex chars fingerprint, run `gpg -K --with-fingerprint`. Remember to remove spaces for the options above!

These options can either be set prior calling `passh`, as in `:~$ PASSWORD_STORE_GPG_OPTS="--cipher-algo AES256" passh` or using an alias like `alias passh='PASSWORD_STORE_GPG_OPTS="--cipher-algo AES256" passh'`, or better yet in your `.profile` or `.bashrc` or any other file that's executed when you open a terminal (check your terminal or distro man page).

## Example

Here's the content of my `.profile` file:

```bash
export PASSWORD_STORE_CLIP_TIME=12
export PASSWORD_STORE_SIGNING_KEY=5D05EA4EA22F4142A0FEC764292D1CD6560BEABA 
export PASSWORD_STORE_GPG_OPTS="--cipher-algo AES256 --digest-algo SHA512"
export PASSWORD_STORE_GENERATED_LENGTH=16
```

Then remember to execute just once:

```bash
:~$ passh git config --local --bool pass.signcommits true
:~$ passh git config --local user.signingkey 5D05EA4EA22F4142A0FEC764292D1CD6560BEABA
```

Git config stays in the git repository. Run it again for each git sub repository, if you have such. Check `man git` for more information.
