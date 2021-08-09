# dotfiles

## GNU Stow

Use [GNU Stow](https://www.gnu.org/software/stow/) to load configuration for
each package.

```shell
$ stow <package> # ex: stow nvim
```

## GNOME3

To save/load configuration for GNOME3, use `dconf`  

#### Save:
```shell
cd
dconf dump / > saved_settings.dconf
```

#### Load:
```shell
cd
dconf load / < saved_settings.dconf
```

## Node

Node versioning is handled through [Volta](https://volta.sh/).  

Here's a list of packages needed to be installed:

```
npm-check-updates serve netlify-cli
lerna
eslint eslint_d prettier
typescript typescript-language-server vls
```
