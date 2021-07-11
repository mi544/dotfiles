# dotfiles

To save/load configuration for GNOME3, use `dconf`  

#### Save:
```bash
cd
dconf dump / > saved_settings.dconf
```

#### Load:
```bash
cd
dconf load / < saved_settings.dconf
```
