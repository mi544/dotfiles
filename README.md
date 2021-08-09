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
