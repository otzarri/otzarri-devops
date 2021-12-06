# OST (Otzarri System Tools)

## Installation (AchLinux/Manjaro, Debian/Ubuntu)

```
$ bash -c "$(curl -s https://gitlab.com/josebamartos/ost/-/raw/master/installer/remote-install.sh)"
```

## Uninstallation

```
$ ost-uninstall.sh
```

## Tools

Tools are in [bin](bin) director and their respective config files are in [config](config) directory.

| Tool                            | Config                                    | Description                                                                     |
| ------------------------------- | ----------------------------------------- | ------------------------------------------------------------------------------- |
| [gitlab-init](bin/gitlab-init)  | [gitlab-init.cfg](config/gitlab-init.cfg) | Initializes git into current directory and pushes it to a new project in GitLab |
